<?php

 
class SmsAction extends CommonAction {

    /*
     * 发送短信验证码
     * */
    public function sendSmsCode(){
        $phone = I('get.phone');
        if(empty($phone)){
            $this->ajaxReturn(array('code' => 0, 'msg' => '手机号码不能为空'));
        }
        $random = rand(1, 10);  //根据随机数优先发送阿里云短信通道（因阿里云短信套餐有效期为2018-08-31，网易短信通道有效期为2019-10-08）
        if($random > 3){       //阿里云短信通道
            $code = rand(100000,999999);
            $signName = '学生综合实践平台';
            $templateCode = 'SMS_100000024';
            $AliyunSms = D('AliyunSms','Service');
            $result = $AliyunSms->sendSms(
                $signName,                                        // 短信签名
                $templateCode,                                    // 短信模板编号
                $phone,                                           // 短信接收者
                array("code"=>$code)                            // 短信模板中字段的值
            );
            if(!empty($result) && $result->Code == 'OK'){     //成功
                $user_code = M('user_code')->where(array('phone'=>$phone))->find();
                if(!empty($user_code)) {
                    M('user_code')->where(array('phone'=>$phone))->save(array('code'=>$code,'validity'=>5 * 60));
                }else {
                    $input = [
                        'phone' => $phone,
                        'code' => $code,
                        'validity' => 5 * 60,
                    ];
                    M('user_code')->add($input);
                }
                $this->ajaxReturn(array('code' => 1, 'msg' => '验证码发送成功!'));
            }else{          //失败
                $this->ajaxReturn(array('code' => 0, 'msg' => '获取验证码失败：' . $result->Message));
            }
        }else{         //网易云短信通道
            $NetEaseSms = D('NetEaseSms','Service');
            $result = $NetEaseSms->sendSmsCode('3111127',$phone);//模板ID，手机号
            if(!empty($result) && $result['code'] == 200){     //成功
                $user_code = M('user_code')->where(array('phone'=>$phone))->find();
                if(!empty($user_code)) {
                    M('user_code')->where(array('phone'=>$phone))->save(array('code'=>$result['obj'],'validity'=>5 * 60));
                }else {
                    $input = [
                        'phone' => $phone,
                        'code' => $result['obj'],
                        'validity' => 5 * 60,
                    ];
                    M('user_code')->add($input);
                }
                $this->ajaxReturn(array('code' => 1, 'msg' => '验证码发送成功!'));
            }else{          //失败
                $this->ajaxReturn(array('code' => 0, 'msg' => '获取验证码失败：' . $result['msg']));
            }
        }
    }

    /*
     * 发送用户订单信息
     * */
    public function sendSmsTemplate(){
        $NetEaseSms = D('NetEaseSms','Service');
        $title = "贝拉小镇";
        $code = rand(1000,9999);
        $phone_res = array('13590288934','15973176773');
        $result = $NetEaseSms->sendSMSTemplate('3115050',$phone_res,[$title, $code]);//模板ID，array('手机号')，["活动名称","活动券码"]
        //var_dump($result);
        if($result['code'] == 200){     //成功
            $this->ajaxReturn(array('code' => 1, 'msg' => '订单信息发送成功'));
        }else{          //失败
            $this->ajaxReturn(array('code' => 0, 'msg' => '订单信息发送失败'));
        }
    }

    /*
     * 统计用户优惠券
     * */
    public function userCouponTotal(){
        dump('userCouponTotal redis queue start');
        $redis = new Redis();
        $redis->connect('127.0.0.1', 6379);
        $rpush_key = 'send-sms-user-list';

        $users_info = M('users')->where('mobile','<>','')->select();
        dump('users_info');
        dump(count($users_info));
        foreach ($users_info as $key => $val){
            $user_coupons_info = M('user_coupons')->where(array('user_id'=>(int)$val['user_id'],'status'=>0))->select();
            if(!empty($user_coupons_info)){
                $coupons_num = count($user_coupons_info);
                if(!empty($val['mobile']) && $coupons_num > 0) {
                    dump('users_id');
                    dump((int)$val['user_id']);
                    $redis->rPush($rpush_key, $val['user_id']);
                    dump('coupons_num');
                    dump($coupons_num);
                }
            }
        }
        dump('userCouponTotal redis queue end');
    }

    /*
     * 发送优惠券过期短信
     * */
    public function sendCouponSms(){
        dump('sendCouponSms redis queue start');
        $redis = new Redis();
        $redis->connect('127.0.0.1', 6379);
        $rpush_key = 'send-sms-user-list';
        $user_list = $redis->lRange($rpush_key, 0 ,0);
        dump('user_list');
        dump($user_list);
        if(!empty($user_list)){
            foreach ($user_list as $key => $user_id) {
                $users_info = M('users')->where(array('user_id'=>$user_id))->find();
                dump('users_info');
                dump($users_info);
                $money = 0;
                $user_coupons_info = M('user_coupons')->where(array('user_id'=>$user_id,'status'=>0))->select();
                if(!empty($user_coupons_info)){
                    foreach ($user_coupons_info as $key2 => $val2){
                        $money += (int)$val2['amount'];
                    }
                }
                $coupons_num = count($user_coupons_info);
                if(!empty($users_info) && !empty($users_info['mobile']) && $coupons_num > 0 && $money > 0){
                    $signName = '学生综合实践平台';
                    $templateCode = 'SMS_117521641';
                    $phone = $users_info['mobile'];
                    $AliyunSms = D('AliyunSms','Service');
                    $result = $AliyunSms->sendSms(
                        $signName,                                        // 短信签名
                        $templateCode,                                    // 短信模板编号
                        $phone,                                           // 短信接收者
                        array("num"=>$coupons_num,"money"=>$money)                            // 短信模板中字段的值
                    );
                    if(!empty($result) && $result->Code == 'OK'){     //成功
                        dump('验证码发送成功!');
                    }else{          //失败
                        dump('获取验证码失败');
                        dump($result->Message);
                    }
                    $result = $redis->lPop($rpush_key);
                    dump('send-sms-user-list');
                    dump($result);
                }
            }
        }
        dump('sendCouponSms redis queue end');
    }



}
