<?php
class Wechat {
    /**
     * 消息类型常量
     */

    const MSG_TYPE_TEXT       = 'text';
    const MSG_TYPE_IMAGE      = 'image';
    const MSG_TYPE_VOICE      = 'voice';
    const MSG_TYPE_VIDEO      = 'video';
    const MSG_TYPE_SHORTVIDEO = 'shortvideo';
    const MSG_TYPE_LOCATION   = 'location';
    const MSG_TYPE_LINK       = 'link';
    const MSG_TYPE_MUSIC      = 'music';
    const MSG_TYPE_NEWS       = 'news';
    const MSG_TYPE_EVENT      = 'event';

    /**
     * 事件类型常量
     */
    const MSG_EVENT_SUBSCRIBE   = 'subscribe';
    const MSG_EVENT_UNSUBSCRIBE = 'unsubscribe';
    const MSG_EVENT_SCAN        = 'SCAN';
    const MSG_EVENT_LOCATION    = 'LOCATION';
    const MSG_EVENT_CLICK       = 'CLICK';
    const MSG_EVENT_VIEW        = 'VIEW';

    /**
     * 微信推送过来的数据
     * @var array
     */
    private $data = array();

    /**
     * 微信TOKEN
     * @var string
     */
    private static $token = '';

    /**
     * 微信APP_ID
     * @var string
     */
    private static $appId = '';

    /**
     * 消息加密KEY
     * @var string
     */
    private static $encodingAESKey = '';

    /**
     * 是否使用安全模式
     * @var boolean
     */
    private static $msgSafeMode = false;

    /**
     * 构造方法，用于实例化微信SDK
     * 自动回复消息时实例化该SDK
     * @param string $token 微信后台填写的TOKEN
     * @param string $appid 微信APPID (安全模式和兼容模式有效)
     * @param string $key   消息加密KEY (EncodingAESKey)
     */
    public function __construct($token='', $appid = '', $key = ''){
        //设置安全模式
//        if(isset($_GET['encrypt_type']) && $_GET['encrypt_type'] == 'aes'){
//            self::$msgSafeMode = true;
//        }
//
//        //参数验证
//        if(self::$msgSafeMode){
//            if(empty($key) || empty($appid)){
//                throw new \Exception('缺少参数EncodingAESKey或APP_ID！');
//            }
//
//            self::$appId          = $appid;
//            self::$encodingAESKey = $key;
//        }

        //TOKEN验证
//        if($token){
//            self::auth($token) || exit;
//
//            if(IS_GET){
//                exit($_GET['echostr']);
//            } else {
//                self::$token = $token;
//                $this->init();
//            }
//        } else {
//            throw new \Exception('缺少参数TOKEN！');
//        }
        $this->init();
    }

    /**
     * 初始化微信推送的数据
     */
    private function init(){
        $xml  = file_get_contents("php://input");
        file_put_contents('./data/Runtime/Data/data_xml.json', $xml);
        $data = self::xml2data($xml);

        //安全模式 或兼容模式
        if(self::$msgSafeMode){
            if(isset($data['MsgType'])){
                //兼容模式追加解密后的消息内容
                $data['Decrypt'] = self::extract($data['Encrypt']);
            } else {
                //安全模式
                $data = self::extract($data['Encrypt']);
            }
        }

        $this->data = $data;
    }

    /**
     * 获取微信推送的数据
     * @return array 转换为数组后的数据
     */
    public function request(){
        return $this->data;
    }

    /**
     * * 响应微信发送的信息（自动回复）
     * @param  array  $content 回复信息，文本信息为string类型
     * @param  string $type    消息类型
     */
    public function response($content, $type = self::MSG_TYPE_TEXT){
        /* 基础数据 */
        $data = array(
            'ToUserName'   => $this->data['FromUserName'],
            'FromUserName' => $this->data['ToUserName'],
            'CreateTime'   => NOW_TIME,
            'MsgType'      => $type,
        );

        /* 按类型添加额外数据 */
        $content = call_user_func(array(self, $type), $content);
        if($type == self::MSG_TYPE_TEXT || $type == self::MSG_TYPE_NEWS){
            $data = array_merge($data, $content);
        } else {
            $data[ucfirst($type)] = $content;
        }

        //安全模式，加密消息内容
        if(self::$msgSafeMode){
            $data = self::generate($data);
        }

        /* 转换数据为XML */
        $xml = new \SimpleXMLElement('<xml></xml>');
        self::data2xml($xml, $data);
        exit($xml->asXML());
    }

    /**
     * 回复文本消息
     * @param  string $text   回复的文字
     */
    public function replyText($text){
        return $this->response($text, self::MSG_TYPE_TEXT);
    }

    /**
     * 回复图片消息
     * @param  string $media_id 图片ID
     */
    public function replyImage($media_id){
        return $this->response($media_id, self::MSG_TYPE_IMAGE);
    }

    /**
     * 回复语音消息
     * @param  string $media_id 音频ID
     */
    public function replyVoice($media_id){
        return $this->response($media_id, self::MSG_TYPE_VOICE);
    }

    /**
     * 回复视频消息
     * @param  string $media_id    视频ID
     * @param  string $title       视频标题
     * @param  string $discription 视频描述
     */
    public function replyVideo($media_id, $title, $discription){
        return $this->response(func_get_args(), self::MSG_TYPE_VIDEO);
    }

    /**
     * 回复音乐消息
     * @param  string $title          音乐标题
     * @param  string $discription    音乐描述
     * @param  string $musicurl       音乐链接
     * @param  string $hqmusicurl     高品质音乐链接
     * @param  string $thumb_media_id 缩略图ID
     */
    public function replyMusic($title, $discription, $musicurl, $hqmusicurl, $thumb_media_id){
        return $this->response(func_get_args(), self::MSG_TYPE_MUSIC);
    }

    /**
     * 回复图文消息，一个参数代表一条信息
     * @param  array  $news   图文内容 [标题，描述，URL，缩略图]
     * @param  array  $news1  图文内容 [标题，描述，URL，缩略图]
     * @param  array  $news2  图文内容 [标题，描述，URL，缩略图]
     *                ...     ...
     * @param  array  $news9  图文内容 [标题，描述，URL，缩略图]
     */
    public function replyNews($news, $news1, $news2, $news3){
        return $this->response(func_get_args(), self::MSG_TYPE_NEWS);
    }

    /**
     * 回复一条图文消息
     * @param  string $title       文章标题
     * @param  string $discription 文章简介
     * @param  string $url         文章连接
     * @param  string $picurl      文章缩略图
     */
    public function replyNewsOnce($title, $discription, $url, $picurl){
        return $this->response(array(func_get_args()), self::MSG_TYPE_NEWS);
    }

    /**
     * 数据XML编码
     * @param  object $xml  XML对象
     * @param  mixed  $data 数据
     * @param  string $item 数字索引时的节点名称
     * @return string
     */
    protected static function data2xml($xml, $data, $item = 'item') {
        foreach ($data as $key => $value) {
            /* 指定默认的数字key */
            is_numeric($key) && $key = $item;

            /* 添加子元素 */
            if(is_array($value) || is_object($value)){
                $child = $xml->addChild($key);
                self::data2xml($child, $value, $item);
            } else {
                if(is_numeric($value)){
                    $child = $xml->addChild($key, $value);
                } else {
                    $child = $xml->addChild($key);
                    $node  = dom_import_simplexml($child);
                    $cdata = $node->ownerDocument->createCDATASection($value);
                    $node->appendChild($cdata);
                }
            }
        }
    }

    /**
     * XML数据解码
     * @param  string $xml 原始XML字符串
     * @return array       解码后的数组
     */
    protected static function xml2data($xml){
        $xml = new \SimpleXMLElement($xml);

        if(!$xml){
            throw new \Exception('非法XXML');
        }

        $data = array();
        foreach ($xml as $key => $value) {
            $data[$key] = strval($value);
        }

        return $data;
    }

    /**
     * 对数据进行签名认证，确保是微信发送的数据
     * @param  string $token 微信开放平台设置的TOKEN
     * @return boolean       true-签名正确，false-签名错误
     */
    protected static function auth($token){
        /* 获取数据 */
        $data = array($_GET['timestamp'], $_GET['nonce'], $token);
        $sign = $_GET['signature'];

        /* 对数据进行字典排序 */
        sort($data, SORT_STRING);

        /* 生成签名 */
        $signature = sha1(implode($data));
        return $signature === $sign;
    }

    /**
     * 构造文本信息
     * @param  string $content 要回复的文本
     */
    private static function text($content){
        $data['Content'] = $content;
        return $data;
    }

    /**
     * 构造图片信息
     * @param  integer $media 图片ID
     */
    private static function image($media){
        $data['MediaId'] = $media;
        return $data;
    }

    /**
     * 构造音频信息
     * @param  integer $media 语音ID
     */
    private static function voice($media){
        $data['MediaId'] = $media;
        return $data;
    }

    /**
     * 构造视频信息
     * @param  array $video 要回复的视频 [视频ID，标题，说明]
     */
    private static function video($video){
        $data = array();
        list(
            $data['MediaId'],
            $data['Title'],
            $data['Description'],
            ) = $video;

        return $data;
    }

    /**
     * 构造音乐信息
     * @param  array $music 要回复的音乐[标题，说明，链接，高品质链接，缩略图ID]
     */
    private static function music($music){
        $data = array();
        list(
            $data['Title'],
            $data['Description'],
            $data['MusicUrl'],
            $data['HQMusicUrl'],
            $data['ThumbMediaId'],
            ) = $music;

        return $data;
    }

    /**
     * 构造图文信息
     * @param  array $news 要回复的图文内容
     * [
     *      0 => 第一条图文信息[标题，说明，图片链接，全文连接]，
     *      1 => 第二条图文信息[标题，说明，图片链接，全文连接]，
     *      2 => 第三条图文信息[标题，说明，图片链接，全文连接]，
     * ]
     */
    private static function news($news){
        $articles = array();
        foreach ($news as $key => $value) {
            list(
                $articles[$key]['Title'],
                $articles[$key]['Description'],
                $articles[$key]['Url'],
                $articles[$key]['PicUrl']
                ) = $value;

            if($key >= 9) break; //最多只允许10条图文信息
        }
        $data['ArticleCount'] = count($articles);
        $data['Articles']     = $articles;

        return $data;
    }

    /**
     * 验证并解密密文数据
     * @param  string $encrypt 密文
     * @return array           解密后的数据
     */
    private static function extract($encrypt){
        //验证数据签名
        $signature = self::sign($_GET['timestamp'], $_GET['nonce'], $encrypt);
        if($signature != $_GET['msg_signature']){
            throw new \Exception('数据签名错误！');
        }

        //消息解密对象
        $WechatCrypt = new WechatCrypt(self::$encodingAESKey, self::$appId);

        //解密得到回明文消息
        $decrypt = $WechatCrypt->decrypt($encrypt);

        //返回解密的数据
        return self::xml2data($decrypt);
    }

    /**
     * 加密并生成密文消息数据
     * @param  array $data 获取到的加密的消息数据
     * @return array       生成的加密消息结构
     */
    private static function generate($data){
        /* 转换数据为XML */
        $xml = new \SimpleXMLElement('<xml></xml>');
        self::data2xml($xml, $data);
        $xml = $xml->asXML();

        //消息加密对象
        $WechatCrypt = new WechatCrypt(self::$encodingAESKey, self::$appId);

        //加密得到密文消息
        $encrypt = $WechatCrypt->encrypt($xml);

        //签名
        $nonce     = mt_rand(0, 9999999999);
        $signature = self::sign(NOW_TIME, $nonce, $encrypt);

        /* 加密消息基础数据 */
        $data = array(
            'Encrypt'      => $encrypt,
            'MsgSignature' => $signature,
            'TimeStamp'    => NOW_TIME,
            'Nonce'        => $nonce,
        );

        return $data;
    }

    /**
     * 生成数据签名
     * @param  string $timestamp 时间戳
     * @param  string $nonce     随机数
     * @param  string $encrypt   被签名的数据
     * @return string            SHA1签名
     */
    private static function sign($timestamp, $nonce, $encrypt){
        $sign  = array(self::$token, $timestamp, $nonce, $encrypt);
        sort($sign, SORT_STRING);
        return sha1(implode($sign));
    }
}


class WechatCrypt{
    /**
     * 加密KEY
     * @var string
     */
    private $cyptKey = '';

    /**
     * 公众平台APPID
     * @var string
     */
    private $appId = '';

    /**
     * 构造方法，初始化加密KEY
     * @param string $key   加密KEY
     * @param string $appid 微信APP_KEY
     */
    public function __construct($key, $appid){
        if($key && $appid){
            $this->appId   = $appid;
            $this->cyptKey = base64_decode($key . '=');
        } else {
            throw new \Exception('缺少参数 APP_ID 和加密KEY!');
        }
    }

    /**
     * 对明文进行加密
     * @param  string $text  需要加密的字符串
     * @return string        密文字符串
     */
    public function encrypt($text){
        //填充到明文之前的随机字符
        $random = self::getRandomStr(16);

        //网络字节序
        $size = pack("N", strlen($text));

        //生成被加密字符串
        $text = $random . $size . $text . $this->appId;

        //打开加密算法模块
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');

        //使用PKCS7对明文进行补位
        $text = self::PKCS7Encode($text, mcrypt_enc_get_key_size($td));

        //初始化加密算法模块
        mcrypt_generic_init($td, $this->cyptKey, substr($this->cyptKey, 0, 16));

        //执行加密
        $encrypt = mcrypt_generic($td, $text);

        //关闭加密算法模块
        mcrypt_generic_deinit($td);
        mcrypt_module_close($td);

        //输出密文
        return base64_encode($encrypt);
    }

    /**
     * 对密文进行解密
     * @param  string $encrypt 密文
     * @return string          明文
     */
    public function decrypt($encrypt){
        //BASE64解码
        $encrypt = base64_decode($encrypt);

        //打开加密算法模块
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');

        //初始化加密算法模块
        mcrypt_generic_init($td, $this->cyptKey, substr($this->cyptKey, 0, 16));

        //执行解密
        $decrypt = mdecrypt_generic($td, $encrypt);

        //去除PKCS7补位
        $decrypt = self::PKCS7Decode($decrypt, mcrypt_enc_get_key_size($td));

        //关闭加密算法模块
        mcrypt_generic_deinit($td);
        mcrypt_module_close($td);

        if(strlen($decrypt) < 16){
            throw new \Exception("非法密文字符串！");
        }

        //去除随机字符串
        $decrypt = substr($decrypt, 16);

        //获取网络字节序
        $size = unpack("N", substr($decrypt, 0, 4));
        $size = $size[1];

        //APP_ID
        $appid = substr($decrypt, $size + 4);

        //验证APP_ID
        if($appid !== $this->appId){
            throw new \Exception("非法APP_ID！");
        }

        //明文内容
        $text = substr($decrypt, 4, $size);

        return $text;
    }

    /**
     * PKCS7填充字符
     * @param string  $text 被填充字符
     * @param integer $size Block长度
     */
    private static function PKCS7Encode($text, $size){
        //字符串长度
        $str_size = strlen($text);

        //填充长度
        $pad_size = $size - ($str_size % $size);
        $pad_size = $pad_size ? : $size;

        //填充的字符
        $pad_chr = chr($pad_size);

        //执行填充
        $text = str_pad($text, $str_size + $pad_size, $pad_chr, STR_PAD_RIGHT);

        return $text;
    }

    /**
     * 删除PKCS7填充的字符
     * @param string  $text 已填充的字符
     * @param integer $size Block长度
     */
    private static function PKCS7Decode($text, $size){
        //获取补位字符
        $pad_str = ord(substr($text, -1));

        if ($pad_str < 1 || $pad_str > $size) {
            return '';
        } else {
            return substr($text, 0, strlen($text) - $pad_str);
        }
    }

    /**
     * 生成指定长度的字符串
     * @param  integer $len 字符串长度
     * @return string       生成的字符串
     */
    private static function getRandomStr($len){
        static $pol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";

        $str = '';
        $max = strlen($pol) - 1;
        for ($i = 0; $i < $len; $i++) {
            $str .= $pol[mt_rand(0, $max)];
        }

        return $str;
    }
}