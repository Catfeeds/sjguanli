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
            $proxy_worker = M('proxy_worker')->where(array('work_mobile' => $account))->find();
            if (empty($proxy_worker)) {
                $this->baoError('当前用户不存在！',2000,true);
            }
            if ($proxy_worker['work_status'] == 1) {
                $this->baoError('用户不存在或被删除！',2000,true);
            }
            if ($proxy_worker['work_password'] != md5($password)) {
                $this->baoError('账号或密码不正确！',2000,true);
            }
            $this->proxy = D('Proxy')->find(array("where" => array('proxy_id' => $proxy_worker['proxy_id'], 'status' => 0)));
            if (empty($this->proxy)) {
                $this->baoError('该用户没有开通代理商权限！',2000,true);
            }
            setProxyUid($proxy_worker['proxy_work_id']);
            session('proxy_id',$proxy_worker['proxy_id']);
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