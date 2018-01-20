<?php



class UserAction extends CommonAction {

    private $create_fields = array('account', 'password','rank_id', 'nickname','face','ext0');
    private $edit_fields = array('account', 'password','rank_id', 'nickname','face','ext0');

    /*
     * 用户搜索
     * */
    public function index() {
        $User = D('Users');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('closed'=>array('IN','0,-1'));
        if($account = $this->_param('account','htmlspecialchars')){
            $map['account'] = array('LIKE','%'.$account.'%');
            $this->assign('account',$account);
        }
        if($mobile = $this->_param('mobile','htmlspecialchars')){
            $map['mobile'] = array('LIKE','%'.$mobile.'%');
            $this->assign('mobile',$mobile);
        }
        if($nickname = $this->_param('nickname','htmlspecialchars')){
            $map['nickname'] = array('LIKE','%'.$nickname.'%');
            $this->assign('nickname',$nickname);
        }
        if($rank_id = (int)$this->_param('rank_id')){
            $map['rank_id'] = $rank_id;
            $this->assign('rank_id',$rank_id);
        }
        $is_subscribe = $this->_param('is_subscribe');
        if($is_subscribe > -1){
            $map['is_subscribe'] = $is_subscribe;
            $this->assign('is_subscribe',$is_subscribe);
        }
        $is_bind_mobile = $this->_param('is_bind_mobile');
        if($is_bind_mobile == 1){
            $map['truename'] = '';
            $this->assign('is_bind_mobile',$is_bind_mobile);
        }elseif($is_bind_mobile == 2){
            $map['mobile'] = array('NOT IN','');
            $this->assign('is_bind_mobile',$is_bind_mobile);
        }

        if($ext0 = $this->_param('ext0','htmlspecialchars')){
            $map['ext0'] = array('LIKE','%'.$ext0.'%');
            $this->assign('ext0',$ext0);
        }

        $count = $User->where($map)->count(); // 查询满足要求的总记录数
        $Page = new Page($count, 25); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $User->where($map)->order(array('user_id'=>'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        foreach($list as $k=>$val){
            $val['reg_ip_area'] = $this->ipToArea($val['reg_ip']);
            $val['last_ip_area']   = $this->ipToArea($val['last_ip']);
            $list[$k] = $val;
        }
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('ranks',D('Userrank')->fetchAll());
        $this->display(); // 输出模板
    }
    
    public function select(){
        $User = D('Users');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('closed'=>array('IN','0,-1'));
        if($account = $this->_param('account','htmlspecialchars')){
            $map['account'] = array('LIKE','%'.$account.'%');
            $this->assign('account',$account);
        }
        if($nickname = $this->_param('nickname','htmlspecialchars')){
            $map['nickname'] = array('LIKE','%'.$nickname.'%');
            $this->assign('nickname',$nickname);
        }
        if($ext0 = $this->_param('ext0','htmlspecialchars')){
            $map['ext0'] = array('LIKE','%'.$ext0.'%');
            $this->assign('ext0',$ext0);
        }
        $count = $User->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 8); // 实例化分页类 传入总记录数和每页显示的记录数
        $pager = $Page->show(); // 分页显示输出
        $list = $User->where($map)->order(array('user_id'=>'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $pager); // 赋值分页输出
        $this->display(); // 输出模板
        
    }
	
	
    public function selectapp(){
        $User = D('Users');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('closed'=>array('IN','0,-1'));
        if($account = $this->_param('account','htmlspecialchars')){
            $map['account'] = array('LIKE','%'.$account.'%');
            $this->assign('account',$account);
        }
        if($nickname = $this->_param('nickname','htmlspecialchars')){
            $map['nickname'] = array('LIKE','%'.$nickname.'%');
            $this->assign('nickname',$nickname);
        }
        if($ext0 = $this->_param('ext0','htmlspecialchars')){
            $map['ext0'] = array('LIKE','%'.$ext0.'%');
            $this->assign('ext0',$ext0);
        }
		
		$join = ' inner join '.C('DB_PREFIX').'app_user a on a.user_id = '.C('DB_PREFIX').'users.user_id';
		
		
        $count = $User->where($map)->join($join)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 8); // 实例化分页类 传入总记录数和每页显示的记录数
        $pager = $Page->show(); // 分页显示输出
        $list = $User->where($map)->join($join)->order(array(C('DB_PREFIX').'users.user_id'=>'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
		
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $pager); // 赋值分页输出
        $this->display(); // 输出模板
        
    }
	

    public function create() {
        if ($this->isPost()) {
            $data = $this->createCheck();
            $obj = D('Users');
            if ($obj->add($data)) {
                $this->baoSuccess('添加成功', U('user/index'));
            }
            $this->baoError('操作失败！');
        } else {
            $this->assign('ranks',D('Userrank')->fetchAll());
            $this->display();
        }
    }

    private function createCheck() {
        $data = $this->checkFields($this->_post('data', false), $this->create_fields);
        $data['account'] = htmlspecialchars($data['account']);
        if (empty($data['account'])) {
            $this->baoError('账户不能为空');
        } 
        if(D('Users')->getUserByAccount($data['account'])){
            $this->baoError('该账户已经存在！');
        }
        $data['password'] = htmlspecialchars($data['password']);
        if (empty($data['password'])) {
            $this->baoError('密码不能为空');
        } 
        $data['password'] = md5($data['password']);
        $data['nickname'] = htmlspecialchars($data['nickname']);
        if (empty($data['nickname'])) {
            $this->baoError('昵称不能为空');
        }
        $data['rank_id'] = (int)$data['rank_id'];
        $data['face'] = htmlspecialchars($data['face']);
        $data['ext0'] = htmlspecialchars($data['ext0']);
        $data['reg_ip'] = get_client_ip();
        $data['reg_time'] = NOW_TIME;
        return $data;
    }

    public function edit($user_id = 0) {
        if ($user_id = (int) $user_id) {
            $obj = D('Users');
            if (!$detail = $obj->find($user_id)) {
                $this->baoError('请选择要编辑的会员');
            }
            if ($this->isPost()) {
                $data = $this->editCheck();
                $data['user_id'] = $user_id;
                if (false !==$obj->save($data)) {
                    $this->baoSuccess('操作成功', U('user/index'));
                }
                $this->baoError('操作失败');
            } else {
                $this->assign('detail', $detail);
                $this->assign('ranks',D('Userrank')->fetchAll());
                $this->display();
            }
        } else {
            $this->baoError('请选择要编辑的会员');
        }
    }

    private function editCheck() {
        $data = $this->checkFields($this->_post('data', false), $this->edit_fields);
        $data['account'] = htmlspecialchars($data['account']);
        if (empty($data['account'])) {
            $this->baoError('账户不能为空');
        } 
        if($data['password'] == '******'){
            unset($data['password']);
        }else{
            $data['password'] = htmlspecialchars($data['password']);
            if (empty($data['password'])) {
                $this->baoError('密码不能为空');
            } 
            $data['password'] = md5($data['password']);
        }
        $data['nickname'] = htmlspecialchars($data['nickname']);
        $data['face'] = htmlspecialchars($data['face']);
        $data['ext0'] = htmlspecialchars($data['ext0']);
        $data['rank_id'] = (int)$data['rank_id'];
        if (empty($data['nickname'])) {
            $this->baoError('昵称不能为空');
        }
        return $data;
    }

    public function delete($user_id = 0) {
        if (is_numeric($user_id) && ($user_id = (int) $user_id)) {
            $obj = D('Users');
            //$obj->save(array('user_id'=>$user_id,'closed'=>1));
            $obj->delete($user_id);
            $this->baoSuccess('删除成功！', U('user/index'));
        } else {
            $user_id = $this->_post('user_id', false);
            if (is_array($user_id)) {
                $obj = D('Users');
                foreach ($user_id as $id) {
                    //$obj->save(array('user_id'=>$id,'closed'=>1));
                    $obj->delete($id);
                }
                $this->baoSuccess('删除成功！', U('user/index'));
            }
            $this->baoError('请选择要删除的会员');
        }
    }
     public function audit($user_id = 0) {
        if (is_numeric($user_id) && ($user_id = (int) $user_id)) {
            $obj = D('Users');
            $obj->save(array('user_id'=>$user_id,'closed'=>0));
            $this->baoSuccess('审核成功！', U('user/index'));
        } else {
            $user_id = $this->_post('user_id', false);
            if (is_array($user_id)) {
                $obj = D('Users');
                foreach ($user_id as $id) {
                    $obj->save(array('user_id'=>$id,'closed'=>0));
                }
                $this->baoSuccess('审核成功！', U('user/index'));
            }
            $this->baoError('请选择要审核的会员');
        }
    }
    
    //积分操作
    public function integral(){
       $user_id = (int)$this->_get('user_id'); 
       if(empty($user_id)) $this->baoError ('请选择用户');
       if(!$detail = D('Users')->find($user_id)){
           $this->baoError('没有该用户！');
       }
       if($this->isPost()){
           $integral = (int)  $this->_post('integral');
           if($integral == 0){
               $this->baoError('请输入正确的积分数');
           }
           $intro =  $this->_post('intro',  'htmlspecialchars');
           if($detail['integral'] + $integral < 0){
               $this->baoError('积分余额不足！');
           }
           D('Users')->save(array(
               'user_id'=>$user_id,
               'integral'=> $detail['integral'] + $integral
           ));
           D('Userintegrallogs')->add(array(
               'user_id' => $user_id,
               'integral'=>$integral,
               'intro' => $intro,
               'create_time' => NOW_TIME,
               'create_ip'  => get_client_ip()
           ));
           $this->baoSuccess('操作成功',U('userintegrallogs/index'));
       }else{
           $this->assign('user_id',$user_id);
           $this->display();
       }       
    }
    
    public function gold(){
       $user_id = (int)$this->_get('user_id'); 
       if(empty($user_id)) $this->baoError ('请选择用户');
       if(!$detail = D('Users')->find($user_id)){
           $this->baoError('没有该用户！');
       }
       if($this->isPost()){
           $gold = (int)  $this->_post('gold');
           if($gold == 0){
               $this->baoError('请输入正确的金块数');
           }
           $intro =  $this->_post('intro',  'htmlspecialchars');
           if($detail['gold'] + $gold < 0){
               $this->baoError('金块余额不足！');
           }
           D('Users')->save(array(
               'user_id'=>$user_id,
               'gold'=> $detail['gold'] + $gold
           ));
           D('Usergoldlogs')->add(array(
               'user_id' => $user_id,
               'gold'=>$gold,
               'intro' => $intro,
               'create_time' => NOW_TIME,
               'create_ip'  => get_client_ip()
           ));
           $this->baoSuccess('操作成功',U('usergoldlogs/index'));
       }else{
           $this->assign('user_id',$user_id);
           $this->display();
       }       
    }
    
    public function manage(){
        $user_id = (int)$this->_get('user_id'); 
       if(empty($user_id)) $this->error ('请选择用户');
       if(!$detail = D('Users')->find($user_id)){
           $this->error('没有该用户！');
       }
       setUid($user_id);
       header("Location:".U('member/index/index'));
       die;
    }
    
    public function money(){
       $user_id = (int)$this->_get('user_id'); 
       if(empty($user_id)) $this->baoError ('请选择用户');
       if(!$detail = D('Users')->find($user_id)){
           $this->baoError('没有该用户！');
       }
       if($this->isPost()){
           $money = (int)  ($this->_post('money') * 100);
           if($money == 0){
               $this->baoError('请输入正确的余额数');
           }
           $intro =  $this->_post('intro',  'htmlspecialchars');
           if($detail['money'] + $money < 0){
               $this->baoError('余额不足！');
           }
           D('Users')->save(array(
               'user_id'=>$user_id,
               'money'=> $detail['money'] + $money
           ));
           D('Usermoneylogs')->add(array(
               'user_id' => $user_id,
               'money'=>$money,
               'intro' => $intro,
               'create_time' => NOW_TIME,
               'create_ip'  => get_client_ip()
           ));
           $this->baoSuccess('操作成功',U('usermoneylogs/index'));
       }else{
           $this->assign('user_id',$user_id);
           $this->display();
       }       
    }

    public function teacher(){
        $keyword = I('post.keyword','',trim);
        $where['status'] = 1;
        if($keyword){
            $where1=array(
                'teacher_name'=>$keyword,
                'teacher_mobile'=>$keyword,
                '_logic'=>'or'
            );
            $where=array(
                'status'=>1,
                '_complex'=>$where1,
                '_logic'=>'and'
            );
        }
        $join = ' left join '.C('DB_PREFIX').'schools b on b.school_id = '.'a.school_id';
        $info = D('Teacheraffiliate')->alias('a')->join($join)->where($where)->
        field('a.teacher_id,a.user_id,a.teacher_name,a.teacher_mobile,b.school_name')->order('a.teacher_id asc')->select();
        $this->assign('keyword',$keyword);
        $this->assign('info',$info);
        $this->display();
    }

    /*
     * 老师列表首页
     */
    public function teacherindex(){
        import('ORG.Util.Page'); // 导入分页类
        $where = array();
        $teacher_name = trim(I('post.teacher_name',''));
        $teacher_mobile = trim(I('post.teacher_mobile',''));
        if($teacher_name) $where['teacher_name'] = $teacher_name;
        if($teacher_mobile) $where['teacher_mobile'] = $teacher_mobile;
        $where['is_delete'] = 0;
        $count = D('Teacheraffiliate')->where($where)->count();
        $Page = new Page($count, 25); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $info = D('Teacheraffiliate')->where($where)->field('teacher_id,teacher_name,teacher_mobile,status,created_at')->limit($Page->firstRow . ',' . $Page->listRows)->select();

        $this->assign('page', $show); // 赋值分页输出
        $this->assign('info',$info);
        $this->assign('teacher_name',$teacher_name);
        $this->assign('teacher_mobile',$teacher_mobile);
        $this->display();
    }

    public function createteacher(){
        $data = $this->_post('data');
        if($_POST){
            if(empty(trim($data['teacher_name']))) $this->baoError('请填写老师的名字');
            if(empty(trim($data['teacher_mobile']))) $this->baoError('请填写手机号码');
            $teacher_id = D('Teacheraffiliate')->where(array('teacher_mobile'=>$data['teacher_mobile']))->field('teacher_id')->find();
            if($teacher_id) $this->baoError('手机号码已经被使用');
            if(empty(trim($data['city_id']))) $this->baoError('请选择城市');
            if(empty(trim($data['school_id']))) $this->baoError('请选择学校');
            if(empty(trim($data['class_id']))) $this->baoError('请选择班级');
            $data['status'] = 1;//创建老师默认权限正常
            $data['created_at'] = date('Y-m-d H:i:s',time());
            M()->startTrans();//开启事务
            $result = D('Teacheraffiliate')->add($data);
            if($result){
                $info = D('Users')->where(array('mobile'=>$data['teacher_mobile']))->field('user_id')->find();
                if($info){
                    $das['user_id'] = $info['user_id'];
                    $ret = M()->where(array('teacher_id'=>$result))->save($das);
                    if($ret === false){
                        M()->rollback();//失败回滚
                    }
                }
                M()->commit();//事务提交
                $this->baoSuccess('操作成功',U('user/teacherindex'));
            }else{
                $this->baoError('添加失败');
            }
        }else{
            $cityInfo = D('City')->where(array('is_open'=>1))->field('city_id,name')->select();
            $schoolInfo = D('Schools')->field('school_name,school_id')->select();
            $this->assign('cityInfo',$cityInfo);
            $this->assign('schoolInfo',$schoolInfo);
            $this->display();
        }
    }

    public function editteacher(){
        $teacher_id = I('get.teacher_id');
        $data = $this->_post('data');
        if($_POST){
            if(empty(trim($data['teacher_name']))) $this->baoError('请填写老师的名字');
            if(empty(trim($data['teacher_mobile']))) $this->baoError('请填写手机号码');
            if(empty(trim($data['city_id']))) $this->baoError('请选择城市');
            if(empty(trim($data['school_id']))) $this->baoError('请选择学校');
            if(empty(trim($data['class_id']))) $this->baoError('请选择班级');
            $data['status'] = 1;//创建老师默认权限正常
            $data['created_at'] = date('Y-m-d H:i:s',time());
            $where['teacher_id'] = $data['teacher_id'];
            $result = D('Teacheraffiliate')->where($where)->save($data);
            if($result){
                $this->baoSuccess('操作成功',U('user/teacherindex'));
            }else{
                $this->baoError('修改失败');
            }
        }else{
            $where['teacher_id'] = $teacher_id;
            $teacher_info = D('Teacheraffiliate')->where($where)->field('teacher_id,teacher_name,teacher_mobile,city_id,school_id,class_id')->select();
            $this->assign('detail',current($teacher_info));
            $cityInfo = D('City')->where(array('is_open'=>1))->field('city_id,name')->select();
            $schoolInfo = D('Schools')->field('school_name,school_id')->select();
            if($teacher_info[0]['class_id']){
                $data['class_id'] = $teacher_info[0]['class_id'];
                $classinfo= D('Classes')->where($data)->field('class_name')->find();
                $class_name = $classinfo['class_name'];
            }else{
                $class_name = '';
            }
            $this->assign('class_name',$class_name);
            $this->assign('cityInfo',$cityInfo);
            $this->assign('schoolInfo',$schoolInfo);
            $this->display();
        }
    }

    public function getClassInfo(){
        $id = I('post.id');
        if($id){
            $classInfo = D('Classes')->where(array('school_id'=>$id))->field('class_id,class_name')->select();
            $this->ajaxReturn(array('code'=>1,'classInfo'=>$classInfo));
        }else{
            $this->ajaxReturn(array('code'=>0));
        }
    }

    public function deleteTeacher(){
        $type = I('post.type',0);
        $ids = I('post.ids');
        $arrs = array();
        if($type == 1){
            $arr = explode(',',$ids);
            foreach($arr as $key =>$value){
                if($value) $arrs[] = $value;
            }
            $where['teacher_id'] = array('in',$arrs);
        }else{
            $where['teacher_id'] = $ids;
        }
        $data['is_delete'] = 1;
        $result = D('Teacheraffiliate')->where($where)->save($data);
        if($result !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }

    public function schoolindex(){
        import('ORG.Util.Page'); // 导入分页类
        $where = array();
        $school_name = trim(I('post.school_name',''));
        if(!empty($school_name)) $where['school_name'] = $school_name;
        $where['is_delete'] = 0;
        $count = D('Schools')->where($where)->count(); // 查询满足要求的总记录数
        $Page = new Page($count, 25); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = D('Schools')->where($where)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('info',$list);
        $this->assign('school_name',$school_name);
        $this->display();
    }

    public function createschool(){
        $data = $this->_post('data');
        if($_POST){
            if(empty(trim($data['school_name']))) $this->baoError('请填写学校名称');
            if(empty(trim($data['address']))) $this->baoError('请填写地址');
            if(empty(trim($data['city']))) $this->baoError('请选择城市');
            if(empty(trim($data['county']))) $this->baoError('请选择区域');
            $data['province'] = 18;//默认湖南省
            $data['created_at'] = date('Y-m-d H:i:s',time());
            $result = D('Schools')->add($data);
            if($result){
                $this->baoSuccess('操作成功',U('user/schoolindex'));
            }else{
                $this->baoError('添加失败');
            }
        }else{
            $cityInfo = D('City')->where(array('is_open'=>1))->field('city_id,name,common_city_id')->select();
            $this->assign('cityInfo',$cityInfo);
            $this->display();
        }
    }

    public function getAreaInfo(){
        $id = I('post.id');
        if($id){
            $areaInfo = D('Area')->where(array('city_id'=>$id))->field('area_id,area_name,common_area_id')->select();
            $this->ajaxReturn(array('code'=>1,'areaInfo'=>$areaInfo));
        }else{
            $this->ajaxReturn(array('code'=>0));
        }
    }

    public function deleteSchool(){
        $type = I('post.type',0);
        $ids = I('post.ids');
        $arrs = array();
        if($type == 1){
            $arr = explode(',',$ids);
            foreach($arr as $key =>$value){
                if($value) $arrs[] = $value;
            }
            $where['school_id'] = array('in',$arrs);
        }else{
            $where['school_id'] = $ids;
        }
        $data['is_delete'] = 1;
        $result = D('Schools')->where($where)->save($data);
        if($result !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }

    public function editSchool(){
        $school_id = I('get.school_id');
        $data = $this->_post('data');
        if($_POST){
            if(empty(trim($data['school_id']))) $this->baoError('请填写学校ID');
            if(empty(trim($data['school_name']))) $this->baoError('请填写学校名称');
            if(empty(trim($data['address']))) $this->baoError('请填写地址');
            if(empty(trim($data['city']))) $this->baoError('请选择城市');
            if(empty(trim($data['county']))) $this->baoError('请选择区域');
            $data['province'] = 18;//默认湖南省
            $data['updated_at'] = date('Y-m-d H:i:s',time());
            $result = D('Schools')->where(array('school_id'=>$data['school_id']))->save($data);
            if($result){
                $this->baoSuccess('操作成功',U('user/schoolindex'));
            }else{
                $this->baoError('修改失败');
            }
        }else{
            $where['school_id'] = $school_id;
            $school_info = D('Schools')->where($where)->field('school_id,school_name,address,city,county')->select();
            $this->assign('detail',current($school_info));
            $cityInfo = D('City')->where(array('is_open'=>1))->field('city_id,name,common_city_id')->select();
            $city_id = '';
            foreach($cityInfo as $key =>$value){
                if($school_info[0]['city'] == $value['common_city_id']){
                    $city_id = $value['city_id'];
                }
            }
            if($school_info[0]['county']){
                $data['county'] = $school_info[0]['county'];
                $areainfo= D('Area')->where($data)->field('area_name')->find();
                $area_name = $areainfo['area_name'];
            }else{
                $area_name = '';
            }
            $areas = D('Area')->where(array('city_id'=>$city_id))->field('area_id,area_name,common_area_id')->select();
            $this->assign('area_name',$area_name);
            $this->assign('cityInfo',$cityInfo);
            $this->assign('areas',$areas);
            $this->assign('school_id',$school_id);
            $this->display();
        }
    }

    public function classindex(){
        import('ORG.Util.Page'); // 导入分页类
        $school_id = I('request.school_id',0);
        $class_name = I('post.class_name');
        if($class_name) $where['class_name'] = $class_name;
        $where['school_id'] = $school_id;
        $where['is_delete'] = 0;
        $count = D('Classes')->where($where)->count(); // 查询满足要求的总记录数
        $Page = new Page($count, 25); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = D('Classes')->where($where)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $school= D('Schools')->where(array('school_id'=>$school_id))->field('school_name')->find();
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('info',$list);
        $this->assign('class_name',$class_name);
        $this->assign('school_id',$school_id);
        $this->assign('school_name',$school['school_name']);
        $this->display();
    }

    public function createclass(){
        $school_id = I('request.school_id',0);
        $data = $this->_post('data');
        if($_POST){
            if(empty(trim($data['school_id']))) $this->baoError('请填写学校ID');
            if(empty(trim($data['class_name']))) $this->baoError('请填写班级名称');
            $data['created_at'] = date('Y-m-d H:i:s',time());
            $result = D('Classes')->add($data);
            if($result){
                $this->baoSuccess('操作成功',U('user/classindex',array('school_id'=>$data['school_id'])));
            }else{
                $this->baoError('添加失败');
            }
        }else{
            $this->assign('school_id',$school_id);
            $this->display();
        }
    }

    public function editclass(){
        $school_id= I('request.school_id');
        $class_id= I('request.class_id',0);
        $data = $this->_post('data');
        if($_POST){
            if(empty(trim($data['class_id']))) $this->baoError('班级ID不能为空');
            if(empty(trim($data['class_name']))) $this->baoError('请填写班级名称');
            $data['updated_at'] = date('Y-m-d H:i:s',time());
            $result = D('Classes')->where(array('class_id'=>$data['class_id']))->save($data);
            if($result){
                $this->baoSuccess('操作成功',U('user/classindex',array('school_id'=>$school_id)));
            }else{
                $this->baoError('修改失败');
            }
        }else{
            $class = D('Classes')->where(array('class_id'=>$class_id))->field('class_name')->find();
            $this->assign('class_name',$class['class_name']);
            $this->assign('class_id',$class_id);
            $this->assign('school_id',$school_id);
            $this->display();
        }
    }

    public function deleteClass(){
        $type = I('post.type',0);
        $ids = I('post.ids');
        $arrs = array();
        if($type == 1){
            $arr = explode(',',$ids);
            foreach($arr as $key =>$value){
                if($value) $arrs[] = $value;
            }
            $where['class_id'] = array('in',$arrs);
        }else{
            $where['class_id'] = $ids;
        }
        $data['is_delete'] = 1;
        $result = D('Classes')->where($where)->save($data);
        if($result !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }

    public function usertest(){
        $User = D('Users');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('closed'=>array('IN','0,-1'));
        if($mobile = $this->_param('mobile','htmlspecialchars')){
            $map['mobile'] = array('LIKE','%'.$mobile.'%');
            $this->assign('mobile',$mobile);
        }

        $count = $User->where($map)->count(); // 查询满足要求的总记录数
        $Page = new Page($count, 25); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $User->where($map)->order(array('user_id'=>'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        foreach($list as $k=>$val){
            $val['reg_ip_area'] = $this->ipToArea($val['reg_ip']);
            $val['last_ip_area']   = $this->ipToArea($val['last_ip']);
            $list[$k] = $val;
        }
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('ranks',D('Userrank')->fetchAll());
        $this->display();
    }
}
