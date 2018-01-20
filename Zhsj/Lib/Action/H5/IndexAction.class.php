<?php
/**
 * Created by PhpStorm.
 * Date: 2017/9/22
 * Time: 9:38
 */
//define('MCHID',1489662692);
class IndexAction extends BaseAction
{

    //默认首页
    //用户获取活动
    public function index()
    {
        $js_config = R('H5/Wxauth/getJsConfig');  //调取微信jssdk参数
        $openid = session('u_openid');
        //$openid = cookie('src_user_openid');
        //$u_id = session('u_id');
        Vendor('WxSDK.wxsdk');
        $wx_obj = new WxApi();
        $wx_userinfo_remote = $wx_obj->wxGetUser($openid); //更具openid 拿到公众号用户信息
        $wx_userinfo = M('users')->where(array('p_openid'=>$openid))->find();
        if($wx_userinfo_remote['subscribe'] == 1 && $wx_userinfo['is_subscribe'] != 1){
            //兼容以前已经关注的用户
            M('users')->where(array('p_openid'=>$openid))->save(array('is_subscribe'=>1));
            //R('H5/Wxauth/yjuan');
        }
        setcookie('src_user_id', $wx_userinfo['user_id'], time() + 99 * 365 * 24 * 3600, '/');
        redirect('/frontend/index.html#/');
        /*
        $SERVER_NAME = 'www.shijian666.com';
        $wx_share = array(
            'title' => '贝拉小镇10.1开园预售，三人同行，爸妈免单！',
            'desc' => '这是一个有趣的活动，贝拉小镇10.1开园预售，三人同行，爸妈免单！',
            'link' =>  'http://'.$SERVER_NAME.'/H5/Wxauth/index/u_id/'.$wx_userinfo['user_id'],
            'imgurl' => 'http://'.$SERVER_NAME.'/Public/H5/image/small_log.png',
        );
        */
        /*
        $this->assign(array(
            'wx_userinfo' => $wx_userinfo,
            'js_config' => $js_config,
            'u_openid' => $openid,
            'wx_share' => $wx_share
        ));
        $this->display();
        */
    }

    //定时检测
    public function checkOrder()
    {


    }

    /*
     * 微信模板消息
     * */
    public function weixin_tmp_msg(){
        $APPID = "wx14bb80c57431331d";
        $SECRET = "d9f2c6e4749398419b3cca839beb2f41";
        $ac = file_get_contents('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$APPID.'&secret='.$SECRET);
        file_put_contents('./data/Runtime/Data/template_message_data.json', json_encode($ac));
        $wxt = json_decode($ac,true);
        $url = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=' . $wxt['access_token'];//access_token改成你的有效值
        $data = array(
            'first' => array(
                'value' => '这是一个测试消息！',
                'color' => '#FF0000'
            ),
            'keyword1' => array(
                'value' => '张鹏',
                'color' => '#FF0000'
            ),
            'keyword2' => array(
                'value' => '0.01元',
                'color' => '#FF0000'
            ),
            'keyword3' => array(
                'value' => '申请退款',
                'color' => '#FF0000'
            ),
            'remark' => array(
                'value' => '点击查看退款进度！',
                'color' => '#FF0000'
            )
        );
        $template_msg = array(
            'touser'=>'oGFRB0y0NYaIwPtT2EuVfMUgVy6I',
            'template_id'=>'62YsMBLdna-dCSbfOWYvhQwH9dxzzMNZgPRL8i6WKn8',
            'topcolor'=>'#FF0000',
            'url' => 'http://www.baidu.com',
            'data'=>$data
        );
        $curl = curl_init($url);
        $header = array();
        $header[] = 'Content-Type: application/x-www-form-urlencoded';
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        // 不输出header头信息
        curl_setopt($curl, CURLOPT_HEADER, 0);
        // 伪装浏览器
        curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
        // 保存到字符串而不是输出
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // post数据
        curl_setopt($curl, CURLOPT_POST, 1);
        // 请求数据
        curl_setopt($curl,CURLOPT_POSTFIELDS,json_encode($template_msg));
        $response = curl_exec($curl);
        curl_close($curl);
        file_put_contents('./data/Runtime/Data/template_message_data.json', json_encode($response));
        //echo $response;
    }

    /*
     * 使用PHP二维码生成类库PHP QR Code生成二维码
     * */
    public function qrCode(){
        $order_id = 1;
        $ect_code = rand(100000,999999);
        $QRcode = D('QrcodeWater', 'Service');
        $QR_dir = 'Public/qrcode/shijian/'.date('Ymd',time()).'/';
        if (!is_dir($QR_dir)){
            mkdir($QR_dir,0777,true);
        }
        $result = $QRcode->png($ect_code, $QR_dir . $order_id . '.png');
        var_dump($result);die();
    }

    /*
     *  添加活动
     * */
    public function addActive()
    {
        if(IS_AJAX){
            $num = (int)I('post.num');
            $price = I('post.price');
            $totalPrice = I('post.totalPrice');
            $coupon_amount = I('post.coupon_amount');
            $coupon_id = (int)I('post.coupon_id');
            $new_coupon_id  = (int)I('post.new_coupon_id');
            $k_juan = I('post.k_juan');
            //$original_price = I('post.original_price');
            $original_price = ($totalPrice + $coupon_amount);

            $num1 = (int)I('post.num1');
            $num2 = (int)I('post.num2');
            $price1 = I('post.price1');
            $price2 = I('post.price2');
            $goods_id1 = (int)I('post.goods_id1');
            $goods_id2 = (int)I('post.goods_id2');

            $goods_info = $_POST['goods_info'];     //I('post.goods_info');
            if(empty($goods_info)){
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '未选择活动信息'
                ));
            }
            $shop_id = (int)I('post.shop_id');
            $shop_info = M('users')->alias('u')
                ->field('u.user_id,s.shop_id')
                ->join('bao_shop as s on s.user_id = u.user_id')
                ->where(array('s.shop_id' => $shop_id))
                ->find();

            $user_info = M('users')->where(array('p_openid' => session('u_openid')))->find();

            if(time() > strtotime("2017-12-31 23:59:59")){
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '活动已经结束'
                ));
            }
            $use_date_str = I('post.ymd'); //选择游玩时间
            $use_date = strtotime($use_date_str);
            if($use_date_str == '--' || $use_date <= 0){
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '请选择时间'
                ));
            }
            $start_date = strtotime("2017-10-01"); //设定开始时间
            $end_date   = strtotime("2017-12-31"); //设定结束时间
            if( ($use_date < $start_date) && ($use_date > $end_date)  ){
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '游玩时间必须在2017年12月31日之前'
                ));
            }
            $ordername = $user_info['truename']; //客户姓名
            if(!$ordername){
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '请填写姓名'
                ));
            }
            //准生产内测权限关闭开启
            $tmp_user_list = array(10091,10137,10084,10085,10083,10090,10088,10508);
            if(!in_array($this->u_id, $tmp_user_list)){
                //$this->ajaxReturn(array('code' => 0, 'msg' => '系统正在内测中，敬请期待！'));
            }
            //下单开始
            $error_num = 0;
            M()->startTrans();
            //创建父级订单
            $input = [
                'user_id' => $this->u_id,   //微信授权的id
                'shop_id' => $shop_id,
                'original_price' => $original_price,
                'total_price' => $totalPrice,
                'coupon_amount' => $coupon_amount,
                'coupon_id' => $new_coupon_id,
                'create_time' => time(),
                'update_time' => time(),
                'status' => 0,   //状态
                //'act_code' => mt_rand(111111, 999999),
                'juan_num' => $k_juan,
                'check_time' => time() + 120,    //用于检测订单时间,
                'yw_time' => $use_date
            ];
            $parent_order_id = M('order_parent')->add($input);
            if($parent_order_id <= 0){
                $error_num++;
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '创建父级订单失败'
                ));
            }
            foreach ($goods_info as $key => $goods){
                $total_num = (int)$goods['num'];
                for ($ii = 0; $ii < $total_num; $ii++ ){
                    $input = [
                        'parent_order_id' => $parent_order_id,
                        'user_id' => $this->u_id,   //微信授权的id
                        'shop_id' => $shop_id,
                        'total_price' => $goods['price'],
                        'create_time' => time(),
                        'update_time' => time(),
                        'status' => 0,   //状态
                        //'act_code' => mt_rand(111111, 999999),
                        'juan_num' => $k_juan,
                        'check_time' => time() + 120,    //用于检测订单时间,
                        'yw_time' => $use_date
                    ];
                    $order_id = M('order')->add($input);
                    if($order_id <= 0){
                        $error_num++;
                    }
                    $input_goods = [
                        'order_id' => $order_id,
                        'goods_id' => $goods['goods_id'],
                        'shop_id' => $shop_id,
                        'num' => 1,
                        'price' => $goods['price'],
                        'total_price' => $goods['price'],
                    ];
                    $res = M('order_goods')->add($input_goods);
                    if($res <= 0){
                        $error_num++;
                    }
                }
            }

            if($error_num == 0){
                M()->commit();
                //跳转支付
                $this->ajaxReturn(array(
                    'code' => 1,
                    'msg' => '购买成功跳转支付',
                    'data' => array(
                        'order_id' => $parent_order_id
                    )
                ));
            }else{
                M()->rollback();
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '购买商品失败'
                ));
            }
        }else{
            $shop_id = (int)I('get.shop_id');
            $goods_id = (int)I('get.goods_id');
            $coupon_id = (int)I('get.coupon_id');
            $new_coupon_id = $coupon_id;
            $coupon_status = 0;
            cookie('shop_id', $shop_id, time() + 99 * 365 * 24 * 3600);
            cookie('goods_id', $goods_id, time() + 99 * 365 * 24 * 3600);
            cookie('coupon_id', $coupon_id, time() + 99 * 365 * 24 * 3600);
            $coupon_amount = 0;
            if($coupon_id > 0) {
                $user_coupons = M('user_coupons')->where(array('coupon_id' => $coupon_id, 'status' => 0))->find();
                if (!empty($user_coupons)) {
                    $coupon_status = 1;
                    $new_coupon_id = (int)$user_coupons['coupon_id'];
                    $coupon_amount = (int)$user_coupons['amount'];
                }
            }elseif($coupon_id == -1){
                $user_coupons = M('user_coupons')->where(array('user_id'=>$this->u_id,'status'=>0))->order('amount desc')->select();
                if (!empty($user_coupons)) {
                    $coupon_status = 2;
                    $new_coupon_id = (int)$user_coupons[0]['coupon_id'];
                    $coupon_amount = (int)$user_coupons[0]['amount'];
                }

            }
            //获取机构详情
            $price_list = '';
            $goods_list = M('goods')->where(array('goods_id'=>$goods_id))->select();
            foreach ($goods_list as $key => $val){
                $price_list .= $val['price'] . ',';
                $goods_list[$key]['price'] = $val['price'];
                $goods_list[$key]['index'] = $key;
            }
            $price_list = substr($price_list, 0, strlen($price_list)-1);
            //var_dump($price_list);die();
            $openid = session('u_openid');//'o46gs1uYBLZlh1WAHwgqBVL54L2s';//
            $user_info = M('users')->where(array('p_openid'=>$openid))->find();
            if(!$user_info['mobile']){
                redirect('/H5/Index/bindMobile');
            }
            $u_id = $this->u_id;
            $not_used_conpon = count(M('user_coupons')->where(array('user_id'=>$u_id,'status'=>0))->select());
            $yjuan_info  = M('yjuan')->where(array('user_id'=>$u_id))->find();
            if(!empty($yjuan_info)){
                $is_use_num = $yjuan_info['nums'] - $yjuan_info['use_num'];  //可以使用的卷
                if($is_use_num >= 2){
                    $k_juan = 2;
                }else if($is_use_num > 0){
                    $k_juan = 1;
                }else{
                    $k_juan = 0;
                }
                $total_juan = $is_use_num;
            }else{
                $k_juan = 0;
                $total_juan = 0;
                $is_use_num = 0;
            }
            //var_dump($goods_list);die();
            $this->assign(array(
                'user_id' => $this->u_id,   //微信授权的id
                'not_used_conpon' => $not_used_conpon,
                'shop_id' => $shop_id,
                'goods_id' => $goods_id,
                'coupon_amount' => $coupon_amount,
                'coupon_id' => $coupon_id,
                'new_coupon_id' => $new_coupon_id,
                'coupon_status' => $coupon_status,
                'uid' => $u_id,
                'price_list' => $price_list,
                'goods_list' => $goods_list,
                'k_juan' => $k_juan,
                'total_juan' => $total_juan,
                'juan_flag' => $not_used_conpon > 0 ? true : false
            ));

           $this->display('addActive');
        }
    }

    //绑定手机
    public function bindMobile()
    {
        if(IS_POST){
            $code = I('post.code');
            $mobile = I('post.mobile');
            $name = I('post.name');
            $s_code = M('user_code')->where(array('phone' => $mobile))->find();
            if($code == $s_code['code']){
                $input = array(
                    'mobile' => $mobile,
                    'truename' => $name
                );
                M('users')->where(array('p_openid' => session('u_openid')))->save($input);
                $this->ajaxReturn(array(
                    'code' => 1,
                    'msg' => '验证码正确!',
                    'data' => array(
                        'shop_id' => (int)cookie('shop_id'),
                        'goods_id' => (int)cookie('goods_id'),
                    )
                ));
            }else{
                $this->ajaxReturn(array(
                    'code' => 0,
                    'msg' => '验证码不正确!'
                ));
            }
        }else{
            $this->display('bindMobile');
        }
    }

    /**
     *   支付页面
     */
    public function pay()
    {
        include_once "Baocms/Lib/Payment/weixin.h5.class.php";
        $wx = new weixinH5();
        $order_id = I('get.order_id');
        //$order_info = M('order')->where(array('order_id'=>$order_id))->find();
        $order_info = M('order_parent')->where(array('parent_order_id'=>$order_id))->find();
        $order_info['order_id_s'] = 'BL'.$order_id;  //个位数商品id微信不支持
        $order_info['order_intro'] = '贝拉小镇活动支付';
        $order_info['subject'] = '贝拉小镇';
        $order_info['total_price'] = 0.01;
        $openid = session('u_openid');
        //var_dump($openid);
        //var_dump($order_info);die();
        $btn = $wx->prePay($openid, $order_info);
        $this->assign('total_price',$order_info['total_price']);
        $this->assign('button', $btn);

        $this->display();
    }

    /*
     * 支付成功页面
     * */
     public function payOk()
     {
        $order_id = I('get.order_id');
        $info = M('order')->alias('o')
            ->field('o.order_id,o.status,o.total_price,og.num,g.title')
            ->join('bao_order_goods as og on o.order_id=og.order_id')
            ->join('bao_goods as g on og.goods_id=g.goods_id')
            ->where(array(
                'o.order_id' => $order_id
            ))
            ->group('o.order_id')
            ->select();
        $staus_array = array(
            '0' => '未付款',
            '1' => '已付款待出票',
            '2' => '待使用',
            '3' => '已完成'
        ) ;
        $this->assign(array(
            'info' => $info,
            'ss' => $staus_array
        ));

         $this->display('payOk');
     }

    /*
     *  我的活动
     * */
    public function myActive()
    {
        $openid = session('u_openid');//'oGFRB05qZ0EaozNYAoDPm1luH64g';//
        if($openid){
            $myactive = M('order')->alias('o')
                ->field('g.title,g.intro,g.price,o.act_code,o.status,o.order_id,o.total_price,o.user_id,og.num,o.piao_uucode,o.piao_img,o.yw_time,o.act_code,o.act_img')
                ->join('bao_order_goods as og on o.order_id = og.order_id')
                ->join('bao_goods as g on g.goods_id = og.goods_id')
                ->where(array(
                    'o.user_id' => $this->u_id ,
                    'o.status' => array('in',array(1,2,3,10,15))
                ))
                ->order('o.order_id desc')
                //->group('o.order_id')
                ->select();
            if(empty($myactive)){
                $this->assign(array(
                    'user_id' => $this->u_id,
                ));
                $this->display('unMyActive');
                exit;
            }
            foreach ($myactive as $key => $val){
                $myactive[$key]['yw_time'] = date('Y-m-d',$val['yw_time']);
                $myactive[$key]['index'] = $key;
            }
            $staus_array = array(
                '0' => '未付款',
                '1' => '已付款待出票',
                '2' => '待使用',
                '3' => '已使用',
                '10' => '申请退款中',
                '15' => '退款完成',
            ) ;
            $this->assign(array(
                'myactive' => $myactive,
                'ss' => $staus_array
            ));
            $this->display('myActive');
        }else{
            $this->assign(array(
                'user_id' => $this->u_id,
            ));
            $this->display('unMyActive');
        }
    }

    //调取活动二维码
    public function getMyCode()
    {
        $order_id = I('post.order_id');
        /*
        import('ORG.util.phpqrcode');
        $value = 'http://'.$_SERVER['HTTP_HOST'].'/Jigou/Index/saoCode/order_id/'.$order_id; //二维码内容
        $errorCorrectionLevel = 'L';//容错级别
        $matrixPointSize = 5;//生成图片大小
        //生成二维码图片
        $path = './Public/qrcode';
        if(!is_dir($path)){
            mkdir($path,0777,1);
        }
        $file = $path.'/'.$order_id.'.png';
        if(!is_file($file)){
            QRcode::png($value, $file, $errorCorrectionLevel, $matrixPointSize, 2);
        }
        */
        $file = '';
        $order = M('order')->where(array('order_id' => $order_id))->find();
        $shop_info = M('shop')->where(array('shop_id'=>$order['shop_id']))->find();
        $ticket_type = (int)$shop_info['ticket_type'];
        if($ticket_type == 2){      //票付通验票
            $SERVER_NAME = $_SERVER['SERVER_NAME'];
            $this->ajaxReturn(array(
                'code' => 1,
                'img' => 'http://' . $SERVER_NAME .'/'.$order['act_img'],
                'act_code'=>$order['act_code'],
            ));
        }else{    //平台验票
            $QrcodeWater = D('QrcodeWater','Service');
            $imageinfo = $QrcodeWater->downloadimagefromweixin($order['act_img']);
            if(!empty($imageinfo['body'])){
                $body_res = explode("'", $imageinfo['body']);
                $file = $body_res[1];
            }
            file_put_contents('./data/Runtime/Data/order_qrcode_url_data.json', $file);
            $this->ajaxReturn(array(
                'code' => 1,
                'img' => $file,
                'act_code'=>$order['act_code'],
            ));
        }
    }

    /*
     *  我的优惠券
     * */
    public function myCommission()
    {
        $act_uid = session('u_id');
        $openid = session('u_openid');
        //file_put_contents('./data/Runtime/Data/myCommission_openid_data.json', $openid);
        //获取用户信息
        $users = M('users')->where(array('p_openid'=>$openid))->find();
        //获取邀请好友子级列表
        $usersList = M('users')->where(array('pid'=>$users['user_id'],'is_subscribe'=>1))->order('reg_time desc')->select();
        if(!empty($usersList)){
            foreach ($usersList as $key => $val){
                $usersList[$key]['nickname'] = $val['nickname'];
                $usersList[$key]['face'] = $val['face'] == '' ? '__PUBLIC__/H5/image/icon_success60x60@3x.png' : $val['face'];
                $usersList[$key]['reg_time'] = date('Y-m-d H:i:s',$val['reg_time']);
            }
        }
        //用户优惠券
        $yjuan = M('yjuan')->where(array('user_id' => $users['user_id']))->find();
        $userInfo['nickname'] = $users['nickname'];
        $userInfo['face'] = $users['face'] == '' ? '__PUBLIC__/H5/image/qq96x96.png' : $users['face'];
        $userInfo['couponTotal'] = (int)$yjuan['nums'];
        $userInfo['friendTotal'] = count($usersList);
        //cookie('alert_message_id', 0, time() + 99 * 365 * 24 * 3600);
        $userInfo['alert_message_id'] = (int)cookie('alert_message_id');
        //echo $userInfo['alert_message_id'];

        $this->assign('userInfo', $userInfo);
        $this->assign('usersList', $usersList);
        //$this->display('myCommission');
        //跳转新我的优惠券页面
        redirect('/frontend/index.html#/mineTicket?user_id=' . $users['user_id']);
    }

    /*
     *  返佣金说明
     * */
    public function conmmissionInfo()
    {

        $this->display('conmmissionInfo');
    }

    /*
     *  我的活动
     * */
    public function refund()
    {
        $this->display('refund');
    }
    public function submit()
    {
        $this->display('submit');
    }

    /*
     * func 微信申请退款(未测试)
     * time 2017.11.23
     */
    public function wxRefund(){
        include_once "Baocms/Lib/Payment/weixin.h5.class.php";
        $wx = new weixinH5();
        $order_id = I('post.order_id');
        $order = M('order')->alias('b')
            ->field('bo.total_price,b.parent_order_id,p.notify_transaction')
            ->join('practice_weixin_unifiedorders as p on p.wx_product_id = b.parent_order_id')
            ->join('bao_order_parent as bo on bo.parent_order_id = b.parent_order_id')
            ->where(array('b.order_id' => $order_id,'p.notify_return_code'=>'SUCCESS'))
            ->find();
        $merchid = MCHID;
        if(!$order) return false;

        $input = new WxPayRefund();//WxPay.Data.php提交退款输入对象
        $input->SetOut_trade_no($order['parent_order_id']);//自己的订单号
        $input->SetTransaction_id($order['notify_transaction']);//微信官方生成的订单流水号，在支付成功中有返回
        $input->SetOut_refund_no($order['parent_order_id']);//退款单号
        $input->SetTotal_fee($order['total_price']);//订单标价金额，单位为分
        $input->SetRefund_fee($order['total_price']);//退款总金额，订单总金额，单位为分，只能为整数
        $input->SetOp_user_id($merchid);//设置操作员帐号, 默认为商户号
        $result = WxPayApi::refund($input); //退款操作
        // 这句file_put_contents是用来查看服务器返回的退款结果 测试完可以删除了
        //file_put_contents(APP_ROOT.'/Api/wxpay/logs/log3.txt',arrayToXml($result),FILE_APPEND);
        return json_encode($result);
    }




}