<?php
    /********************************************************
     *      @author Kyler You <QQ:2444756311>
     *      @link http://mp.weixin.qq.com/wiki/home/index.html
     *      @version 2.0.1
     *      @uses $wxApi = new WxApi();
     *      @package 微信API接口 陆续会继续进行更新
     ********************************************************/

    class WxApi {

        public $appId         = '';
        public $appSecret     = "";
        public $mchid         = ""; //商户号
        public $privatekey    = ""; //私钥

        public $parameters  = array();

        public function __construct(){
            $this->appId        = C('appId');
            $this->appSecret    = C('appSecret');
            $this->mchid        = C('mchid');
            $this->privatekey   = C('privatekey');
        }

        /****************************************************
         *  微信提交API方法，返回微信指定JSON
         ****************************************************/

        public function wxHttpsRequest($url,$data = null){
            $curl = curl_init();
            //curl_setopt($curl, CURLOPT_SAFE_UPLOAD, false);
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
            if (!empty($data)){
                curl_setopt($curl, CURLOPT_POST, 1);
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            }
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            $output = curl_exec($curl);
            file_put_contents('./data/Runtime/Data/wxoutput.json', $output);
            curl_close($curl);
            return $output;
        }

        /****************************************************
         *  微信带证书提交数据 - 微信红包使用
         ****************************************************/

        public function wxHttpsRequestPem($url, $vars, $second=30,$aHeader=array()){
            $ch = curl_init();
            //超时时间
            curl_setopt($ch,CURLOPT_TIMEOUT,$second);
            curl_setopt($ch,CURLOPT_RETURNTRANSFER, 1);
            //这里设置代理，如果有的话
            //curl_setopt($ch,CURLOPT_PROXY, '10.206.30.98');
            //curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
            curl_setopt($ch,CURLOPT_URL,$url);
            curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false);
            curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,false);

            //以下两种方式需选择一种

            //第一种方法，cert 与 key 分别属于两个.pem文件
            //默认格式为PEM，可以注释
            curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
            curl_setopt($ch,CURLOPT_SSLCERT,getcwd().'/apiclient_cert.pem');
            //默认格式为PEM，可以注释
            curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
            curl_setopt($ch,CURLOPT_SSLKEY,getcwd().'/apiclient_key.pem');

            curl_setopt($ch,CURLOPT_CAINFO,'PEM');
            curl_setopt($ch,CURLOPT_CAINFO,getcwd().'/rootca.pem');

            //第二种方式，两个文件合成一个.pem文件
            //curl_setopt($ch,CURLOPT_SSLCERT,getcwd().'/all.pem');

            if( count($aHeader) >= 1 ){
                curl_setopt($ch, CURLOPT_HTTPHEADER, $aHeader);
            }

            curl_setopt($ch,CURLOPT_POST, 1);
            curl_setopt($ch,CURLOPT_POSTFIELDS,$vars);
            $data = curl_exec($ch);
            if($data){
                curl_close($ch);
                return $data;
            }
            else {
                $error = curl_errno($ch);
                echo "call faild, errorCode:$error\n";
                curl_close($ch);
                return false;
            }
        }

        /****************************************************
         *  微信获取AccessToken 返回指定微信公众号的at信息
         ****************************************************/

        public function wxAccessToken($appId = NULL , $appSecret = NULL){
            $appId          = is_null($appId) ? $this->appId : $appId;
            $appSecret      = is_null($appSecret) ? $this->appSecret : $appSecret;
            $data = json_decode(file_get_contents("./data/Runtime/Data/access_token_c.json"));
            if ($data->expire_time < time()) {
                //echo $appId,$appSecret;
                $url            = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$appId."&secret=".$appSecret;
                $result         = $this->wxHttpsRequest($url);
                file_put_contents('./data/Runtime/Data/wxAccessToken_result.json', $result);
                $jsoninfo       = json_decode($result, true);
                $access_token   = $jsoninfo["access_token"];
                if ($access_token) {
                    $data->expire_time = time() + 7000;
                    $data->access_token = $access_token;
                    $fp = fopen("./data/Runtime/Data/access_token_c.json", "w");
                    fwrite($fp, json_encode($data));
                    fclose($fp);
                }
            }else {
                $access_token = $data->access_token;
            }
            return $access_token;
        }

        /****************************************************
         *  微信获取AccessToken 返回指定微信公众号的at信息
         ****************************************************/

        public function wxJsApiTicket($appId = NULL , $appSecret = NULL){
            $appId          = is_null($appId) ? $this->appId : $appId;
            $appSecret      = is_null($appSecret) ? $this->appSecret : $appSecret;

            $data = json_decode(file_get_contents("./data/Runtime/Data/jsapi_ticket_c.json"));
            if ($data->expire_time < time()) {
                $url        = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=".$this->wxAccessToken();
                $result         = $this->wxHttpsRequest($url);
                $jsoninfo       = json_decode($result, true);
                $ticket = $jsoninfo['ticket'];
                if ($ticket) {
                    $data->expire_time = time() + 7000;
                    $data->jsapi_ticket = $ticket;
                    $fp = fopen("./data/Runtime/Data/jsapi_ticket_c.json", "w");
                    fwrite($fp, json_encode($data));
                    fclose($fp);
                }
            }
            else {
                $ticket = $data->jsapi_ticket;
            }
            return $ticket;
        }

        /****************************************************
         *  微信通过OPENID获取用户信息，返回数组
         ****************************************************/

        public function wxGetUser($openId){
            $wxAccessToken  = $this->wxAccessToken();
            $url            = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=".$wxAccessToken."&openid=".$openId."&lang=zh_CN";
            $result         = $this->wxHttpsRequest($url);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /****************************************************
         *  微信生成二维码ticket
         ****************************************************/

        public function wxQrCodeTicket($jsonData){
            $wxAccessToken  = $this->wxAccessToken();
            $url        = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=".$wxAccessToken;
            $result         = $this->wxHttpsRequest($url,$jsonData);
            return $result;
        }

        /****************************************************
         *  微信通过ticket生成二维码
         ****************************************************/
        public function wxQrCode($ticket){
            $url    = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" . urlencode($ticket);
            return $url;
        }

        /****************************************************
         *      发送自定义的模板消息
         ****************************************************/

        public function wxSetSend($touser, $template_id, $url, $data, $topcolor = '#7B68EE'){
            $template = array(
                'touser' => $touser,
                'template_id' => $template_id,
                'url' => $url,
                'topcolor' => $topcolor,
                'data' => $data
            );
            $jsonData = json_encode($template);
            $result = $this->wxSendTemplate($jsonData);
            return $result;
        }

        /****************************************************
         *  微信设置OAUTH跳转URL，返回字符串信息 - SCOPE = snsapi_base //验证时不返回确认页面，只能获取OPENID
         ****************************************************/

        public function wxOauthBase($redirectUrl,$state = "",$appId = NULL){
            $appId          = is_null($appId) ? $this->appId : $appId;
            $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$appId."&redirect_uri=".$redirectUrl."&response_type=code&scope=snsapi_base&state=".$state."#wechat_redirect";
            return $url;
        }

        /****************************************************
         *  微信设置OAUTH跳转URL，返回字符串信息 - SCOPE = snsapi_userinfo //获取用户完整信息
         ****************************************************/

        public function wxOauthUserinfo($redirectUrl,$state = "",$appId = NULL){
            $appId          = is_null($appId) ? $this->appId : $appId;
            $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$appId."&redirect_uri=".$redirectUrl."&response_type=code&scope=snsapi_userinfo&state=".$state."#wechat_redirect";
            return $url;
        }

        /****************************************************
         *  微信OAUTH跳转指定URL
         ****************************************************/

        public function wxHeader($url){
            header("location:".$url);
        }

        /****************************************************
         *  微信通过OAUTH返回页面中获取AT信息
         ****************************************************/

        public function wxOauthAccessToken($code,$appId = NULL , $appSecret = NULL){
            $appId          = is_null($appId) ? $this->appId : $appId;
            $appSecret      = is_null($appSecret) ? $this->appSecret : $appSecret;
            $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$appId."&secret=".$appSecret."&code=".$code."&grant_type=authorization_code";
            $result         = $this->wxHttpsRequest($url);
            //print_r($result);
            $jsoninfo       = json_decode($result, true);
            //$access_token     = $jsoninfo["access_token"];
            return $jsoninfo;
        }

        /****************************************************
         *  微信通过OAUTH的Access_Token的信息获取当前用户信息 // 只执行在snsapi_userinfo模式运行
         ****************************************************/

        public function wxOauthUser($OauthAT,$openId){
            $url            = "https://api.weixin.qq.com/sns/userinfo?access_token=".$OauthAT."&openid=".$openId."&lang=zh_CN";
            $result         = $this->wxHttpsRequest($url);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /****************************************************
         *  创建自定义菜单
         ****************************************************/

        public function wxMenuCreate($jsonData){
            $wxAccessToken  = $this->wxAccessToken();
            file_put_contents('./data/Runtime/Data/wxAccessToken.json', $wxAccessToken);
            $url            = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" . $wxAccessToken;
            $result         = $this->wxHttpsRequest($url,$jsonData);
            $jsoninfo       = json_decode($result, true);
            file_put_contents('./data/Runtime/Data/jsoninfo.json', $jsoninfo);
            return $jsoninfo;
        }

        /****************************************************
         *  获取自定义菜单
         ****************************************************/

        public function wxMenuGet(){
            $wxAccessToken  = $this->wxAccessToken();
            $url            = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=" . $wxAccessToken;
            $result         = $this->wxHttpsRequest($url);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /****************************************************
         *  删除自定义菜单
         ****************************************************/

        public function wxMenuDelete(){
            $wxAccessToken  = $this->wxAccessToken();
            $url            = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=" . $wxAccessToken;
            $result         = $this->wxHttpsRequest($url);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /****************************************************
         *  获取第三方自定义菜单
         ****************************************************/

        public function wxMenuGetInfo(){
            $wxAccessToken  = $this->wxAccessToken();
            $url            = "https://api.weixin.qq.com/cgi-bin/get_current_selfmenu_info?access_token=" . $wxAccessToken;
            $result         = $this->wxHttpsRequest($url);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /*****************************************************
         *      生成随机字符串 - 最长为32位字符串
         *****************************************************/
        public function wxNonceStr($length = 16, $type = FALSE) {
            $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            $str = "";
            for ($i = 0; $i < $length; $i++) {
                $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
            }
            if($type == TRUE){
                return strtoupper(md5(time() . $str));
            }
            else {
                return $str;
            }
        }

        /*******************************************************
         *      微信商户订单号 - 最长28位字符串
         *******************************************************/

        public function wxMchBillno($mchid = NULL) {
            if(is_null($mchid)){
                if($this->mchid == "" || is_null($this->mchid)){
                    $mchid = time();
                }
                else{
                    $mchid = $this->mchid;
                }
            }
            else{
                $mchid = substr(addslashes($mchid),0,10);
            }
            return date("Ymd",time()).time().$mchid;
        }

        /*******************************************************
         *      微信格式化数组变成参数格式 - 支持url加密
         *******************************************************/

        public function wxSetParam($parameters){
            if(is_array($parameters) && !empty($parameters)){
                $this->parameters = $parameters;
                return $this->parameters;
            }
            else{
                return array();
            }
        }

        /*******************************************************
         *      微信格式化数组变成参数格式 - 支持url加密
         *******************************************************/

        public function wxFormatArray($parameters = NULL, $urlencode = FALSE){
            if(is_null($parameters)){
                $parameters = $this->parameters;
            }
            $restr = "";//初始化空
            ksort($parameters);//排序参数
            foreach ($parameters as $k => $v){//循环定制参数
                if (null != $v && "null" != $v && "sign" != $k) {
                    if($urlencode){//如果参数需要增加URL加密就增加，不需要则不需要
                        $v = urlencode($v);
                    }
                    $restr .= $k . "=" . $v . "&";//返回完整字符串
                }
            }
            if (strlen($restr) > 0) {//如果存在数据则将最后“&”删除
                $restr = substr($restr, 0, strlen($restr)-1);
            }
            return $restr;//返回字符串
        }

        /*******************************************************
         *      微信MD5签名生成器 - 需要将参数数组转化成为字符串[wxFormatArray方法]
         *******************************************************/
        public function wxMd5Sign($content, $privatekey){
            try {
                if (is_null($privatekey)) {
                    throw new Exception("财付通签名key不能为空！");
                }
                if (is_null($content)) {
                    throw new Exception("财付通签名内容不能为空");
                }
                $signStr = $content . "&key=" . $privatekey;
                return strtoupper(md5($signStr));
            }
            catch (Exception $e)
            {
                die($e->getMessage());
            }
        }

        /*******************************************************
         *      微信Sha1签名生成器 - 需要将参数数组转化成为字符串[wxFormatArray方法]
         *******************************************************/
        public function wxSha1Sign($content){
            try {
                if (is_null($content)) {
                    throw new Exception("签名内容不能为空");
                }
                //$signStr = $content;
                return sha1($content);
            }
            catch (Exception $e)
            {
                die($e->getMessage());
            }
        }

        /*******************************************************
         *      微信jsApi整合方法 - 通过调用此方法获得jsapi数据
         *******************************************************/
        public function wxJsapiPackage(){
            $jsapi_ticket = $this->wxJsApiTicket();

            // 注意 URL 一定要动态获取，不能 hardcode.
            $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
            $url = $protocol.$_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"];

            $timestamp = time();
            $nonceStr = $this->wxNonceStr();

            $signPackage = array(
                "jsapi_ticket" => $jsapi_ticket,
                "nonceStr"  => $nonceStr,
                "timestamp" => $timestamp,
                "url"       => $url
            );

            // 这里参数的顺序要按照 key 值 ASCII 码升序排序
            $rawString = "jsapi_ticket=$jsapi_ticket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";

            //$rawString = $this->wxFormatArray($signPackage);
            $signature = $this->wxSha1Sign($rawString);

            $signPackage['signature'] = $signature;
            $signPackage['rawString'] = $rawString;
            $signPackage['appId'] = $this->appId;

            return $signPackage;
        }


        /*******************************************************
         *      将数组解析XML - 微信红包接口
         *******************************************************/
        public function wxArrayToXml($parameters = NULL){
            if(is_null($parameters)){
                $parameters = $this->parameters;
            }

            if(!is_array($parameters) || empty($parameters)){
                die("参数不为数组无法解析");
            }

            $xml = "<xml>";
            foreach ($arr as $key=>$val)
            {
                if (is_numeric($val))
                {
                    $xml.="<".$key.">".$val."</".$key.">";
                }
                else
                    $xml.="<".$key."><![CDATA[".$val."]]></".$key.">";
            }
            $xml.="</xml>";
            return $xml;
        }

        /*******************************************************
         *      微信卡券：上传LOGO - 需要改写动态功能
         *******************************************************/
        public function wxCardUpdateImg() {
            $wxAccessToken  = $this->wxAccessToken();
            //$data['access_token'] =  $wxAccessToken;
            $data['buffer']     =  '@D:\\workspace\\htdocs\\yky_test\\logo.jpg';
            $url            = "https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=".$wxAccessToken;
            $result         = $this->wxHttpsRequest($url,$data);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
            //array(1) { ["url"]=> string(121) "http://mmbiz.qpic.cn/mmbiz/ibuYxPHqeXePNTW4ATKyias1Cf3zTKiars9PFPzF1k5icvXD7xW0kXUAxHDzkEPd9micCMCN0dcTJfW6Tnm93MiaAfRQ/0" }
        }

        /*******************************************************
         *      微信卡券：获取颜色
         *******************************************************/
        public function wxCardColor(){
            $wxAccessToken  = $this->wxAccessToken();
            $url                = "https://api.weixin.qq.com/card/getcolors?access_token=".$wxAccessToken;
            $result         = $this->wxHttpsRequest($url);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /*******************************************************
         *      微信卡券：创建卡券
         *******************************************************/
        public function wxCardCreated($jsonData) {
            $wxAccessToken  = $this->wxAccessToken();
            $url            = "https://api.weixin.qq.com/card/create?access_token=" . $wxAccessToken;
            $result         = $this->wxHttpsRequest($url,$jsonData);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /*******************************************************
         *      微信卡券：JSAPI 卡券Package - 基础参数没有附带任何值 - 再生产环境中需要根据实际情况进行修改
         *******************************************************/
        public function wxCardPackage($cardId){
            $timestamp = time();
            $api_ticket = $this->wxJsApiTicket();
            $cardId = $cardId;
            $arrays = array($api_ticket,$timestamp,$cardId);
            sort($arrays);
            $string = sha1(implode("",$arrays));

            $resultArray['card_id'] = $cardId;
            $resultArray['card_ext'] = array();
            $resultArray['card_ext']['openid'] = 'oOmn4s9MiwqHSNNvPn0dBtU23toA';
            $resultArray['card_ext']['timestamp'] = $timestamp;
            $resultArray['card_ext']['signature'] = $string;

            return $resultArray;
        }

        /**
         *  获取菜单列表
         */
        public function getMenu()
        {
            $wxAccessToken  = $this->wxAccessToken();
            $url = 'https://api.weixin.qq.com/cgi-bin/get_current_selfmenu_info?access_token=' . $wxAccessToken;
            $result         = $this->wxHttpsRequest($url);
            $jsoninfo       = json_decode($result, true);
            return $jsoninfo;
        }

        /*
         * 微信上传永久素材接口
         * */
        function weixin_request($curl,$https=true,$method='GET',$data=null){
            //1.创建一个新cURL资源
            $ch = curl_init();
            //2.设置URL和相应的选项
            curl_setopt($ch, CURLOPT_SAFE_UPLOAD, false);
            //要访问的网站
            curl_setopt($ch, CURLOPT_URL, $curl);
            //启用时会将头文件的信息作为数据流输出。
            curl_setopt($ch, CURLOPT_HEADER, false);
            //将curl_exec()获取的信息以字符串返回，而不是直接输出。
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            if($https){
                //FALSE 禁止 cURL 验证对等证书（peer's certificate）。
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, true);  //验证主机
            }
            if($method == 'POST'){
                //发送 POST 请求
                curl_setopt($ch, CURLOPT_POST, true);
                //全部数据使用HTTP协议中的 "POST" 操作来发送。
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            }
            //3.抓取URL并把它传递给浏览器
            $content = curl_exec($ch);
            //file_put_contents('./data/Runtime/Data/weixin_content.json', $content);
            if ($content  === false) {
                return "网络请求出错: " . curl_error($ch);
                exit();
            }
            //4.关闭cURL资源，并且释放系统资源
            curl_close($ch);
            return $content;
        }

        /**
         * 上传图片，本接口所上传的图片不占用公众号的素材库中图片数量的5000个的限制。
         * 图片仅支持jpg/png格式，大小必须在1MB以下。 (认证后的订阅号可用)
         * 注意：上传大文件时可能需要先调用 set_time_limit(0) 避免超时
         * 注意：数组的键值任意，但文件名前必须加@，使用单引号以避免本地路径斜杠被转义
         * @param array $data {"media":'@Path/filename.jpg'}
         * @return boolean|array
         */
        public function weixin_uploadImg($data){
            $wxAccessToken  = $this->wxAccessToken();
            $curl = 'http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token='.$wxAccessToken.'&type=image';
            $result = $this->weixin_request($curl,true,'POST',$data);
            if ($result){
                $json = json_decode($result,true);
                return $json;
            }
            return false;
        }

        /**
         *  消息接口-发送客服消息
         */
        public function wxCustomMessageSend($data){
            $access_token = $this->wxAccessToken();
            $url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$access_token;
            $result = $this->wxHttpsRequest($url,$data);
            if ($result){
                $json = json_decode($result,true);
                return $json;
            }
            return false;
        }


    }