<?php

define('API_RUL', C('API_RUL'));

class WxauthAction extends Action
{
    /*
     *  授权首页
     */
    public function index()
    {
        Vendor('WxSDK.wxsdk');
        //分享授权后用于转向到分享的地址
        $redirect_uri = isset($_GET['redirect_uri']) ? $_GET['redirect_uri'] : '';
        //file_put_contents('./data/Runtime/Data/redirect_uri.json', $redirect_uri);
        cookie('redirect_uri',$redirect_uri, time() + 99 * 365 * 24 * 3600, '/');
        //分享活动类型（私有需要特殊处理）
        //$act_type = isset($_GET['act_type']) ? $_GET['act_type'] : '';
        //file_put_contents('./data/Runtime/Data/set_act_type.json', $act_type);
        //session('act_type', $act_type);
        //$act_type = cookie('act_type');
        //file_put_contents('./data/Runtime/Data/get_act_type.json', $act_type);
        //获取uid
        $u_id = isset($_GET['u_id']) ? $_GET['u_id'] : '';
        cookie('c_u_id',$u_id,60);
        //通过网页获取openid
        $u_openid = session('u_openid');
        if(!empty($u_openid)){
            setcookie('src_user_openid', $u_openid, time() + 99 * 365 * 24 * 3600, '/');
        }
        $src_user_openid = cookie('src_user_openid');
        if(!empty($src_user_openid)){
            $u_openid = $src_user_openid;
        }
        //var_dump($u_openid);die();
        //$SERVER_NAME = 'www.shijian666.com';
        $SERVER_NAME = $_SERVER['SERVER_NAME'];
        if (empty($u_openid)) {
            if (!isset($_GET['code'])) {
                session('u_id', null);
                session('u_openid', null);
                session('oauth_info', null);
                cookie('src_user_id', null);
                $callback = urlencode('http://'.$SERVER_NAME.'/H5/Wxauth/callBack');
                $wx = new WxApi();
                $url = $wx->wxOauthUserinfo($callback);
                $wx->wxHeader($url);
            }
        } else {
            $users = M('users')->where(array('p_openid'=>$u_openid))->find();//11227;//
            $share_qrcode_img = $users['share_qrcode_img'];
            if(empty($share_qrcode_img)){
                //生成二维码
                $this->getShareQrcode($u_openid);
            }
            setcookie('src_user_id', $users['user_id'], time() + 99 * 365 * 24 * 3600, '/');
            if(!empty($redirect_uri)){
                $temp = explode('-',$redirect_uri);
                $redirect_uri = implode('/',$temp);
                $temp = explode('Z0',$redirect_uri);
                $redirect_uri = implode('.',$temp);
                $temp = explode('Z1',$redirect_uri);
                $redirect_uri = implode('#',$temp);
                $temp = explode('Z2',$redirect_uri);
                $redirect_uri = implode('?',$temp);
                $temp = explode('Z3',$redirect_uri);
                $redirect_uri = implode('=',$temp);
                header('location:'.$redirect_uri);
                exit;
            }else {
                redirect('/H5/Index/index');
                //redirect('/frontend/index.html');
            }
        }
    }

    //授权回调地址
    public function callBack()
    {
        Vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        $ocde = $_GET['code'];
        $info = $wx_obj->wxOauthAccessToken($ocde);
        if(!isset($info['access_token']) || !isset($info['openid'])){
            //redirect('/H5/Wxauth/index');
        }
        $user_info = $wx_obj->wxOauthUser($info['access_token'], $info['openid']);
        if(!isset($user_info['openid'])){
            //redirect('/H5/Wxauth/index');
        }
        //var_dump($ocde);
        //var_dump($info);
        //var_dump($user_info);die();
        if (!empty($user_info) && isset($user_info['openid'])) {
            //判断用户是存入数据库了,没有就插入
            $user = M('users')->where(array('p_openid' => $user_info['openid']))->find();
            if (!empty($user)) {
                $share_qrcode_img = $user['share_qrcode_img'];
                if(empty($share_qrcode_img)){
                    //生成二维码
                    $this->getShareQrcode($user_info['openid']);
                }
                //判断用户父级不存在,并且当前邀请u_id不是自己
                if(empty($user['pid']) && $user['user_id'] != cookie('c_u_id')){
                     M('users')
                        ->where(array(
                            'p_openid' => $user['p_openid'],
                        ))
                        ->save(array(
                            'pid' => cookie('c_u_id'),
                            'nickname' => $user_info['nickname'],
                            'face' => $user_info['headimgurl']
                        ));
                }else{
                    M('users')
                        ->where(array(
                            'p_openid' => $user['p_openid'],
                        ))
                        ->save(array(
                            'nickname' => $user_info['nickname'],
                            'face' => $user_info['headimgurl'],
                            'last_time' => time()
                        ));
                }
                session('u_openid', $user['p_openid']);
                session('u_id', $user['user_id']);
                session('oauth_info', $user_info);
                $redirect_uri = cookie('redirect_uri');
                setcookie('src_user_id', $user['user_id'], time() + 99 * 365 * 24 * 3600, '/');
                setcookie('src_user_openid', $user['p_openid'], time() + 99 * 365 * 24 * 3600, '/');
                if(!empty($redirect_uri)){
                    $temp = explode('-',$redirect_uri);
                    $redirect_uri = implode('/',$temp);
                    $temp = explode('Z0',$redirect_uri);
                    $redirect_uri = implode('.',$temp);
                    $temp = explode('Z1',$redirect_uri);
                    $redirect_uri = implode('#',$temp);
                    $temp = explode('Z2',$redirect_uri);
                    $redirect_uri = implode('?',$temp);
                    $temp = explode('Z3',$redirect_uri);
                    $redirect_uri = implode('=',$temp);
                    header('location:'.$redirect_uri);
                    exit;
                }else{
                    redirect('/H5/Index/index');
                    //redirect('/frontend/index.html');
                }
            }
            $input = array(
                //code ...
                'account' => 'wx_' . time(),
                'p_openid' => $user_info['openid'],
                'reg_time' => time(),
                'face' => $user_info['headimgurl'],
                'nickname' => $user_info['nickname'],
                'pid' => cookie('c_u_id')
            );
            $uid = M('users')->add($input);
            if ($uid) {
                //生成二维码
                $this->getShareQrcode($info['openid']);
                session('u_openid', $info['openid']);
                session('u_id', $uid);
                session('oauth_info', $user_info);
                $redirect_uri = cookie('redirect_uri');
                //setcookie('src_user_id', $user['user_id'], time() + 86400, '/');
                if(!empty($redirect_uri)){
                    $temp = explode('-',$redirect_uri);
                    $redirect_uri = implode('/',$temp);
                    $temp = explode('Z0',$redirect_uri);
                    $redirect_uri = implode('.',$temp);
                    $temp = explode('Z1',$redirect_uri);
                    $redirect_uri = implode('#',$temp);
                    $temp = explode('Z2',$redirect_uri);
                    $redirect_uri = implode('?',$temp);
                    $temp = explode('Z3',$redirect_uri);
                    $redirect_uri = implode('=',$temp);
                    header('location:'.$redirect_uri);
                    exit;
                }else {
                    redirect('/H5/Index/index');
                    //redirect('/frontend/index.html');
                }
            }
        } else {
            //redirect('/H5/Wxauth/index');
            //die('HTTP/1.1 404 微信授权异常');
            //header('HTTP/1.1 404 微信授权异常~');
            //exit;
        }
    }

    //微信支付回调
    public function payCallBack()
    {
        $xml = file_get_contents("php://input");
        if (empty($xml))
            return false;
        $xml = new SimpleXMLElement($xml);
        if (!$xml)
            return false;
        $data = array();
        foreach ($xml as $key => $value) {
            $data[$key] = strval($value);
        }
        //file_put_contents('./data/Runtime/Data/wx_paynotify.txt', var_export($data, true));
        /* $res = array (
             'appid' => 'wx14bb80c57431331d',
             'attach' => '贝拉小镇',
             'bank_type' => 'CFT',
             'cash_fee' => '1',
             'fee_type' => 'CNY',
             'is_subscribe' => 'N',
             'mch_id' => '1488449442',
             'nonce_str' => 'kwx81mjqq0woh2sw6m7butd64fs32b14',
             'openid' => 'oGFRB09u5X3kwDIC1NrvhAyIxq0k',
             'out_trade_no' => '100709',
             'result_code' => 'SUCCESS',
             'return_code' => 'SUCCESS',
             'sign' => '94860EED2567D75A080C8F3E9001DAE4',
             'time_end' => '20170924233147',
             'total_fee' => '1',
             'trade_type' => 'JSAPI',
             'transaction_id' => '4200000007201709244062206661',
         );*/
        if (empty($data['return_code']) || $data['return_code'] != 'SUCCESS') {
            return false;
        }
        if (empty($data['result_code']) || $data['result_code'] != 'SUCCESS') {
            return false;
        }
        if (empty($data['out_trade_no'])) {
            return false;
        }
        $order_id = $data['out_trade_no'];  //订单号id
        $parent_order_id = $order_id;
        $order_id = substr($order_id,2);
        //$order_info = M('order')->field('user_id,juan_num,parent_order_id')->where(array('order_id'=>$order_id))->find();
        $order_info = M('order_parent')->field('user_id,juan_num,parent_order_id,coupon_id')->where(array('parent_order_id'=>$order_id))->find();
        $yjuan = M('yjuan')->where(array('user_id'=>$order_info['user_id']))->find();
        $yjuan_flag = true;   //确定是否要更新卷功能
        if($yjuan['nums'] == $yjuan['use_num']){
            $yjuan_flag = false;
        }
        M()->startTrans();
        if($yjuan_flag){
            $re_juan = M('yjuan')->where(array('user_id'=>$order_info['user_id']))->setInc('use_num',$order_info['juan_num']);
        }else{
            $re_juan = true;
        }
        $parent_res = M('order_parent')->where(array('parent_order_id' => $order_id))->save(array('status' => 1));
        $res = M('order')->where(array('parent_order_id' => $order_id))->save(array('status' => 1));
        $coupon_id = (int)$order_info['coupon_id'];
        if($coupon_id > 0){
            M('user_coupons')->where(array('coupon_id'=>$coupon_id))->save(array('status'=>1,'update_time'=>time()));
        }
        if ($parent_res && $res){
            $order_list = M('order')->where(array('parent_order_id' => $order_id))->select();
            if(!empty($order_list)){
                foreach ($order_list as $key => $val){
                    $order_id = $val['order_id'];
                    $shop_id = (int)$val['shop_id'];
                    $shop_info = M('shop')->where(array('shop_id'=>$shop_id))->find();
                    if(!empty($shop_info)){
                        $ticket_type = (int)$shop_info['ticket_type'];
                        if($ticket_type == 1){      //票付通验票
                            //加入redis order-list 队列调取票付通接口
                            $redis = new Redis();
                            $redis->connect('127.0.0.1', 6379);
                            //$SERVER_NAME = 'www.shijian666.com';
                            $SERVER_NAME = $_SERVER['SERVER_NAME'];
                            $host_array = array('test.shijian666.com'=>'test','www.shijian666.com'=>'prod');
                            $redis_key = $host_array[$SERVER_NAME];
                            $key_index = 'error';
                            if(!empty($redis_key)){
                                $key_index = $redis_key;
                            }
                            $rpush_key = 'order-list-' . $key_index;
                            $redis->rPush($rpush_key, $order_id);
                        }else if($ticket_type == 2){    //平台验票
                            //生成核销券码与二维码
                            $act_code = rand(100000,999999);
                            $QRcode = D('QrcodeWater', 'Service');
                            $QR_dir = 'Public/qrcode/shijian/'.date('Ymd',time()).'/';
                            if (!is_dir($QR_dir)){
                                mkdir($QR_dir,0777,true);
                            }
                            $outfile = $QR_dir . $order_id . '.png';
                            $QRcode->png($act_code, $outfile);
                            M('order')->where(array('order_id' => $order_id))->save(array('status'=>2,'act_code'=>$act_code,'act_img'=>$outfile));
                            M('order_parent')->where(array('parent_order_id'=>$parent_order_id))->save(array('status'=>2));
                        }
                    }
                }
            }
            M()->commit();
            echo 'SUCCESS';
        }else{
            M()->rollback();
        }

    }

    //获取微信jsJDK的配置参数
    public function getJsConfig()
    {
        Vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        $js_config = $wx_obj->wxJsapiPackage();

        return $js_config;
    }

    /*
     * 事件参数,消息,等微信接收入口
     * */
    public function wxIndex()
    {
        try{
            //echo  $_GET['echostr'];   //初始化微信验证配置开启（服务器配置 启用服务器配置后，用户消息和开发者需要的事件推送，将不会被转发到该URL中 ）
            Vendor('WxSDK.wechat');
            /* 加载微信SDK */
            $wechat = new Wechat();
            file_put_contents('./data/Runtime/Data/data2.json', time());
            /* 获取请求信息 */
            $data = $wechat->request();
            //file_put_contents('./data/Runtime/Data/data1.json', json_encode($data));
            if($data && is_array($data)){
                /**
                 * 你可以在这里分析数据，决定要返回给用户什么样的信息
                 * 接受到的信息类型有10种，分别使用下面10个常量标识
                 * Wechat::MSG_TYPE_TEXT       //文本消息
                 * Wechat::MSG_TYPE_IMAGE      //图片消息
                 * Wechat::MSG_TYPE_VOICE      //音频消息
                 * Wechat::MSG_TYPE_VIDEO      //视频消息
                 * Wechat::MSG_TYPE_SHORTVIDEO //视频消息
                 * Wechat::MSG_TYPE_MUSIC      //音乐消息
                 * Wechat::MSG_TYPE_NEWS       //图文消息（推送过来的应该不存在这种类型，但是可以给用户回复该类型消息）
                 * Wechat::MSG_TYPE_LOCATION   //位置消息
                 * Wechat::MSG_TYPE_LINK       //连接消息
                 * Wechat::MSG_TYPE_EVENT      //事件消息
                 *
                 * 事件消息又分为下面五种
                 * Wechat::MSG_EVENT_SUBSCRIBE    //订阅
                 * Wechat::MSG_EVENT_UNSUBSCRIBE  //取消订阅
                 * Wechat::MSG_EVENT_SCAN         //二维码扫描
                 * Wechat::MSG_EVENT_LOCATION     //报告位置
                 * Wechat::MSG_EVENT_CLICK        //菜单点击
                 */
                //记录微信推送过来的数据
                //file_put_contents('./data/Runtime/Data/data.json', json_encode($data));
                /* 响应当前请求(自动回复) */
                //$wechat->response($content, $type);
                /**
                 * 响应当前请求还有以下方法可以使用
                 * 具体参数格式说明请参考文档
                 *
                 * $wechat->replyText($text); //回复文本消息
                 * $wechat->replyImage($media_id); //回复图片消息
                 * $wechat->replyVoice($media_id); //回复音频消息
                 * $wechat->replyVideo($media_id, $title, $discription); //回复视频消息
                 * $wechat->replyMusic($title, $discription, $musicurl, $hqmusicurl, $thumb_media_id); //回复音乐消息
                 * $wechat->replyNews($news, $news1, $news2, $news3); //回复多条图文消息
                 * $wechat->replyNewsOnce($title, $discription, $url, $picurl); //回复单条图文消息
                 *
                 */
                //执行微信事件参数,消息
                $this->executeWxEvent($wechat, $data);
            }
        } catch(\Exception $e){
            file_put_contents('./data/Runtime/Data/error.json', json_encode($e->getMessage()));
        }

    }

    /*
     * 用户关注赠送优惠券业务
     * */
    private function giftCoupons($gifttype, $user_id){
        if(empty($gifttype) && empty($user_id)){
            return false;
        }
        if(time() > strtotime("2017-12-31 23:59:59")){
            return false;
        }
        //file_put_contents('./data/Runtime/Data/1111111.json', '');
        if($gifttype == 1){     //新用户成功注册即送30元无门槛优惠券优惠券,30元优惠券拆分成3张10元优惠券
            //file_put_contents('./data/Runtime/Data/22222.json', '');
            for ($ii = 0;$ii < 3;$ii++){
                $start_date = '';
                $end_date = '';
                if($ii == 0){
                    $start_date = date('Y-m-d');
                    $end_date = '2017-12-31';
                }elseif($ii == 1){
                    $start_date = '2018-01-01';
                    $end_date = '2018-01-31';
                }elseif($ii == 2){
                    $start_date = '2018-02-01';
                    $end_date = '2018-02-28';
                }
                $input = array(
                    'user_id' => $user_id,
                    'coupon_name' => '平台通用优惠券',
                    'amount' => 10,
                    'start_date' => $start_date,
                    'end_date' => $end_date,
                    'status' => 0,
                    'type' => 1,
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                );
                M('user_coupons')->add($input);
                //file_put_contents('./data/Runtime/Data/33333333.json', '');
            }
            return true;
        }elseif($gifttype == 2){    //老用户邀请2个新用户成功关注即得100元优惠券
            for ($ii = 0;$ii < 7;$ii++){
                $start_date = '';
                $end_date = '';
                $amount = '';
                $type = 1;
                $available_amount = 0;
                $coupon_name = '全平台通用券';
                if($ii == 0){
                    $start_date = date('Y-m-d');
                    $end_date = '2017-12-31';
                    $amount = 10;
                    $type = 1;
                    $available_amount = 0;
                }elseif($ii == 1){
                    $start_date = '2018-01-01';
                    $end_date = '2018-01-31';
                    $amount = 10;
                    $type = 1;
                    $available_amount = 0;
                }elseif($ii == 2){
                    $start_date = '2018-02-01';
                    $end_date = '2018-02-28';
                    $amount = 10;
                    $type = 1;
                    $available_amount = 0;
                }elseif($ii == 3){
                    $start_date = date('Y-m-d');
                    $end_date = '2018-01-31';
                    $amount = 10;
                    $type = 2;
                    $available_amount = 98;
                    $coupon_name = '满'.$available_amount.'元可用';
                }elseif($ii == 4){
                    $start_date = date('Y-m-d');
                    $end_date = '2018-01-31';
                    $amount = 15;
                    $type = 2;
                    $available_amount = 148;
                    $coupon_name = '满'.$available_amount.'元可用';
                }elseif($ii == 5){
                    $start_date = date('Y-m-d');
                    $end_date = '2018-01-31';
                    $amount = 20;
                    $type = 2;
                    $available_amount = 198;
                    $coupon_name = '满'.$available_amount.'元可用';
                }elseif($ii == 6){
                    $start_date = date('Y-m-d');
                    $end_date = '2018-01-31';
                    $amount = 25;
                    $type = 2;
                    $available_amount = 238;
                    $coupon_name = '满'.$available_amount.'元可用';
                }
                $input = array(
                    'user_id' => $user_id,
                    'coupon_name' => $coupon_name,
                    'amount' => $amount,
                    'start_date' => $start_date,
                    'end_date' => $end_date,
                    'status' => 0,
                    'type' => $type,
                    'available_amount' => $available_amount,
                    'created_at' => date('Y-m-d H:i:s'),
                    'updated_at' => date('Y-m-d H:i:s'),
                );
                M('user_coupons')->add($input);
            }
            return true;
        }
        return false;
    }

    /*
     * 保存用户唯一分享二维码图片信息
     * */
    private function getShareQrcode($openid){
        //发送二维码图片信息
        Vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        $qrcode_url = '';
        $users = M('users')->where(array('p_openid' => $openid))->find();
        $share_qrcode_img = $users['share_qrcode_img'];
        $user_id = $users['user_id'];
        if($user_id > 0 && empty($share_qrcode_img)) {
            $nickname = $users['nickname'] ? $users['nickname'] : $users['account'];
            if (strlen($nickname) > 20) {
                $nickname = mb_substr($nickname, 0, 20);
            }
            $face_url = $users['face'];
            if (empty($face_url)) {
                $SERVER_NAME = $_SERVER['SERVER_NAME'];
                $face_url = $SERVER_NAME . '/Public/Jigou/image/default.jpg';
            } else {
                $face_pos = strpos($face_url, 'http');
                if ($face_pos === false) {
                    $face_url = API_RUL . $face_url;
                }
            }
            //file_put_contents('./data/Runtime/Data/face_url_data.json', $face_url);
            $curl_data = '{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": ' . $user_id . '}}}';
            $result = $wx_obj->wxQrCodeTicket($curl_data);
            $json_info = json_decode($result, true);
            //file_put_contents('./data/Runtime/Data/wxQrCodeTicket_data.json', json_encode($result));
            if (!empty($json_info) && $json_info['ticket']) {
                $src_url = $wx_obj->wxQrCode($json_info['ticket']);
                //file_put_contents('./data/Runtime/Data/wxQrCode_data.json', $src_url);
                $QrcodeWater = D('QrcodeWater', 'Service');
                //$qrcode_url = $QrcodeWater->qrcodeWater($src_url,$user_id);
                $qrcode_url = $QrcodeWater->qrcodeWaterFace($src_url, $face_url, $nickname, $user_id);
                M('users')->where(array('user_id' => $user_id))->save(array('share_qrcode_img' => $qrcode_url));
            }
        }
        return $qrcode_url;
    }

    /*
     * 获取微信带参数二维码（普通二维码）
     * */
    private function getWeinxinQrcode($user_id){
        //发送二维码图片信息
        $qrcode_url = '';
        Vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        file_put_contents('./data/Runtime/Data/WeinxinQrcode_user_id_data.json', json_encode($user_id));
        if($user_id > 0) {
            $curl_data = '{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": ' . $user_id . '}}}';
            $result = $wx_obj->wxQrCodeTicket($curl_data);
            $json_info = json_decode($result, true);
            file_put_contents('./data/Runtime/Data/WeinxinQrcode_wxQrCodeTicket_data.json', json_encode($result));
            if (!empty($json_info) && $json_info['ticket']) {
                $src_qrcode_url = $wx_obj->wxQrCode($json_info['ticket']);
                file_put_contents('./data/Runtime/Data/WeinxinQrcode_wxQrCode_data.json', $src_qrcode_url);
                $QrcodeWater = D('QrcodeWater', 'Service');
                $qrcode_url = $QrcodeWater->qrcodeWater($qrcode_url, $user_id);
                file_put_contents('./data/Runtime/Data/WeinxinQrcode_qrcodeWater_data.json', $qrcode_url);
            }
        }
        return $qrcode_url;
    }

    /*
     * 执行微信开发者自定义菜单事件
     * */
    private function executeWxEvent($wechat, $data){
        switch ($data['MsgType']) {
            case Wechat::MSG_TYPE_EVENT:
                switch ($data['Event']) {
                    case Wechat::MSG_EVENT_SUBSCRIBE:
                        $openid = '';
                        file_put_contents('./data/Runtime/Data/MSG_EVENT_SUBSCRIBE_data.json', json_encode($data));
                        $EventKey = $data['EventKey'];
                        if(empty($EventKey)){       //通过分享链接关注
                            //关注改变用户关注状态
                            $openid = $data['FromUserName'];
                            //M('users')->where(array('p_openid' => $openid))->save(array('is_subscribe' => 1));
                            Vendor('WxSDK.wxsdk');
                            $wx_obj = new WxApi();
                            $access_token = $wx_obj->wxAccessToken();
                            $user_info = $wx_obj->wxOauthUser($access_token, $openid);
                            file_put_contents('./data/Runtime/Data/user_info_data.json', json_encode($user_info));
                            if (!empty($user_info)) {
                                $pid = 839505001;   //通过分享链接关注
                                //默认昵称
                                $nickname = $user_info['nickname'];
                                if(empty($nickname)){
                                    $nickname = 'SJ'.rand(10000,99999);
                                }
                                //判断用户是否存在，不存在则新增
                                $user = M('users')->where(array('p_openid' => $openid))->find();
                                if (!empty($user)) {
                                    if(!empty($user['nickname']) && !empty($user['face'])){
                                        M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1));
                                    }else{
                                        M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1,'nickname'=>$nickname,'face'=>$user_info['headimgurl']));
                                    }
                                    //判断用户父级不存在,并且当前邀请u_id不是自己
                                    if(empty($user['pid']) && $user['user_id'] != $pid){
                                        M('users')->where(array('p_openid' => $openid))->save(array('pid'=>$pid));
                                    }
                                }else{
                                    $input = array(
                                        'account' => 'wx_' . time() . rand(1000,9999),
                                        'p_openid' => $openid,
                                        'reg_time' => time(),
                                        'nickname' => $nickname,
                                        'face' => $user_info['headimgurl'],
                                        'pid' => $pid,
                                        'is_subscribe' => 1,
                                    );
                                    $user_id = M('users')->add($input);
                                    //新用户关注赠送优惠券
                                    //$this->giftCoupons(1, $user_id);
                                }
                            }
                            //$wechat->replyText("通过分享链接关注");break;
                        }else{
                            $openid = $data['FromUserName'];
                            $key_res = explode('_', $EventKey);
                            $pid = $key_res[1];
                            Vendor('WxSDK.wxsdk');
                            $wx_obj = new WxApi();
                            $access_token = $wx_obj->wxAccessToken();
                            $user_info = $wx_obj->wxOauthUser($access_token, $openid);
                            file_put_contents('./data/Runtime/Data/user_info_22_data.json', json_encode($user_info));
                            if (!empty($user_info)) {
                                //默认昵称
                                $nickname = $user_info['nickname'];
                                if(empty($nickname)){
                                    $nickname = 'SJ'.rand(10000,99999);
                                }
                                //判断用户是否存在，不存在则新增
                                $user = M('users')->where(array('p_openid' => $openid))->find();
                                if (!empty($user)) {
                                    if(!empty($user['nickname']) && !empty($user['face'])){
                                        M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1));
                                    }else{
                                        M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1,'nickname'=>$nickname,'face'=>$user_info['headimgurl']));
                                    }
                                    //判断用户父级不存在,并且当前邀请u_id不是自己
                                    if(empty($user['pid']) && $user['user_id'] != $pid){
                                        M('users')->where(array('p_openid' => $openid))->save(array('pid'=>$pid));
                                    }
                                }else{
                                    $input = array(
                                        'account' => 'wx_' . time() . rand(1000,9999),
                                        'p_openid' => $openid,
                                        'reg_time' => time(),
                                        'nickname' => $nickname,
                                        'face' => $user_info['headimgurl'],
                                        'pid' => $pid,
                                        'is_subscribe' => 1,
                                    );
                                    $user_id = M('users')->add($input);
                                    //新用户关注赠送优惠券
                                    //$this->giftCoupons(1, $user_id);
                                    //查询老用户邀请关注的新用户数量，满足2个新用户则赠送100元优惠券
                                    $reg_time = strtotime("2017-12-09");
                                    $usersList = M('users')->where('reg_time>'.$reg_time)->where(array('pid'=>$pid,'is_subscribe'=>1))->select();
                                    if(!empty($usersList)){
                                        $user_coupons = M('user_coupons')->where(array('type'=>2,'user_id'=>$pid))->select();
                                        if(count($usersList) >= 2 && count($user_coupons) <= 0){
                                            $this->giftCoupons(2, $pid);
                                        }
                                    }
                                }
                            }

                            /*
                            //$wechat->replyText("通过分享二维码扫描关注");break;
                            $openid = $data['FromUserName'];
                            Vendor('WxSDK.wxsdk');
                            $wx_obj = new WxApi();
                            $access_token = $wx_obj->wxAccessToken();
                            $user_info = $wx_obj->wxOauthUser($access_token, $openid);
                            if (!empty($user_info)) {
                                //判断用户是否存在，不存在则新增
                                $user = M('users')->where(array('p_openid' => $openid))->find();
                                if (!empty($user)) {
                                    //M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1,'nickname'=>$user_info['nickname'],'face'=>$user_info['headimgurl']));
                                    M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1));
                                    //判断用户父级不存在,并且当前邀请u_id不是自己
                                    //if(empty($user['pid']) && $user['user_id'] != $pid){
                                    //    M('users')->where(array('p_openid' => $openid))->save(array('pid'=>$pid));
                                    //}
                                }else{
                                    $rand_code = rand(1000,9999);
                                    $input = array(
                                        'account' => 'wx_' . time() . $rand_code,
                                        'p_openid' => $openid,
                                        'reg_time' => time(),
                                        'nickname' => $user_info['nickname'],
                                        'face' => $user_info['headimgurl'],
                                        'pid' => 99999,
                                        'is_subscribe' => 1,
                                    );
                                    M('users')->add($input);
                                }
                            }
                            $SERVER_NAME = $_SERVER['SERVER_NAME'];
                            $key_res = explode('_', $EventKey);
                            $goods_id = $key_res[1];
                            $goods = M('goods')->where(array('goods_id' => $goods_id))->find();
                            //file_put_contents('./data/Runtime/Data/goods_data.json', json_encode($goods));
                            if (!empty($goods)) {
                                $goods_name = $goods['title'];
                                //$href_url = "http://".$SERVER_NAME."/H5/Wxauth/index/act_type/private/redirect_uri/http:--".$SERVER_NAME."-frontend-indexZ0htmlZ1-activityDetailZ2goods_idZ3".$goods_id;
                                $href_url = "http://".$SERVER_NAME."/H5/Wxauth/index/act_type/private/redirect_uri/http:--".$SERVER_NAME."-frontend-indexZ0htmlZ1-blank";
                                $wechat->replyText("欢迎关注综合实践平台，您关注的【".$goods_name."】活动即将满员，即刻报名请点击<a href='".$href_url."'>>>立即报名</a>，大家都在等你哦~");
                            }
                            break;
                            */
                        }
                        /*
                        //======================保存用户唯一分享二维码图片信息=================================
                        //保存用户唯一分享二维码图片信息
                        $users = M('users')->where(array('p_openid' => $openid))->find();
                        $user_id = (int)$users['user_id'];
                        $share_qrcode_img = $users['share_qrcode_img'];
                        if($user_id > 0 && empty($share_qrcode_img)) {
                            $curl_data = '{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": ' . $user_id . '}}}';
                            $result = $wx_obj->wxQrCodeTicket($curl_data);
                            $json_info = json_decode($result, true);
                            if (!empty($json_info) && $json_info['ticket']) {
                                $src_url = $wx_obj->wxQrCode($json_info['ticket']);
                                $QrcodeWater = D('QrcodeWater', 'Service');
                                $qrcode_url = $QrcodeWater->qrcodeWater($src_url, $user_id);
                                M('users')->where(array('user_id' => $user_id))->save(array('share_qrcode_img' => $qrcode_url));
                            }
                        }
                        */
                        //======================保存用户唯一分享二维码图片信息=================================
                        $this->getShareQrcode($openid);

                        //$wechat->replyText("欢迎关注【综合实践平台】！综合实践平台将整合优质素质教育资源，为小、中、高教育阶段的学生带来丰富综合实践拓展活动！您可通过下方菜单栏查看最新活动、资讯、以及个人动态。助力您的素质教育全面发展！");
                        //$wechat->replyText("亲爱的，你终于来啦！\n\n感谢关注中国领先的【学生综合实践平台】。我们将整合优质素质教育资源，为小、中、高教育阶段的学生带来丰富综合实践拓展活动！\n\n点击菜单里的「活动」即可微信查看最新最火的学生综合实践活动！\n\n商务合作及客服联系电话\n4000-399-118");
                        //======================默认关注进来推送文本消息与图文消息START=================================
                        $data = '{
                            "touser":"'.$openid.'",
                            "msgtype":"text",
                            "text":{"content":"么么哒~终于等到你了！\n\n号召你身边的宝妈奶爸一起来加入实践成长联盟吧！让孩子在欢乐中成长，在实践中萌新！\n\nPS：分享邀请码给好友，只需两位好友关注，即可获得100元现金券，助力宝贝成长！\n\n↓↓邀请码正在生成中↓↓"}
//                            "text":{"content":"圣诞快乐！\n\nMerry Christmas~送你一份圣诞神秘大礼！\n\nPS：你需要将下图分享给好友，让至少两个好友帮你才能拆开礼物哦！\n\n礼物拆开后可点击菜单“我的”，进入“我的优惠券“中进行查看！\n\n快快将好礼和朋友分享吧！看看你的朋友够不够给力！\n\n↓↓分享图片生成中↓↓"}
                         }';
                        $message_data = $wx_obj->wxCustomMessageSend($data);
                        //file_put_contents('./data/Runtime/Data/message_data_data.json', $message_data);
                        //======================点击我的邀请码推送文本消息END=================================

                        //发送二维码图片信息
                        $users = M('users')->where(array('p_openid' => $openid))->find();
                        $share_qrcode_img = $users['share_qrcode_img'];
                        if(empty($share_qrcode_img)){
                            $share_qrcode_img = $this->getShareQrcode($openid);
                        }
                        $jsonData = array('media'=>'@' . $share_qrcode_img);
                        $result = $wx_obj->weixin_uploadImg($jsonData);
                        $media_id = $result['media_id'];
                        $wechat->replyImage($media_id);
                        //======================默认关注进来推送文本消息与图文消息END=================================
                        break;

                    case Wechat::MSG_EVENT_UNSUBSCRIBE:
                        $openid = $data['FromUserName'];
                        M('users')->where(array('p_openid' => $openid))->save(array('is_subscribe' => 0));
                        $wechat->replyText('对不起,不知为何您取消关注学生综合实践平台公众平台!');
                        break;

                    case Wechat::MSG_EVENT_CLICK:
                        $openid = $data['FromUserName'];
                        //file_put_contents('./data/Runtime/Data/FromUserName_data.json', json_encode($data));
                        vendor('WxSDK.wxsdk');
                        $wx_obj = new WxApi();
                        //$access_token = $wx_obj->wxAccessToken();
                        //$user_info = $wx_obj->wxOauthUser($access_token, $openid);
                        //$menus = $wx_obj->getMenu();
                        //$listen_key = 'V1001_GOOD';//$menus['selfmenu_info']['button']['2']['sub_button']['list']['0']['value'];
                        if($data['EventKey'] == 'V1001_GOOD'){
                            //======================点击我的邀请码推送文本消息START=================================
                            $data = '{
                            "touser":"'.$openid.'",
                            "msgtype":"text",
                            "text":{"content":"么么哒~终于等到你了！\n\n号召你身边的宝妈奶爸一起来加入实践成长联盟吧！让孩子在欢乐中成长，在实践中萌新！\n\nPS：分享邀请码给好友，只需两位好友关注，即可获得100元现金券，助力宝贝成长！\n\n↓↓邀请码正在生成中↓↓"}
//                            "text":{"content":"圣诞快乐！\n\nMerry Christmas~送你一份圣诞神秘大礼！\n\nPS：你需要将下图分享给好友，让至少两个好友帮你才能拆开礼物哦！\n\n礼物拆开后可点击菜单“我的”，进入“我的优惠券“中进行查看！\n\n快快将好礼和朋友分享吧！看看你的朋友够不够给力！\n\n↓↓分享图片生成中↓↓"}
                         }';
                            $message_data = $wx_obj->wxCustomMessageSend($data);
                            //file_put_contents('./data/Runtime/Data/message_data_data.json', $message_data);
                            //======================点击我的邀请码推送文本消息END=================================

                            //发送二维码图片信息
                            $users = M('users')->where(array('p_openid' => $openid))->find();
                            $share_qrcode_img = $users['share_qrcode_img'];
                            if(empty($share_qrcode_img)){
                                $share_qrcode_img = $this->getShareQrcode($openid);
                            }
                            $jsonData = array('media'=>'@' . $share_qrcode_img);
                            $result = $wx_obj->weixin_uploadImg($jsonData);
                            $media_id = $result['media_id'];
                            $wechat->replyImage($media_id);

                            /*
                            //======================点击我的邀请码推送文本消息END=================================
                            //发送二维码图片信息
                            $users = M('users')->where(array('p_openid' => $openid))->find();
                            //$share_qrcode_img = $users['share_qrcode_img'];
                            $user_id = $users['user_id'];
                            $nickname = $users['nickname'] ? $users['nickname'] : $users['account'];
                            if(strlen($nickname) > 10){
                                $nickname = mb_substr($nickname, 0, 10);
                            }
                            $face_url = $users['face'];
                            if(empty($face_url)){
                                $SERVER_NAME = $_SERVER['SERVER_NAME'];
                                $face_url = $SERVER_NAME .'/Public/Jigou/image/default.jpg';
                            }else{
                                $face_pos = strpos($face_url, 'http');
                                if($face_pos === false){
                                    $face_url = API_RUL . $face_url;
                                }
                            }
                            $curl_data='{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": '.$user_id.'}}}';
                            $result = $wx_obj->wxQrCodeTicket($curl_data);
                            $json_info = json_decode($result,true);
                            //file_put_contents('./data/Runtime/Data/wxQrCodeTicket_data.json', json_encode($result));
                            if(!empty($json_info) && $json_info['ticket']){
                                $src_url = $wx_obj->wxQrCode($json_info['ticket']);
                                //file_put_contents('./data/Runtime/Data/wxQrCode_data.json', $src_url);
                                $QrcodeWater = D('QrcodeWater','Service');
                                //$qrcode_url = $QrcodeWater->qrcodeWater($src_url,$user_id);
                                $qrcode_url = $QrcodeWater->qrcodeWaterFace($src_url,$face_url,$nickname,$user_id);
                                //file_put_contents('./data/Runtime/Data/qrcode_url_data.json', $qrcode_url);
                                $jsonData = array('media'=>'@' . $qrcode_url);
                                $result = $wx_obj->weixin_uploadImg($jsonData);
                                //file_put_contents('./data/Runtime/Data/weixin_uploadImg_data.json', json_encode($result));
                                $media_id = $result['media_id'];
                                $wechat->replyImage($media_id);
                            }
                            */
                        }elseif ($data['EventKey'] == 'V1002_GOOD'){
                            //$access_token = $wx_obj->wxAccessToken();
                            //$user_info = $wx_obj->wxOauthUser($access_token, $openid);
                            //$menus = $wx_obj->getMenu();
                            //$listen_key = 'V1001_GOOD';//$menus['selfmenu_info']['button']['2']['sub_button']['list']['0']['value'];
                            $wechat->replyText("如果您有相关疑问或商业合作，请拨打客服电话4000399118，感谢您的理解与支持！");
                            break;
                        }
                        break;

                    default:
                        break;
                }
                break;

            case Wechat::MSG_TYPE_TEXT:
                //$openid = $data['FromUserName'];
                //file_put_contents('./data/Runtime/Data/MSG_TYPE_TEXT_data.json', json_encode($data));
                switch ($data['Content']) {
                    case '文本':
                        //$user_id = 839505001;   //平台级带参数二维码
                        //$user_id = 839505002;   //第三方运营推广带参数二维码
                        //$this->getWeinxinQrcode($user_id);
                        //$wechat->replyText("欢迎关注【综合实践平台】！综合实践平台将整合优质素质教育资源，为小、中、高教育阶段的学生带来丰富综合实践拓展活动！您可通过下方菜单栏查看最新活动、资讯、以及个人动态。助力您的素质教育全面发展！");
                        //$wechat->replyText("嗨，欢迎您的关注！[愉快]\n\n10月1日，贝拉小镇盛大开园！[玫瑰]现预售期间“三人同行，爸妈免单”，购买原价440元的课程体验卡（套卡），尊享260元特惠价！[礼物]\n\n有任何问题都可以拨打客服电话：17700796769，我们为您解答~~[爱心]");
                        //$goods_name = '【贝拉小镇亲子套票】';
                        //$wechat->replyText("欢迎关注综合实践平台，您关注的".$goods_name."活动即将满员，即刻报名请点击<a href='http://dev.shijian666.com'>>>立即报名</a>，大家都在等你哦~");
                        //$act_type = cookie('redirect_uri');
                        //$act_type = session('act_type');
                        /*
                        $u_openid = session('u_openid');
                        file_put_contents('./data/Runtime/Data/get_act_type.json', $u_openid);
                        if(!empty($act_type)){
                            $goods_name = '【贝拉小镇亲子套票】';
                            $wechat->replyText("欢迎关注综合实践平台，您关注的".$goods_name."活动即将满员，即刻报名请点击<a href='http://dev.shijian666.com'></a>，大家都在等你哦~");
                        }else{
                            $wechat->replyText("欢迎关注【综合实践平台】！综合实践平台将整合优质素质教育资源，为小、中、高教育阶段的学生带来丰富综合实践拓展活动！您可通过下方菜单栏查看最新活动、资讯、以及个人动态。助力您的素质教育全面发展！");
                        }
                        */

                        //保存活动二维码信息（微信二维码目前最大可生成十万个）
                        //$user_id = 839505001;       //平台级带参数二维码
                        //$user_id = 99999;           //第三方运营推广带参数二维码
                        /*
                        $user_id = 99998;           //微智校园运营推广带参数二维码
                        vendor('WxSDK.wxsdk');
                        $wx_obj = new WxApi();
                        $curl_data='{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": '.$user_id.'}}}';
                        $result = $wx_obj->wxQrCodeTicket($curl_data);
                        file_put_contents('./data/Runtime/Data/createWxQrCodeTicket_'.$user_id.'.json', json_encode($result));
                        $json_info = json_decode($result,true);
                        if(!empty($json_info) && $json_info['ticket']){
                            $src_url = $wx_obj->wxQrCode($json_info['ticket']);
                            file_put_contents('./data/Runtime/Data/createWxQrCode_'.$user_id.'.json', $src_url);
                            $QrcodeWater = D('QrcodeWater','Service');
                            $qrcode_url = $QrcodeWater->getWxQrcodeByParams($src_url,$user_id);
                            file_put_contents('./data/Runtime/Data/createWxQrcodeByParams_'.$user_id.'.json', $qrcode_url);
                        }
                        */
                        //file_put_contents('./data/Runtime/Data/MSG_TYPE_TEXT_data.json', json_encode($data));
                        $wechat->replyText("欢迎关注【综合实践平台】！");
                        break;
                }
                break;
        }
    }

    //测试用于获取menu菜单
    public function test()
    {
        /*vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        $menus = $wx_obj->wxMenuGet();
        echo '<pre/>';
        print_r($menus);*/
//        $s = D('PiaoFuTong','Service');
//        $res = $s->get_callback_url();
//        echo $res;

        //$this->yJuan();
        //模拟回调
     /*   $order = M('order')->alias('o')
            ->field('o.order_id,o.user_id,u.truename,u.mobile')
            ->join('bao_users as u on o.user_id = u.user_id')
            ->where(array(
                'status' => 0,
                'check_time' => array(
                    'elt',time()
                )
            ))
            ->order('o.order_id asc')
            ->limit(1000)
            ->select();
        if(!empty($order)){
            $path = './data';
            if(!is_dir($path)){
                mkdir($path,0755);
            }
            foreach ($order as $k=>$v){
                //拉去远程订单
                $s = D('PiaoFuTong','Service');
                $result = $s->Order_Change_Pro($v['order_id'], 0, $v['mobile']);
                $res_state = $result['Rec'][0]['UUdone'][0]['#text'];
                echo 'start---'.'<br/>';
                //print_r($result);exit;
                //如果他等于100 说明退票成功了
                if($res_state == 100){
                    echo 'return 远程接口状态成功,当前order_id: '.$v['order_id'].'<br/>';
                    $re_o = M('order')->where(array(
                        'order_id' => $v['order_id']
                    ))->delete();
                    $re_og = M('order_goods')->where(array(
                        'order_id' => $v['order_id']
                    ))->delete();
                    //写入日志
                    $str = "-----------取消成功 ----时间 ".date('y-m-d:H:i:s',time())."-------\r\n";
                    $str .= "当前取消订单id为order_id: ".$v['order_id']."\r\n";
                    $str .= "\r\n";
                    $fp = fopen($path."/check.json", "a+");
                    fwrite($fp, $str);
                    fclose($fp);
                }
                echo 'return 接口失败,当前order_id: '.$v['order_id'].'<br/>';
                sleep(10);
            }
            echo 'success';
        }else{
            echo 'fail';
        }*/

    }

    //测试用于创建菜单
    public function createMenus()
    {
        die('执行创建菜单功能已迁移至内部运营管理系统微信模板，请知悉！');
        //var_dump(time());die();
        //执行创建菜单
        vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        $SERVER_NAME = $_SERVER['SERVER_NAME'];

        //$url = 'http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--'.$SERVER_NAME.'-frontend-index0html2-activityList';
        //var_dump($url);die();
        //$SERVER_NAME = 'test.shijian666.com';
        //"url":"http://'.$SERVER_NAME.'H5/Wxauth/index"
        //"url":"http://'.$SERVER_NAME.'/frontend/index.html"
        //"url":"https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzU0NDI3Mzk0NA==&scene=124#wechat_redirect"
        //"url":"http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--'.$SERVER_NAME.'-H5-Index-myActive"
        /*
        $menus = ' {
                     "button":[
                     {	
                          "type":"view",
                          "name":"活动中心",
                          "url":"http://'.$SERVER_NAME.'/H5/Wxauth/index"
                      },
                      {
                           "type":"view",
                           "name":"我的优惠券",
                           "url":"http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--'.$SERVER_NAME.'-H5-Index-myCommission"
                      },
                      {	
                          "type":"view",
                          "name":"我的活动",
                          "url":"http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--'.$SERVER_NAME.'-H5-Index-myActive"
                      }]
                 }';
        */
        $menus = ' {
                     "button":
                     [{	
                          "type":"view",
                          "name":"活动",
                          "url":"http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--'.$SERVER_NAME.'-frontend-indexZ0htmlZ1-home"
                      },
                      {	
                          "type":"click",
                          "name":"领100元",
                          "key":"V1001_GOOD"
                      },
                      {
                          "name":"我的",
                          "sub_button":
                          [{	
                              "type":"view",
                              "name":"我的优惠券",
                              "url":"http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--'.$SERVER_NAME.'-frontend-indexZ0htmlZ1-mineTicket"
                          },
                          {	
                              "type":"view",
                              "name":"我的活动",
                              "url":"http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--'.$SERVER_NAME.'-frontend-indexZ0htmlZ1-mine-myOrder"
                          },
                          {	
                              "type":"click",
                              "name":"联系客服",
                              "key":"V1002_GOOD"
                          }]
                      }]
                 }';
        //var_dump($menus);die();
        $res = $wx_obj->wxMenuCreate($menus);
        print_r($res);
        /*
         {
               "name":"优惠20元",
               "sub_button":[
               {
                   "type":"view",
                   "name":"我的优惠券",
                   "url":"http://'.$SERVER_NAME.'/H5/Wxauth/index/redirect_uri/http:--dev.hnwtt.cn-H5-Index-myCommission"
                },
                {
                   "type":"click",
                   "name":"获取优惠券",
                   "key":"V1001_GOOD"
                }]
          },
         * */
    }

    //测试用于删除菜单
    public function delMenus()
    {
        die('执行删除菜单功能已迁移至内部运营管理系统微信模板，请知悉！');
        vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        $res = $wx_obj->wxMenuDelete();
        printf($res);
    }

    //优惠券
    public function yJuan($openid='')
    {
        if(empty($openid)){
            $openid = session('u_openid'); //当前用户id
        }
        //$openid = 'oGFRB004KGhDaMh4RCwlq3zXsbh4';
        $pid = M('users')->where(array(
            'p_openid' => $openid
        ))->getField('pid');
        //计算当前用户的数量
        $count = M('users')->where(array(
            'pid' => $pid,
            'is_subscribe' => 1
        ))->count();
        $nums = floor($count/2);
        /*$pid_info = M('user')->where(array(
            'user_id' => $pid
        ))->find();*/
        //
        if($nums >= 1){
            $juan_info = M('yjuan')->where(array(
                'user_id' => $pid
            ))->find();
            if(!empty($juan_info)){
                $input = array(
                    'user_id' => $pid,
                    'nums' => $nums
                );
                $res = M('yjuan')->where(array(
                    'user_id' => $juan_info['user_id']
                ))->save($input);
                $path = './data';
                if(!is_dir($path)){
                    mkdir($path,0755);
                }
                if(!$res){
                    //写入日志
                    $str = "-----------更新失败 ----时间 ".date('y-m-d:H:i:s',time())."-------\r\n";
                    $str .= "当前微信用户openid: ".$openid."--父级用户ID: ".$pid." 跟新卷失败\r\n";
                    $str .= "\r\n";
                    $fp = fopen($path."/yjuan_error.json", "a+");
                    fwrite($fp, $str);
                    fclose($fp);
                }
            }else{
                $input = array(
                    'user_id' => $pid,
                    'nums' => $nums,
                    'use_num' => 0,
                );
                $res = M('yjuan')->add($input);
                $path = './data';
                if(!is_dir($path)){
                    mkdir($path,0755);
                }
                if(!$res){
                    //写入日志
                    $str = "-----------插入失败---时间 ".date('y-m-d:H:i:s',time())."-------\r\n";
                    $str .= "当前微信用户openid: ".$openid."--父级用户ID: ".$pid." 插入卷失败\r\n";
                    $str .= "\r\n";
                    $fp = fopen($path."/yjuan_error.json", "a+");
                    fwrite($fp, $str);
                    fclose($fp);
                }
            }
        }

    }

    public function cleanSession()
    {
        session('u_id',null);
        session('u_openid',null);
    }

}