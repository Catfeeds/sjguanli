<?php



class UserstestAction extends CommonAction {

    private $create_fields = array('account', 'password','rank_id', 'nickname','face','ext0');
    private $edit_fields = array('account', 'password','rank_id', 'nickname','face','ext0');

    /*
     * 用户搜索
     * */
    public function index() {
        $Userstest = D('Userstest');
        import('ORG.Util.Page'); // 导入分页类
        $count = $Userstest->count(); // 查询满足要求的总记录数
        $Page = new Page($count, 25); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Userstest->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输
        $this->display(); // 输出模板
    }

    public function create(){
        $data = $this->_post('data');
        if($_POST){
            if(empty(trim($data['truename']))) $this->baoError('请填写真实姓名');
//            if(empty(trim($data['shop_id']))) $this->baoError('请选择商家');
            $data['shop_id'] = 145;//实践平台
            if(empty(trim($data['user_id']))) $this->baoError('请选择指定用户');
            $testinfo = D("Userstest")->where(array('user_id'=>$data['user_id']))->field('test_id')->find();
            if($testinfo['test_id']) $this->baoError('用户不允许重复添加');
            $data['created_at'] = date('Y-m-d H:i:s',time());
            $result = D('Userstest')->add($data);
            if($result){
                $this->baoSuccess('操作成功',U('userstest/index'));
            }else{
                $this->baoError('添加失败');
            }
        }else{
            $this->display();
        }
    }

    public function delete(){
        $type = I('post.type',0);
        $ids = I('post.ids');
        $arrs = array();
        if($type == 1){
            $arr = explode(',',$ids);
            foreach($arr as $key =>$value){
                if($value) $arrs[] = $value;
            }
            $where['test_id'] = array('in',$arrs);
        }else{
            $where['test_id'] = $ids;
        }
        $result = D('Userstest')->where($where)->delete();
        if($result !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }
}
