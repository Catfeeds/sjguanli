<?php


class IndexAction extends CommonAction {

    /*
     * 机构首页入口（微信授权）
     * */
    public function index() {
        //$js_config = R('Jigou/Auth/getJsConfig');

        //setcookie('src_user_id', $wx_userinfo['user_id'], time() + 86400, '/');
        redirect('/merchant/');

        //$this->assign('js_config', $js_config);
        //$this->display('identity');
    }

    /*
     * 身份验证
     * */
    public function identity() {
        if(IS_AJAX){
            $account = I('post.tel');
            $password = I('post.password');
            $users_info = M('users')->where(array('account'=>$account))->find();
            if(empty($users_info)){
                $this->ajaxReturn(array('code' => 0, 'msg' => '当前用户不存在,请重新输入'));
            }
            if(md5($password) != $users_info['password']){
                $this->ajaxReturn(array('code' => 0, 'msg' => '密码错误,请重新输入'));
            }
            $shop_worker = M('shop_worker')->where(array('user_id'=>$users_info['user_id']))->find();
            if(empty($shop_worker)){
                $this->ajaxReturn(array('code' => 0, 'msg' => '你未绑定任何商家,请联系管理员'));
            }
            $data['users'] = $shop_worker;
            $this->ajaxReturn(array('code' => 1, 'msg' => '登录成功', 'data' => $data));
        }else{
            $this->display();
        }
    }

    /*
     * 订单列表
     * */
    public function orderlist($user_id,$shop_id) {
        $users = M('users')->where(array('user_id'=>$user_id))->find();
        if(empty($users)){
            die("用户信息不存在!");
        }
        $orderTotal_map['shop_id'] = $shop_id;
        $shop = M('shop')->where(array('shop_id'=>$shop_id))->find();
        if(empty($shop)){
            die("商家信息不存在!");
        }
        $orderTotal_map['status'] = array('not in','0,2');
        $orderTotalPrice = M('order')->where($orderTotal_map)->sum('total_price');          //余额
        if(empty($orderTotalPrice)) $orderTotalPrice = 0.00;
        $orderTotal = M('order')->where($orderTotal_map)->count();          //总订单数
        $orderNotUsed = M('order')->where(array('shop_id'=>$shop_id ,'status'=>1))->count();        //未使用
        $orderAlreadyUse = M('order')->where(array('shop_id'=>$shop_id ,'status'=>3))->count();     //已使用
        //订单列表
        $order_map['status']  = array('not in','0,2');
        $order_map['shop_id']  = $shop_id;
        $orderList = M('order')->where($order_map)->order('status desc')->select();
        if(!empty($orderList)){
            foreach ($orderList as $key => $val){
                $order_goods = M('order_goods')->where(array('order_id'=>$val['order_id']))->find();
                $goods = M('goods')->where(array('goods_id'=>$order_goods['goods_id']))->find();
                $orderList[$key]['title'] = $goods['title'];
                $users = M('users')->where(array('user_id'=>$val['user_id']))->find();
                $orderList[$key]['nickname'] = $users['nickname'];
                $orderList[$key]['face'] = $users['face'];
            }
        }
        $shopInfo['shop_name'] = $shop['shop_name'];
        $shopInfo['orderTotalPrice'] = $orderTotalPrice;
        $shopInfo['orderTotal'] = $orderTotal;
        $shopInfo['orderNotUsed'] = $orderNotUsed;
        $shopInfo['orderAlreadyUse'] = $orderAlreadyUse;

        $this->assign('shopInfo', $shopInfo);
        $this->assign('orderList', $orderList);
        $this->display();
    }

    /*
     * 验证券码
     * */
    public function identifynum() {
        if(IS_AJAX){
            $act_code = I('post.act_code');
            $order = M('order')->where(array('act_code'=>$act_code))->find();
            if(empty($order)){
                $this->ajaxReturn(array('code' => 0, 'msg' => '输入的券码不存在,请重新输入'));
            }
            if($order['status'] == 1){
                $handleRow = D('Order')->save(array('order_id'=>$order['order_id'],'status'=>3));
                if(!$handleRow) {
                    $this->ajaxReturn(array('code' => 0, 'msg' => '订单处理失败,请稍后重试'));
                }
                $this->ajaxReturn(array('code' => 1, 'msg' => '券码验证成功', 'data' => $order));
            }else{
                if($order['status'] == 0){
                    $this->ajaxReturn(array('code' => 0, 'msg' => '该券码未付款,请付款后验证'));
                }elseif($order['status'] == 3){
                    $this->ajaxReturn(array('code' => 0, 'msg' => '该券码已验证,请勿重复操作'));
                }else{
                    $this->ajaxReturn(array('code' => 0, 'msg' => '该券码无效'));
                }
            }
        }else{
            $js_config = R('Jigou/Auth/getJsConfig');
            //获取微信扫一扫配置参数
            $weixinInfo['appId'] = $js_config['appId'];
            $weixinInfo['timestamp'] = $js_config['timestamp'];
            $weixinInfo['nonceStr'] = $js_config['nonceStr'];
            $weixinInfo['signature'] = $js_config['signature'];
            $this->assign('weixinInfo', $weixinInfo);
            $this->display();
        }
    }

    /*
     * 扫码验证订单信息自动核销
     * */
    public function saocode($order_id) {
        if(empty($order_id)){

        }
        $this->display();
    }

    /*
     * 验证券码成功
     * */
    public function verifysucc() {

        $this->display();
    }

    /*
     * 验证券码失败
     * */
    public function verifyfail() {

        $this->display();
    }

    /*
     * 网易云短信验证码
     * */
    function netsms(){
        $NetEaseSms = D('NetEaseSms','Service');
        $result = $NetEaseSms->sendSmsCode('3111127','13590288934','','4');
        var_dump($result);die();
    }

}
