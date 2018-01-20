<?php



class  LoginAction extends CommonAction{
    
    public function index(){
        
        if($this->isPost()){
            $yzm = $this->_post('yzm');
            if(strtolower($yzm) != strtolower(session('verify'))){
                session('verify',null);
                $this->baoError('验证码不正确!',2000,true);
            }
            $account = $this->_post('work_mobile');
            if(empty($account)) {
                session('verify',null);
                $this->baoError('请输入用户名!',2000,true);
            }

            $password = $this->_post('work_password');
            if(empty($password)) {
                session('verify',null);
                $this->baoError('请输入登录密码!',2000,true);
            }
            //查询用户信息
            $shop_worker = M('shop_worker')->where(array('work_mobile' => $account))->find();
            if (empty($shop_worker)) {
                $this->baoError('账号或密码不正确',2000,true);
            }
            if ($shop_worker['work_status'] == 1) {
                $this->baoError('用户不存在或被删除！',2000,true);
            }
            if ($shop_worker['work_password'] != md5($password)) {
                $this->baoError('账号或密码不正确！',2000,true);
            }
            $this->shop = D('Shop')->find(array("where" => array('shop_id' => $shop_worker['shop_id'], 'status' => 2)));
            if (empty($this->shop)) {
                $this->baoError('该用户没有开通商家权限！',2000,true);
            }
            setShopUid($shop_worker['shop_work_id']);
            //var_dump($proxy_worker['proxy_id']);die();
            $this->baoSuccess('恭喜您登录成功！',U('index/index'));
        }else{
            $this->display();
        }
    }
    
    public function logout(){
        D('Passport')->logout();
        $this->success('退出登录成功！',U('login/index'));
    }
        
}