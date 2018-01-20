<?php
class WorkerAction extends CommonAction {

	private $edit_fields = array('user_id', 'name', 'tel', 'mobile', 'qq', 'weixin', 'work', 'addr', 'tuan', 'coupon', 'yuyue');

    /*
     * 代理商员工列表
     * */
    public function index() {
        $Proxyworker = D('Proxyworker');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('proxy_id' => $this->proxy_id);
        if ($keyword = $this->_param('keyword', 'htmlspecialchars')) {
            $map['name'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }
        $map['is_delete'] = 0;
        $map['work_status'] = 0;
        $count = $Proxyworker->where($map)->count(); // 查询满足要求的总记录数
        $Page = new Page($count, $this->listRows); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Proxyworker->where($map)->order(array('proxy_work_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
		$this->display();

    }

    /*
     * 创建员工
     * */
    public function create(){
        if ($this->isPost()) {
            $truename = I('post.truename');
            $mobile = I('post.mobile');
            $password = I('post.password');
            if(empty($truename)){
                $this->baoError('真实姓名不能为空！');
            }
            if(empty($mobile)){
                $this->baoError('手机号码不能为空！');
            }
            if(empty($password) || strlen($password) < 6){
                $this->baoError('密码不能为空且长度不能少于6位！');
            }
            //var_dump($truename);die();
            $user = D('Proxyworker')->where(array('work_mobile'=>$mobile))->find();
            if(!empty($user)){
                $this->baoError('此手机号码已被使用！');
            }
            $worker_data = array(
                'proxy_id'=>$this->proxy_id,
                'work_name'=>$truename,
                'work_mobile'=>$mobile,
                'work_password'=>md5($password),
                'created_at'=>my_date_format(time())
            );
            $ret = D('Proxyworker')->add($worker_data);
            if($ret === false){
                $this->baoError('添加失败！');
            }
            $this->baoSuccess('添加成功！', U('worker/index'));
        } else {
            $this->display();
        }
    }

    /*
     * 编辑员工
     * */
    public function edit() {
        $proxy_work_id = $_REQUEST['proxy_work_id'];
        if (empty($proxy_work_id)){
            $this->baoError('请选择需要编辑的内容操作');
        }
        if ($this->isPost()) {
            $truename = I('post.truename');
            if(empty($truename)) $this->baoError('真实姓名不能为空!');
            $worker_data = array(
                'work_name'=>$truename,
                'updated_at'=>my_date_format(time())
            );
            $result = D('Proxyworker')->where(array('proxy_work_id'=>$proxy_work_id))->save($worker_data);
            if($result === false){
                $this->baoError('操作失败!');
            }
            $this->baoSuccess('操作成功！', U('worker/index'));
        } else {
            $proxy_work_id = (int) $proxy_work_id;
            $obj = D('Proxyworker');
            $detail = $obj->find($proxy_work_id);
            if (empty($detail) || $detail['proxy_id'] != $this->proxy_id) {
                $this->error('请选择需要编辑的内容操作');
            }
            $this->assign('detail', $detail);
            $this->display();
        }
    }

    /*
     * 删除员工
     * */
	public function delete(){
        $proxy_work_id = (int)I('post.proxy_work_id');
        if (is_numeric($proxy_work_id) && $proxy_work_id <= 0) {
            $this->ajaxReturn(array('code'=>0,'msg'=>'请选择要删除的员工!'));
        }
        $obj = D('Proxyworker');
        $obj->save(array('proxy_work_id'=>$proxy_work_id,'work_status'=>1,'is_delete'=>1));
        $this->ajaxReturn(array('code'=>1,'msg'=>'员工信息删除成功！'));
	}


    private function editCheck() {
        $data = $this->checkFields($this->_post('data', false), $this->edit_fields);
        $data['shop_id'] = $this->shop_id;
        if (empty($data['user_id'])) {
            $this->baoError('用户编号不能为空');
        }
        if (empty($data['name'])) {
            $this->baoError('姓名不能为空');
        }
        if (empty($data['mobile'])) {
            $this->baoError('手机号码不能为空');
        }
        if (empty($data['work'])) {
            $this->baoError('员工职务不能为空');
        }
        if (empty($data['addr'])) {
            $this->baoError('联系地址不能为空');
        }
        return $data;
    }
	

}
