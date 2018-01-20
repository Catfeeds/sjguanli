<?php



class MoneyAction extends CommonAction {

    public function index(){
        import('ORG.Util.Page'); // 导入分页类
        $shop_id = $this->shop_id;
        //sum1 已结算  sum2 冻结金额 sum3 可结算金额 sum4 总金额
        $arr = D('Goods')->alias('g')
            ->join('practice_order_goods as og on og.goods_id = g.goods_id','left')
            ->join('practice_order as o on o.order_id = og.order_id','left')
            ->field('sum(case when o.`status` in ("1","2","3") then o.total_price else 0 end)as sum4,
            sum(case when o.`status` = 3 and o.is_balance = 1 then o.total_price else 0 end)as sum3,
            sum(case when o.`status` = 3 and o.is_balance = 10 then o.total_price else 0 end)as sum1,
            sum(case when (o.`status` in (1,2)) or (o.is_balance = 2)then o.total_price else 0 end)as sum2')
            ->where(array('g.is_delete'=>0,'g.status'=>4,'g.shop_id'=>$shop_id,'o.status'=>array('in',array(1,2,3))))->find();
        $where['shop_id'] = $shop_id;
        $where['status'] = 4;//已发布
        $where['is_delete'] = 0;
        $count = D('Goods')->where($where)->count();
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = D('Goods')->where($where)->field('goods_id,title,start_time')->limit($Page->firstRow . ',' . $Page->listRows)
            ->order('start_time desc')->select();
        foreach($list as $key =>$value){
            $wherel['o.status'] = array('in',array(1,2,3));
            $wherel['og.goods_id'] = $value['goods_id'];
            $info = D('Ordergoods')->alias('og')
                ->join('practice_order as o on o.order_id = og.order_id','left')
                ->where($wherel)
                ->field('sum(case when o.`status` = 3 and o.is_balance = 1 then o.total_price else 0 end)as sum1,
                sum(case when (o.`status` in (1,2)) or (o.is_balance = 2) then o.total_price else 0 end)as sum2,
                sum(case when o.`status` = 3 and o.is_balance = 10 then o.total_price else 0 end)as sum3')->find();
            $list[$key]['sum1'] = $info['sum1'];
            $list[$key]['sum2'] = $info['sum2'];
            $list[$key]['sum3'] = $info['sum3'];
        }
        $this->assign('sum',$arr);
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }

    /*
     * 可结算订单列表
     */
    public function apply(){
        $goods_info = D('Goods')->where(array('is_delete'=>0,'shop_id'=>$this->shop_id,'status'=>4))->order('created_at desc')->select();
        foreach($goods_info as $key=>$value){
            $goods_info[$key]['count'] = D('Order')->alias('o')
                ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                ->where(array('o.status'=>3,'o.is_balance'=>1,'og.goods_id'=>$value['goods_id']))
                ->count();
            $goods_info[$key]['sum'] = D('Order')->alias('o')
                ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                ->where(array('og.goods_id'=>$value['goods_id']))
                ->getField('sum(case when o.`status` = 3 and o.is_balance = 1 then o.total_price else 0 end) as sum');
        }
        $this->assign('goods_info',$goods_info);
        $this->display();
    }

    /*
     * 申请结算并保存数据库
     */
    public function applydata(){
        $idstr = I('post.ids');
        $remarks = I('post.remarks');
        if(strpos($idstr,',')!== false){
            $uid = getShopUid();
            $ids = explode(',',$idstr);
            M()->startTrans();//开启事务
            $nums = $sums = 0;
            foreach($ids as $key =>$value){
                if($value){
                    $num = D('Order')->alias('o')
                        ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                        ->where(array('o.status'=>3,'o.is_balance'=>1,'og.goods_id'=>$value))
                        ->count();
                    $sum = D('Order')->alias('o')
                        ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                        ->where(array('og.goods_id'=>$value))
                        ->getField('sum(case when o.`status` = 3 and o.is_balance = 1 then o.total_price else 0 end) as sum');
                    $sums = $sums + $sum;
                    $nums = $nums + $num;
                }
            }
            $id = $this->createorder();
            if($remarks) $data['remarks'] = $remarks;
            $data['shop_id'] = $this->shop_id;
            $data['settlement_order_id'] = $id;
            $data['order_total_num'] = $nums;
            $data['order_total_amount'] = $sums;
            $data['status'] = 0;
            $data['applicant_id'] = $uid;
            $data['applicant_time'] = date('Y-m-d H:i:s',time());
            $data['created_at'] = date('Y-m-d H:i:s',time());
            $settlement_id = D('Settlementorders')->add($data);//添加结算总表记录并返回主键id
            if($settlement_id){
                foreach($ids as $key =>$value){
                    if($value){
                        $orderarrs = D('Order')->alias('o')
                            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                            ->join('practice_goods as g on g.goods_id = og.goods_id')
                            ->where(array('o.status'=>3,'o.is_balance'=>1,'og.goods_id'=>$value))
                            ->field('o.order_id,o.original_price,og.goods_id,g.settlement_price')
                            ->select();
                        $datas = array();
                        $i = 0;
                        foreach($orderarrs as $k=>$v){
                            $datas[$i]['order_id'] = $v['order_id'];
                            $datas[$i]['goods_id'] = $v['goods_id'];
                            $datas[$i]['settlement_id'] = $settlement_id;
                            $datas[$i]['sales_price'] = $v['original_price'];
                            $datas[$i]['settlement_price'] = $v['settlement_price'];
                            $datas[$i]['created_at'] = date('Y-m-d H:i:s',time());
                            $arrs[] = $v['order_id'];
                            $i++;
                        }
                        $results = D('Settlementorderdetails')->addALL($datas);//插入结算详情表
                        if($results === false){
                            M()->rollback();
                            $this->baoError('申请失败！');
                        }
                        $where['order_id'] = array('in',$arrs);
                        $ret = D('Order')->where($where)->save(array('is_balance'=>2));//将订单从待结算变成待审核状态
                        if($ret === false){
                            M()->rollback();
                            $this->baoError('申请失败！');
                        }
                    }
                }
            }else{
                M()->rollback();
                $this->baoError('申请失败！');
            }
            M()->commit();
            $this->baoSuccess('申请成功！',U('shangjia/money/clearinglist'));
        }else{
            $this->baoError('申请失败！');
        }
    }

    /*
     * 生成结算单号ZJS20180225001
     */
    public function createorder(){
        $id = D('Settlementorders')->order('settlement_id desc')->getField('settlement_order_id');
        if($id){
            $time = substr($id,3,8);//获取时间
            $now_time = date('Ymd',time());
            if($time === $now_time){
                $num = substr($id,3,11);//累计+1
                $new_num = $num+1;
                $str = 'ZJS'.$new_num;
            }else{
                $str = 'ZJS'.date('Ymd',time()).'001';
            }
        }else{
            $str = 'ZJS'.date('Ymd',time()).'001';
        }
        return $str;
    }

    /*
     * 结算订单
     */
    public function submit(){
        $idstrs = I('get.ids');
        if(strpos($idstrs,',')!== false){
            $ids = explode(',',$idstrs);
            $i = 0;
            foreach($ids as $key=>$value){
                if($value){
                    $list[$i] = D('Goods')->where(array('goods_id'=>$value))->field('title,start_time,price,settlement_price')->find();
                    $num = D('Order')->alias('o')
                        ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                        ->where(array('o.status'=>3,'o.is_balance'=>1,'og.goods_id'=>$value))
                        ->count();
                    $sum = D('Order')->alias('o')
                        ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                        ->where(array('og.goods_id'=>$value))
                        ->getField('sum(case when o.`status` = 3 and o.is_balance = 1 then o.total_price else 0 end) as sum');
                    $list[$i]['count'] = $num;
                    $i++;
                }
            }
        }
        $sums = 0;
        foreach($list as $k =>$v){
            $list[$k]['prices'] = $v['price']*$v['count'];
            $list[$k]['settlement_prices'] = $v['settlement_price']*$v['count'];
            $sums = $sums + $v['settlement_price']*$v['count'];
        }
        $this->assign('list',$list);
        $name = D('Shop')->where(array('shop_id'=>$this->shop_id))->getField('shop_name');
        $this->assign('sums',$sums);
        $this->assign('csums',toChineseNumber($sums));
        $this->assign('name',$name);
        $this->assign('list',$list);
        $this->assign('idstrs',$idstrs);
        $this->display();
    }

    public function checksettlement(){
        $name = D('Shop')->where(array('shop_id'=>$this->shop_id))->getField('shop_name');
        $this->assign('name',$name);
        $id = I('get.id');
        $info = D('Settlementorders')->where(array('id'=>$id))->find();
        $list = D('Settlementorderdetails')->alias('sd')
            ->join('practice_goods as g on g.goods_id = sd.goods_id','left')
            ->where(array('settlement_id'=>$id))
            ->group('sd.goods_id')
            ->select();
        $sums = 0;
        foreach($list as $key=>$value){
            $count = D('Settlementorderdetails')->where(array('id'=>$id,'goods_id'=>$value['goods_id']))->count();
            $list[$key]['count'] = $count;
            $list[$key]['prices'] = $value['price']*$count;
            $list[$key]['settlement_prices'] = $value['settlement_price']*$count;
            $sums = $sums+$value['settlement_price']*$count;
        }
        $applicant_name = D('Shopworker')->where(array('shop_work_id'=>$info['applicant_id']))->getField('work_name');
        $user_name = '';
        if($info['auditor_id']){
            $user_name = D('Admin')->where(array('admin_id'=>$info['auditor_id']))->getField('username');
        }
        $this->assign('user_name',$user_name);
        $this->assign('applicant_name',$applicant_name);
        $this->assign('sums',$sums);
        $this->assign('csums',toChineseNumber($sums));
        $this->assign('info',$info);
        $this->assign('list',$list);
        $this->display();
    }

    /*
     * 结算列表
     */
    public function clearinglist(){
        $status = 88;
        if($_GET['status'] != ''){
            if($_GET['status'] != 88){
                $status = $_GET['status'];
                $where['status'] = $status;
            }
        }
        $where['shop_id']=$this->shop_id;
        $list = D('Settlementorders')->where($where)->select();
        $this->assign('list',$list);
        $this->assign('status',$status);
        $this->display();
    }

    public function balance(){
        import('ORG.Util.Page'); // 导入分页类
        $goods_id = $_REQUEST['goods_id'];
        $title = $_REQUEST['title'];
        $order_id = $_REQUEST['order_id'];
        $bg_date = $_REQUEST['bg_date'];
        $end_date = $_REQUEST['end_date'];
        $is_balance = $_REQUEST['is_balance'];
        if($order_id){
            $where['o.order_id'] = $order_id;
            $this->assign('order_id',$order_id);
        }
        if($bg_date && !$end_date){
            $where['o.created_at'] = array('egt',$bg_date);
            $this->assign('bg_date',$bg_date);
        }
        if(!$bg_date && $end_date){
            $where['o.created_at'] = array('elt',$end_date);
            $this->assign('end_date',$end_date);
        }
        if($bg_date && $end_date){
            $where['o.created_at'] = array('between',array($bg_date,$end_date));
            $this->assign('bg_date',$bg_date);
            $this->assign('end_date',$end_date);
        }
        if($is_balance){
            $where['o.is_balance'] = $is_balance;
            $this->assign('is_balance',$is_balance);
        }
        $where['og.goods_id'] = $goods_id;
        $where['o.status'] = 3;
        $count = D('Order')->alias('o')
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->join('practice_users as u on u.user_id = o.user_id','left')
            ->where($where)
            ->field('o.order_id,o.created_at,u.nickname,u.mobile,o.`is_balance`,o.total_price')
            ->count();
        $dcount = D('Order')->alias('o')
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->join('practice_users as u on u.user_id = o.user_id','left')
            ->where(array('o.status'=>3,'og.goods_id'=>$goods_id,'o.is_balance'=>1))
            ->field('o.order_id')
            ->count();//待结算订单数
        $sum = D('Order')->alias('o')
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->where(array('og.goods_id'=>$goods_id))
            ->getField('sum(case when o.`status` = 3 and o.is_balance = 1 then o.total_price else 0 end) as sum');
        $this->assign('sum',$sum);
        $this->assign('dcount',$dcount);
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = D('Order')->alias('o')
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->join('practice_users as u on u.user_id = o.user_id','left')
            ->where($where)
            ->field('o.order_id,o.created_at,u.nickname,u.mobile,o.`is_balance`,o.total_price')
            ->limit($Page->firstRow . ',' . $Page->listRows)
            ->order('o.created_at desc')
            ->select();
        $this->assign('goods_id',$goods_id);
        $this->assign('title',$title);
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }

    public function szhi(){
        $this->display();
    }

    public function shopmoney(){
        $map = array('shop_id' => $this->shop_id);
        if (($bg_date = $this->_param('bg_date', 'htmlspecialchars') ) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date);
            $map['create_time'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            if ($bg_date = $this->_param('bg_date', 'htmlspecialchars')) {
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['create_time'] = array('EGT', $bg_time);
            }
            if ($end_date = $this->_param('end_date', 'htmlspecialchars')) {
                $end_time = strtotime($end_date);
                $this->assign('end_date', $end_date);
                $map['create_time'] = array('ELT', $end_time);
            }
        }
        $shopmoney = D('Shopmoney');
        import('ORG.Util.Page'); // 导入分页类
//        $map = array('user_id' => $this->uid);
        $count = $shopmoney->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $shopmoney->where($map)->order(array('money_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }

    

    public function tixian(){
       
      
        
        if (IS_POST)
        {
            $money = (int) ($_POST['money'] * 100);
            if ($money <= 0)
            {
                $this->baoError('提现金额不合法');
            }
            if ($money > $this->member['money'] || $this->member['money'] == 0)
            {
                $this->baoError('余额不足，无法提现');
            }
            if(!$data['bank_name'] = htmlspecialchars($_POST['bank_name'])){
                $this->baoError('开户行不能为空'); 
            }
            if(!$data['bank_num'] = htmlspecialchars($_POST['bank_num'])){
                $this->baoError('银行账号不能为空'); 
            }
            
            if(!$data['bank_realname'] = htmlspecialchars($_POST['bank_realname'])){
                $this->baoError('开户姓名不能为空'); 
            }
            $data['bank_branch'] = htmlspecialchars($_POST['bank_branch']);
            $data['user_id'] = $this->uid;
            
            $arr = array();
            $arr['user_id'] = $this->uid;
            $arr['money'] = $money;
            $arr['addtime'] = NOW_TIME;
            $arr['account'] = $this->member['account'];
            $arr['bank_name'] = $data['bank_name'];
            $arr['bank_num'] = $data['bank_num'];
            $arr['bank_realname'] = $data['bank_realname'];
            $arr['bank_branch'] = $data['bank_branch'];
            D("Userscash")->add($arr);
            D('Usersex')->save($data);
            D('Users')->addMoney($this->uid, -$money, '申请提现，扣款');
            $this->baoSuccess('申请成功', U('money/index'));
        }
        else
        {
            $this->assign('info',D('Usersex')->getUserex($this->uid));
            $this->assign('money', $this->member['money']);
            $this->display();
        }
    }

    public function tixianlog()
    {    
	     $map = array('user_id' => $this->uid);
        if (($bg_date = $this->_param('bg_date', 'htmlspecialchars') ) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date);
            $map['create_time'] = array(array('ELT', $end_time), array('EGT', $bg_time));
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            if ($bg_date = $this->_param('bg_date', 'htmlspecialchars')) {
                $bg_time = strtotime($bg_date);
                $this->assign('bg_date', $bg_date);
                $map['create_time'] = array('EGT', $bg_time);
            }
            if ($end_date = $this->_param('end_date', 'htmlspecialchars')) {
                $end_time = strtotime($end_date);
                $this->assign('end_date', $end_date);
                $map['create_time'] = array('ELT', $end_time);
            }
        }
        $Userscash = D('Userscash');
        import('ORG.Util.Page'); // 导入分页类
        $count = $Userscash->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 16); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Userscash->where($map)->order(array('cash_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }
    
    
    
    
     public function tjmonth(){
        $Shopmoney = D('Shopmoney');
        import('ORG.Util.Page');// 导入分页类
        $count      = $Shopmoney->tjmonthCount("",  $this->shop_id);// 查询满足要求的总记录数 
        $Page       = new Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数
        $show       = $Page->show();// 分页显示输出
        $list = $Shopmoney->tjmonth("",  $this->shop_id,$Page->firstRow,$Page->listRows);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display();
    }
    
    public function tjday(){
         if (($bg_date = $this->_param('bg_date', 'htmlspecialchars') ) && ($end_date = $this->_param('end_date', 'htmlspecialchars'))) {
            $bg_time = strtotime($bg_date);
            $end_time = strtotime($end_date)+86400;
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
        } else {
            $bg_time = NOW_TIME - 86400 * 30;
            $bg_date = date('Y-m-d',$bg_time);
            $end_date = date('Y-m-d',NOW_TIME);
            $this->assign('bg_date', $bg_date);
            $this->assign('end_date', $end_date);
            $end_time = NOW_TIME + 86400;
        }
        
        $data = D('Shopmoney')->money($bg_time,$end_time,  $this->shop_id);
        $this->assign('data',$data);
        $this->display();
    }
    
}
