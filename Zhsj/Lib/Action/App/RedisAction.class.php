<?php


class RedisAction extends CommonAction{

    /*
     * 获取订单缓存队列推送订单至票付通
     * */
    public function lists()
    {
        $redis = new Redis();
        $redis->connect('127.0.0.1', 6379);
        //$redis->rpush("order-list", "Redis".time()."111".time());
        //$SERVER_NAME = 'www.shijian666.com';
        $SERVER_NAME = $_SERVER['SERVER_NAME'];
        $host_array = array('dev.shijian666.com'=>'dev','test.shijian666.com'=>'test','www.shijian666.com'=>'prod');
        $redis_key = $host_array[$SERVER_NAME];
        $key_index = 'error';
        if(!empty($redis_key)){
            $key_index = $redis_key;
        }
        $rpush_key = 'order-list-' . $key_index;
        $order_list = $redis->lRange($rpush_key, 0 ,0);
        dump('redis queue start');
        dump($order_list);
        if(!empty($order_list)){
            foreach ($order_list as $key => $order_id) {
                $order_info = M('order')->where(array('order_id'=>$order_id))->find();
                dump('order_info');
                dump($order_info);
                if(!empty($order_info)){
                    $order_goods = M('order_goods')->where(array('order_id'=>$order_info['order_id']))->find();
                    dump('order_goods');
                    dump($order_goods);
                    $user_info = M('users')->where(array('user_id'=>$order_info['user_id']))->find();
                    dump('user_info');
                    dump($user_info);
                    $goods_info = M('goods')->where(array('goods_id'=>$order_goods['goods_id']))->find();
                    dump('goods_info');
                    dump($goods_info);
                    //调取票务通系统
                    $arr = array(
                        'scenicspot_id' => $goods_info['scenicspot_id'],   //测试：2633,//生产：61110, //景区id
                        'ticket_id' => $goods_info['ticket_id'],            //测试：25715,//生产：140027,//门票id
                        'supplier_id' => $goods_info['supplier_id'],        //测试：113,//生产：223158,//供应商id
                        'order_id' => $order_id,            //订单号
                        'start_time' => date('Y-m-d',$order_info['yw_time']), //游玩时间
                        'user' => $user_info['truename'],  //客服名字
                        'mobile' => $user_info['mobile'],  //客户手机
                        'lx_mobile' => '', //联系人手机
                        'price' => $order_goods['total_price '], //门票价格
                        'nums' => $order_goods['num'], //数量
                        'id_card' => '',  //身份证号码
                    );
                    dump('arr');
                    dump($arr);
                    $PiaoFuTong = D('PiaoFuTong', 'Service'); //$User = D('User','Ser
                    $result = $PiaoFuTong->PFT_Order_Submit($arr);
                    dump('PFT_Order_Submit');
                    dump($result);
                    $error = $result['Rec'][0]['UUerrorcode'];
                    dump('error');
                    dump($error);
                    //接受二维码图片和链接
                    $piao_url = $result['Rec'][0]['UUqrcodeURL'][0]['#text'];
                    $piao_img = $result['Rec'][0]['UUqrcodeIMG'][0]['#text'];
                    $piao_uucode = $result['Rec'][0]['UUcode'][0]['#text'];
                    $piao_ordernum = $result['Rec'][0]['UUordernum'][0]['#text'];
                    if((!empty($piao_url) && !empty($piao_img)) || !empty($piao_uucode) || !empty($piao_ordernum)) {
                        //根据票付通二维码URL获取二维码保存至本地
                        $tmp_piao_img = '';
                        $QrcodeWater = D('QrcodeWater','Service');
                        $imageinfo = $QrcodeWater->downloadimagefromweixin($piao_img);
                        if(!empty($imageinfo['body'])){
                            $body_res = explode("'", $imageinfo['body']);
                            $tmp_piao_img = $body_res[1];
                        }
                        //$order_res = M('order')->where(array('order_id' => $order_id))->save(array('piao_url' => $piao_url, 'piao_img' => $piao_img, 'piao_uucode' => $piao_uucode, 'piao_ordernum' => $piao_ordernum, 'act_code' => $piao_uucode, 'act_img' => $tmp_piao_img,));
                        //保存订单券码信息
                        $input = array(
                            'order_id' => $order_id,
                            'status' => 0,
                            'act_code' => $piao_uucode,
                            'act_img' => $tmp_piao_img,
                            'piao_url' => $piao_url,
                            'piao_img' => $piao_img,
                            'piao_uucode' => $piao_uucode,
                            'piao_status' => 0,
                            'piao_ordernum' => $piao_ordernum,
                            'updated_at' => date('Y-m-d H:i:s',time()),
                            'created_at' => date('Y-m-d H:i:s',time()),
                        );
                        M('order_coupon_codes')->add($input);
                        dump('order_coupon_codes');
                        //dump($order_res);
                        $status = (int)$order_info['status'];
                        if($status < 10){
                            M('order')->where(array('order_id' => $order_id))->save(array('status' => 2));
                            //M('order_parent')->where(array('parent_order_id'=>$order_parent['parent_order_id']))->save(array('status'=>2));
                        }
                        $result = $redis->lPop($rpush_key);
                        dump('pop-order-list');
                        dump($result);
                    }else{
                        $redis->rPush("error-order-list-" . $key_index, $order_id);
                    }
                }
            }
        }
        dump('redis queue end');
    }

    /*
     * 获取票付通凭证码、二维码信息
     * */
    public function orderquery()
    {
        $redis = new Redis();
        $redis->connect('127.0.0.1', 6379);
        //$redis->rpush("error-order-list", "83950605");
        $SERVER_NAME = $_SERVER['SERVER_NAME'];
        $host_array = array('dev.shijian666.com'=>'dev','test.shijian666.com'=>'test','www.shijian666.com'=>'prod');
        $redis_key = $host_array[$SERVER_NAME];
        $key_index = 'error';
        if(!empty($redis_key)){
            $key_index = $redis_key;
        }
        $order_list = $redis->lRange("error-order-list-" . $key_index, 0 ,0);
        dump('get order queue start');
        dump($order_list);
        if(!empty($order_list)){
            foreach ($order_list as $key => $order_id) {
                $order_info = M('order')->where(array('order_id'=>$order_id))->find();
                dump('order_info');
                dump($order_info);
                if(!empty($order_info)){
                    //调取票务通系统
                    $arr = array(
                        'order_id' => 'J8C3J9Y5X0S5ZHSJPT'.$order_id,  //订单号
                    );
                    dump('arr');
                    dump($arr);
                    $PiaoFuTong = D('PiaoFuTong', 'Service'); //$User = D('User','Ser
                    $result = $PiaoFuTong->OrderQuery($arr);
                    dump('OrderQuery');
                    dump($result);
                    $error = $result['Rec'][0]['UUerrorcode'];
                    dump('error');
                    dump($error);
                    //接受二维码图片和链接
                    //$piao_url = $result['Rec'][0]['UUqrcodeURL'][0]['#text'];
                    //$piao_img = $result['Rec'][0]['UUqrcodeIMG'][0]['#text'];
                    $piao_uucode = $result['Rec'][0]['UUcode'][0]['#text'];
                    var_dump($piao_uucode);
                    if(!empty($piao_uucode)) {
                        $order_res = M('order')->where(array('order_id' => $order_id))->save(array('piao_uucode' => $piao_uucode,));
                        dump('order_res');
                        dump($order_res);
                        if ($order_res) {
                            //$parent_res = M('order_parent')->where(array('parent_order_id' => $order_info['parent_order_id']))->save(array('status' => 2));
                            $result = $redis->lPop("error-order-list-" . $key_index);
                            dump('pop-error-order-list');
                            dump($result);
                        }
                    }
                }
            }
        }
        dump('get order queue end');
    }

    /*
     * 同步取消票付通订单
     * */
    public function cancelorder()
    {
        $order_list = M('order')->where(array('piao_status'=>1))->where('piao_ordernum','<>',NULL)->select();
        dump('get cancel order data start');
        dump($order_list);
        if(!empty($order_list)) {
            foreach ($order_list as $key => $order){
                $order_id = $order['order_id'];
                //调取票务通系统
                dump('order_info');
                dump($order);
                $arr = array(
                    'ordern' => $order['piao_ordernum'],  //票付通订单号
                    'num' => 0,  //0 为取消订单 -1 不做修改，指要修改订单取票人手机
                );
                dump('arr');
                dump($arr);
                $PiaoFuTong = D('PiaoFuTong', 'Service'); //$User = D('User','Ser
                $result = $PiaoFuTong->Order_Change_Pro($arr);
                dump('Order_Change_Pro');
                dump($result);
                $UUdone = $result['Rec'][0]['UUdone'][0]['#text'];
                $UUrefund_fee = $result['Rec'][0]['UUrefund_fee'][0]['#text'];
                $UUrefund_amount = $result['Rec'][0]['UUrefund_amount'][0]['#text'];
                dump('UUdone');
                dump($UUdone);
                if (!empty($UUdone) && $UUdone == '100') {
                    $order_res = M('order')->where(array('order_id'=>$order_id))->save(array('piao_status'=>2));
                    dump('order_res');
                    dump($order_res);
                }
                sleep(1);
            }
        }
        dump('get cancel order data end');
    }

    /*
     * 拆分用户优惠券
     * */
    public function splitcoupon()
    {
        var_dump(time());die();
        $yjuan_list = M('yjuan')->where(array('status'=>0))->order('j_id asc')->select();
        dump('get split coupon data start');
        //dump($yjuan_list);
        if(!empty($yjuan_list)) {
            foreach ($yjuan_list as $key => $val){
                $j_id = (int)$val['j_id'];
                $user_id = (int)$val['user_id'];
                $nums = (int)$val['nums'];
                $use_nums = (int)$val['use_num'];
                $numtotal = ($nums - $use_nums);
                if($numtotal > 0){
                    $tmp_num = ($numtotal / 2);
                    $floor_num = floor($tmp_num);
                    //var_dump($floor_num);die();
                    //dump('user_id');
                    //dump($user_id);
                    $is_int = is_int($tmp_num);
                    for($ii = 0;$ii < $floor_num; $ii++){
                        var_dump('20');
                        $input = array(
                            'user_id' => $user_id,
                            'coupon_name' => '优惠券',
                            'amount' => 20,
                            'start_date' => '2017-10-01',
                            'end_date' => '2017-12-31',
                            'status' => 0,
                            'create_time' => time(),
                            'update_time' => time(),
                        );
                        M('user_coupons')->add($input);
                    }
                    if(!$is_int){
                        var_dump('10');
                        $input = array(
                            'user_id' => $user_id,
                            'coupon_name' => '优惠券',
                            'amount' => 10,
                            'start_date' => '2017-10-01',
                            'end_date' => '2017-12-31',
                            'status' => 0,
                            'create_time' => time(),
                            'update_time' => time(),
                        );
                        M('user_coupons')->add($input);
                    }
                    M('yjuan')->where(array('j_id'=>$j_id))->save(array('status'=>1));
                    //die();
                }
            }
        }
        dump('get split coupon data end');
    }




}

