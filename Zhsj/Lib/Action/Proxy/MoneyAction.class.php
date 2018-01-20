<?php



class MoneyAction extends CommonAction {

    /*
     * 财务管理详情
     * */
    public function index(){
        import('ORG.Util.Page'); // 导入分页类
        //根据代理商编号获取所有商家信息
        $proxy_id = (int)$this->proxy_id;
        $shop_ids = array();
        $shop_where['proxy_id'] = $proxy_id;
        $shop_where['status'] = 2;
        $ShopList = D('Shop')->where($shop_where)->select();
        foreach ($ShopList as $key => $val){
            $shop_ids[] = $val['shop_id'];
        }
        //sum1 已结算  sum2 冻结金额 sum3 可结算金额 sum4 总金额
        $goods_where['g.closed'] = 0;
        $goods_where['g.is_delete'] = 0;
        $goods_where['g.status'] = 4;
        $goods_where['g.shop_id'] = array('in',$shop_ids);
        $goods_where['o.status'] = array('in',array(1,2,3));
        $arr = D('Goods')->alias('g')
            ->join('practice_order_goods as og on og.goods_id = g.goods_id','left')
            ->join('practice_order as o on o.order_id = og.order_id','left')
            ->field('sum(case when o.`status` in ("1","2","3") then o.total_price else 0 end)as sum4,
            sum(case when o.`status` = 3 and o.is_balance = 0 then o.total_price else 0 end)as sum3,
            sum(case when o.`status` = 3 and o.is_balance = 1 then o.total_price else 0 end)as sum1,
            sum(case when o.`status` in(1,2) then o.total_price else 0 end)as sum2')
            ->where($goods_where)
            ->find();
        $where['shop_id'] = array('in',$shop_ids);
        $where['status'] = 4;//已发布
        $where['is_delete'] = 0;
        $where['closed'] = 0;
        $count = D('Goods')->where($where)->count();
        $Page = new Page($count, $this->listRows); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = D('Goods')->where($where)->field('goods_id,title,start_time,shop_id')->limit($Page->firstRow . ',' . $Page->listRows)
            ->order('start_time desc')
            ->select();
        foreach($list as $key =>$value){
            $wherel['o.status'] = array('in',array(1,2,3));
            $wherel['og.goods_id'] = $value['goods_id'];
            $info = D('Ordergoods')->alias('og')
                ->join('practice_order as o on o.order_id = og.order_id','left')
                ->where($wherel)
                ->field('sum(case when o.`status` = 3 and is_balance = 0 then o.total_price else 0 end)as sum1,
                sum(case when o.`status` in (1,2) then o.total_price else 0 end)as sum2,
                sum(case when o.`status` = 3 and is_balance = 1 then o.total_price else 0 end)as sum3')->find();
            $list[$key]['sum1'] = $info['sum1'];
            $list[$key]['sum2'] = $info['sum2'];
            $list[$key]['sum3'] = $info['sum3'];
            //商家信息
            $Shop = D('Shop')->where(array('shop_id'=>$value['shop_id']))->find();
            $list[$key]['shop_name'] = $Shop['shop_name'];
        }
        $this->assign('sum',$arr);
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display();
    }

    public function balance(){
        import('ORG.Util.Page'); // 导入分页类
        $goods_id = $_REQUEST['goods_id'];
        $title = $_REQUEST['title'];
        $order_id = $_REQUEST['order_id'];
        $bg_date = $_REQUEST['bg_date'];
        $end_date = $_REQUEST['end_date'];
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
        $where['og.goods_id'] = $goods_id;
        $where['o.status'] = 3;
        $count = D('Order')->alias('o')
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->join('practice_users as u on u.user_id = o.user_id','left')
            ->where($where)
            ->field('o.order_id,o.created_at,u.nickname,u.mobile,o.`is_balance`,o.total_price')
            ->count();
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
        $Page = new Page($count, $this->listRows); // 实例化分页类 传入总记录数和每页显示的记录数
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
