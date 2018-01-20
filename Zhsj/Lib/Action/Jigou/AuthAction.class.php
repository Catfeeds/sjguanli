<?php

class AuthAction extends Action
{
    /*
     * 授权入口
     * */
    public function index()
    {
        Vendor('WxSDK.wxsdkent');
        //分享授权后用于转向到分享的地址
        $redirect_uri = isset($_GET['redirect_uri']) ? $_GET['redirect_uri'] : '';
        cookie('redirect_uri',$redirect_uri,60);
        //获取uid
        $u_id = isset($_GET['ent_u_id']) ? $_GET['ent_u_id'] : '';
        cookie('ent_u_id',$u_id,60);
        //通过网页获取openid
        $u_openid = session('ent_u_openid');
        //$SERVER_NAME = 'www.shijian666.com';
        $SERVER_NAME = $_SERVER['SERVER_NAME'];
        if (empty($u_openid)) {
            if (!isset($_GET['code'])) {
                session('ent_u_id', null);
                session('ent_u_openid', null);
                session('ent_oauth_info', null);
                $callback = urlencode('http://'.$SERVER_NAME.'/Jigou/Auth/callBack');
                $wx = new WxApiEnt();
                $url = $wx->wxOauthUserinfo($callback);
                $wx->wxHeader($url);
            }
        } else {
            $tmp_user_id = M('users')->where(array('p_openid'=>$u_openid))->getField('user_id');//11227;//
            setcookie('ent_src_user_id', $tmp_user_id, time() + 86400, '/');
            if(!empty($redirect_uri)){
                $temp = explode('-',$redirect_uri);
                $redirect_uri = implode('/',$temp);
                $temp = explode('0',$redirect_uri);
                $redirect_uri = implode('.',$temp);
                $temp = explode('2',$redirect_uri);
                $redirect_uri = implode('#',$temp);
                header('location:'.$redirect_uri);
                exit;
            }else {
                redirect('/Jigou/Index/index');
            }
        }
    }

    /*
     * 授权回调地址
     * */
    public function callBack()
    {
        Vendor('WxSDK.wxsdkent');
        $wx_obj = new WxApiEnt();
        $ocde =  $_GET['code'];
        $info  = $wx_obj->wxOauthAccessToken($ocde);
        $user_info = $wx_obj->wxOauthUser($info['access_token'], $info['openid']);
        if(!empty($user_info)){
            //判断用户是存入数据库了,没有就插入
            $user = M('users')->where(array('p_openid'=>$user_info['openid']))->find();
            if(!empty($user)){
                session('ent_u_openid',$user['p_openid']);
                session('ent_u_id',$user['user_id']);
                redirect('/Jigou/Index/index');
            }
            $input = array(
                //code ...
                'account' => 'wx_ent_'.time(),
                'p_openid' => $user_info['openid'],
                'reg_time' => time(),
                'nickname' => $user_info['nickname'],
            );
            $uid = M('users')->add($input);
            if($uid){
                session('ent_u_openid', $info['openid']);
                session('ent_u_id', $uid);
                redirect('/Jigou/Index/index');
            }
        }else{
            header('HTTP/1.1 404 授权错误~');
            exit;
        }
    }

    /*
     * 获取微信jsJDK的配置参数
     * */
    public function getJsConfig()
    {
        Vendor('WxSDK.wxsdkent');
        $wx_obj = new WxApiEnt();
        $js_config = $wx_obj->wxJsapiPackage();
        return $js_config;
    }

    //测试用于创建菜单
    public function createMenus()
    {
        //执行创建菜单
        vendor('WxSDK.wxsdkent');
        $wx_obj = new WxApiEnt();
        $SERVER_NAME = $_SERVER['SERVER_NAME'];
        $menus = '{
                     "button":
                     [{	
                          "type":"view",
                          "name":"管理中心",
                          "url":"http://'.$SERVER_NAME.'/merchant"
                      },
                      {	
                          "type":"view",
                          "name":"验证券码",
                          "url":"http://'.$SERVER_NAME.'/merchant/#/identifyNum"
                      }]
                 }';
        $res = $wx_obj->wxMenuCreate($menus);
        print_r($res);
    }

    //测试用于删除菜单
    public function delMenus()
    {
        vendor('WxSDK.wxsdkent');
        $wx_obj = new WxApiEnt();
        $res = $wx_obj->wxMenuDelete();
        printf($res);
    }

    //事件参数,消息,等微信接受入口
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
            if($data && is_array($data)) {
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
                //$this->executeWxEvent($wechat, $data);
            }
            
        } catch(\Exception $e){
            file_put_contents('./data/Runtime/Data/error.json', json_encode($e->getMessage()));
        }

    }

    /*
     * 微信开发者自定义菜单事件
     * */
    private function executeWxEvent($wechat, $data){
        switch ($data['MsgType']) {
            case Wechat::MSG_TYPE_EVENT:
                switch ($data['Event']) {
                    case Wechat::MSG_EVENT_SUBSCRIBE:
                        file_put_contents('./data/Runtime/Data/MSG_EVENT_SUBSCRIBE_data.json', json_encode($data));
                        $EventKey = $data['EventKey'];
                        if(empty($EventKey)){       //通过分享链接关注
                            //关注改变用户关注状态
                            $openid = $data['FromUserName'];
                            //M('users')->where(array('p_openid' => $openid))->save(array('is_subscribe' => 1));
                            Vendor('WxSDK.wxsdkent');
                            $wx_obj = new WxApiEnt();
                            $access_token = $wx_obj->wxAccessToken();
                            $user_info = $wx_obj->wxOauthUser($access_token, $openid);
                            if (!empty($user_info)) {
                                $pid = 99999;   //通过分享链接关注
                                //判断用户是否存在，不存在则新增
                                $user = M('users')->where(array('p_openid' => $openid))->find();
                                if (!empty($user)) {
                                    M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1,'nickname'=>$user_info['nickname'],'face'=>$user_info['headimgurl']));
                                    //判断用户父级不存在,并且当前邀请u_id不是自己
                                    if(empty($user['pid']) && $user['user_id'] != $pid){
                                        M('users')->where(array('p_openid' => $openid))->save(array('pid'=>$pid));
                                    }
                                }else{
                                    $rand_code = rand(1000,9999);
                                    $input = array(
                                        'account' => 'wx_ent_' . time() . $rand_code,
                                        'p_openid' => $openid,
                                        'reg_time' => time(),
                                        'nickname' => $user_info['nickname'],
                                        'face' => $user_info['headimgurl'],
                                        'pid' => $pid,
                                        'is_subscribe' => 1,
                                    );
                                    M('users')->add($input);
                                }
                            }
                            //$wechat->replyText("通过分享链接关注");break;
                        }else{
                            $openid = $data['FromUserName'];
                            $key_res = explode('_', $EventKey);
                            $pid = $key_res[1];
                            Vendor('WxSDK.wxsdkent');
                            $wx_obj = new WxApiEnt();
                            $access_token = $wx_obj->wxAccessToken();
                            $user_info = $wx_obj->wxOauthUser($access_token, $openid);
                            if (!empty($user_info)) {
                                //判断用户是否存在，不存在则新增
                                $user = M('users')->where(array('p_openid' => $openid))->find();
                                if (!empty($user)) {
                                    M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1,'nickname'=>$user_info['nickname'],'face'=>$user_info['headimgurl']));
                                    //判断用户父级不存在,并且当前邀请u_id不是自己
                                    if(empty($user['pid']) && $user['user_id'] != $pid){
                                        M('users')->where(array('p_openid' => $openid))->save(array('pid'=>$pid));
                                    }
                                }else{
                                    $rand_code = rand(1000,9999);
                                    $input = array(
                                        'account' => 'wx_ent_' . time() . $rand_code,
                                        'p_openid' => $openid,
                                        'reg_time' => time(),
                                        'nickname' => $user_info['nickname'],
                                        'face' => $user_info['headimgurl'],
                                        'pid' => $pid,
                                        'is_subscribe' => 1,
                                    );
                                    M('users')->add($input);
                                }
                            }
                            //$wechat->replyText("通过分享二维码扫描关注");break;
                        }
                        //调用卷功能
                        //$this->yJuan($openid);
                        $wechat->replyText("欢迎关注【综合实践平台机构端】！综合实践平台将整合优质素质教育资源，为小、中、高教育阶段的学生带来丰富综合实践拓展活动！您可通过下方菜单栏查看最新活动、资讯、以及个人动态。助力您的素质教育全面发展！");
                        break;

                    case Wechat::MSG_EVENT_UNSUBSCRIBE:
                        $openid = $data['FromUserName'];
                        M('users')->where(array(
                            'p_openid' => $openid
                        ))->save(array(
                            'is_subscribe' => 0
                        ));
                        $wechat->replyText('对不起,不知为何您取消关注学生综合实践平台公众平台!');
                        break;

                    case Wechat::MSG_EVENT_CLICK:
                        $openid = $data['FromUserName'];
                        file_put_contents('./data/Runtime/Data/FromUserName_data.json', json_encode($data));
                        vendor('WxSDK.wxsdkent');
                        $wx_obj = new WxApiEnt();
                        //$access_token = $wx_obj->wxAccessToken();
                        //$user_info = $wx_obj->wxOauthUser($access_token, $openid);
                        //$menus = $wx_obj->getMenu();
                        $listen_key = 'V1001_GOOD';//$menus['selfmenu_info']['button']['2']['sub_button']['list']['0']['value'];
                        if($data['EventKey'] == $listen_key){
                            //======================点击我的邀请码推送文本消息START=================================
                            $data = '{
                            "touser":"'.$openid.'",
                            "msgtype":"text",
                            "text":{"content":"么么哒！现在你只需要转发以下图片至2个好友，好友扫码通过后，就可以获得10元优惠券。如果4个好友扫码通过，你将获得20元优惠券，快快转发吧！"}
                         }';
                            $message_data = $wx_obj->wxCustomMessageSend($data);
                            //file_put_contents('./message_data_data.json', $message_data);
                            //======================点击我的邀请码推送文本消息END=================================
                            //发送二维码图片信息
                            $users = M('users')->where(array('p_openid' => $openid))->find();
                            $user_id = $users['user_id'];
                            $curl_data='{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": '.$user_id.'}}}';
                            $result = $wx_obj->wxQrCodeTicket($curl_data);
                            $json_info = json_decode($result,true);
                            if(!empty($json_info) && $json_info['ticket']){
                                $src_url = $wx_obj->wxQrCode($json_info['ticket']);
                                $QrcodeWater = D('QrcodeWater','Service');
                                $qrcode_url = $QrcodeWater->qrcodeWater($src_url,$user_id);
                                //file_put_contents('./qrcode_url_data.json', $qrcode_url);
                                $jsonData = array('media'=>'@' . $qrcode_url);
                                $result = $wx_obj->weixin_uploadImg($jsonData);
                                $media_id = $result['media_id'];
                                $wechat->replyImage($media_id);
                            }
                        }
                        break;

                    default:
                        break;
                }
                break;

            case Wechat::MSG_TYPE_TEXT:
                switch ($data['Content']) {
                    case '文本':
                        $wechat->replyText("欢迎关注【综合实践平台机构端】！综合实践平台将整合优质素质教育资源，为小、中、高教育阶段的学生带来丰富综合实践拓展活动！您可通过下方菜单栏查看最新活动、资讯、以及个人动态。助力您的素质教育全面发展！");
                        //$wechat->replyText("嗨，欢迎您的关注！[愉快]\n\n10月1日，贝拉小镇盛大开园！[玫瑰]现预售期间“三人同行，爸妈免单”，购买原价440元的课程体验卡（套卡），尊享260元特惠价！[礼物]\n\n有任何问题都可以拨打客服电话：17700796769，我们为您解答~~[爱心]");
                        break;

                }
                break;
        }
    }



}