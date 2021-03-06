<?php


class OrderAction extends CommonAction {
    
    private function check_weidian(){
        
        $wd = D('WeidianDetails');
        $wd_res = $wd->where('shop_id ='.($this->shop_id)) -> find();
        if(!$wd_res){
            $this->error('请先完善微店资料！',U('goods/weidian'));
        }elseif($wd_res['audit'] == 0){
            $this->error('您的微店正在审核中，请耐心等待！',U('index/index'));
        }elseif($wd_res['audit'] == 2){
            $this->error('您的微店未通过审核！',U('index/index'));
        }
        
    }

    /*
     * 代理商获取订单列表
     * */
    public function index(){
        $Order = D('Order');
        import('ORG.Util.Page'); // 导入分页类
        //根据代理商编号获取所有商家信息
        $proxy_id = (int)$this->proxy_id;
        $shop_ids = array();
        $shop_where['proxy_id'] = $proxy_id;
        $ShopList = D('Shop')->where($shop_where)->select();
        foreach ($ShopList as $key => $val){
            $shop_ids[] = $val['shop_id'];
        }
        $where = array();
        $where['o.shop_id'] = array('in',$shop_ids);
        $type = I('get.type',1);
        $this->assign('type', $type);
        if($type == 1) $where['o.status'] = array('gt',0);
        if($type == 2) $where['o.status'] = 1;
        if($type == 3) $where['o.status'] = array('in',array(2,3));
        if($type == 4) $where['o.status'] = array('in',array(10,12,15));
        if($_GET['goods_id']){
            $where['g.goods_id'] = trim($_GET['goods_id']);
            $this->assign('goods_id', trim($_GET['goods_id']));
        }
        if($_GET['mobile']){
            $where['u.mobile'] = trim($_GET['mobile']);
            $this->assign('mobile', trim($_GET['mobile']));
        }
        if($_GET['order_id']){
            $where['o.order_id'] = trim($_GET['order_id']);
            $this->assign('order_id', trim($_GET['order_id']));
        }
        if($_GET['title']){
            $where['g.title'] = array('like','%'.trim($_GET['title']).'%');
            $this->assign('title', trim($_GET['title']));
        }
        if($_GET['bg_date'] && !$_GET['end_date']){
            $where['o.created_at'] = array('egt',$_GET['bg_date']);
            $this->assign('bg_date', $_GET['bg_date']);
        }
        if($_GET['end_date'] && !$_GET['bg_date']){
            $where['o.created_at'] = array('elt',$_GET['end_date']);
            $this->assign('end_date', $_GET['end_date']);
        }
        if($_GET['bg_date'] && $_GET['end_date']){
            $where['o.created_at'] = array('between',array($_GET['bg_date'],$_GET['end_date']));
            $this->assign('end_date', $_GET['end_date']);
            $this->assign('bg_date', $_GET['bg_date']);
        }
        if($_GET['truename']){
            $where['u.truename'] = array('like','%'.trim($_GET['truename']).'%');
            $this->assign('truename',trim($_GET['truename']));
        }
        $count = $Order->alias(o)
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->join('practice_goods as g on g.goods_id = og.goods_id','left')
            ->join('practice_users as u on u.user_id = o.user_id','left')
            ->join('practice_shop as sh on sh.shop_id = g.shop_id','left')
            ->where($where)->count();// 查询满足要求的总记录数
        $Page = new Page($count, $this->listRows); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Order->alias(o)
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->join('practice_goods as g on g.goods_id = og.goods_id','left')
            ->join('practice_users as u on u.user_id = o.user_id','left')
            ->join('practice_shop as sh on sh.shop_id = g.shop_id','left')
            ->where($where)->order(array('o.created_at' => 'desc'))
            ->field('o.order_id,o.created_at,g.title,u.truename,u.mobile,o.total_price,o.status,g.goods_id,sh.shop_name')
            ->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('status_type',getStatusType());
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display(); // 输出模板
    }
    
    public function wait() {
        $this->check_weidian();
       /* if(empty($this->shop['is_pei'])){
            $this->error('您签订的是由配送员配送！您管理不了订单！');
        }*/
        $Order = D('Order');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('closed' => 0, 'status' => 1,'shop_id'=>  $this->shop_id);
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        if ($keyword) {
            $map['order_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }

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
        
        // var_dump($map);die();
        $count = $Order->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        //print_r($Order->getLastSql());
        $user_ids = $order_ids  = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
 
        }
        if (!empty($order_ids)) {
            $goods = D('Ordergoods')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids = array();
            foreach ($goods as $val) {
                $goods_ids[$val['goods_id']] = $val['goods_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Goods')->itemsByIds($goods_ids));
        }
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('picks', session('order'));
        $this->display(); // 输出模板
    }
    
    
    public function wait2() {
        $this->check_weidian();
         /* if(empty($this->shop['is_pei'])){
            $this->error('您签订的是由配送员配送！您管理不了订单！');
        }*/
        $Order = D('Order');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('closed' =>0, 'status' =>0, 'is_daofu' =>1,'shop_id'=>$this->shop_id);
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        if($keyword){
            $map['order_id'] = array('LIKE', '%' . $keyword . '%');
            $this->assign('keyword', $keyword);
        }

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
        
        // var_dump($map);die();
        $count = $Order->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids  = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
 
        }
        if (!empty($order_ids)) {
            $goods = D('Ordergoods')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids = array();
            foreach ($goods as $val) {
                $goods_ids[$val['goods_id']] = $val['goods_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Goods')->itemsByIds($goods_ids));
        }
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('picks', session('order'));
        $this->display(); // 输出模板
    }
    public function pick() {
        $this->check_weidian();
        $order_ids = session('order');
        $orders = $this->_post('order_id', false);
        foreach ($orders as $val) {
            if ($detail = D('Order')->find($val)) {
                if ($detail['status'] == 1 || ($detail['staus'] == 0 && $detail['is_daofu'] == 1 && $detail['shop_id'] == $this->shop_id)) {
                    $order_ids[$val] = $val;
                }
            }
        }
        session('order', $order_ids);
        if ($this->_get('wait')) {
            $this->baoSuccess('加入捡货单成功！', U('order/wait2'));
        } else {
            $this->baoSuccess('加入捡货单成功！', U('order/wait'));
        }
    }

    public function clean() {
        $this->check_weidian();
        session('order', null);
        if ($this->_get('wait')) {
            $this->baoSuccess('清空捡货队列成功！', U('order/wait2'));
        } else {
            $this->baoSuccess('清空捡货队列成功！', U('order/wait'));
        }
    }
    
     //创建捡货单
    public function create() {
        $this->check_weidian();
        $order_ids = session('order');
        $local = array();
        foreach ($order_ids as $val) {
            if ($detail = D('Order')->find($val)) {
                if ($detail['status'] == 1 || ($detail['staus'] == 0 && $detail['is_daofu'] == 1  && $detail['shop_id'] == $this->shop_id)) {
                    $local[$val] = $val;
                }
            }
        }
        if (empty($local)) {
            $this->baoError('请选择要加入捡货的订单！');
        }

        $data = array(
            'admin_id' => 0,
            'shop_id' => $this->shop_id,
            'create_time' => NOW_TIME,
            'create_ip' => get_client_ip(),
            'order_ids' => join(',', $local),
            'name' => '捡货单' . date('Y-m-d H:i:s'),
        );
        if ($pick_id = D('Orderpick')->add($data)) {
            D('Order')->save(array('status' => 2), array("where" => array('order_id' => array('IN', $local))));
            D('Ordergoods')->save(array('status' => 1), array("where" => array('order_id' => array('IN', $local))));
            session('order', null);
            $this->baoSuccess('创建捡货单成功！', U('order/pickdetail', array('pick_id' => $pick_id)));
        }
        $this->baoError('创建捡货单失败');
    }
    
    
      public function pickdetail($pick_id) {
          $this->check_weidian();
        $pick_id = (int) $pick_id;
        $pick = D('Orderpick')->find($pick_id);
        if($pick['shop_id'] != $this->shop_id){
            $this->error('请不要恶意操作其他人的订单！');
        }
        $orderids = explode(',', $pick['order_ids']);

        $Order = D('Order');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('order_id' => array('IN', $orderids));
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->select();
        $user_ids = $order_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
        }
        if (!empty($order_ids)) {
            $goods = D('Ordergoods')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids  = array();
            foreach ($goods as $val) {
                $goods_ids[$val['goods_id']] = $val['goods_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Goods')->itemsByIds($goods_ids));
        }
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->display();
    }
    
    
    
    public function count(){
        
        $dvo = D('DeliveryOrder'); // 实例化User对象
        $bg_date = strtotime(I('bg_date',0,'trim'));
        $end_date = strtotime(I('end_date',0,'trim'));
        $this->assign('btime',$bg_date);
        $this->assign('etime',$end_date);
        
        if($bg_date && $end_date){
            $pre_btime = date('Y-m-d H:i:s',$bg_date);
            $pre_etime = date('Y-m-d H:i:s',$end_date);
            $this->assign('pre_btime',$pre_btime);
            $this->assign('pre_etime',$pre_etime);
        }
        
        $map = array();
        $map['shop_id'] = $this->shop_id;
        $map['type'] = 0;
        if($bg_date && $end_date){
           $map['create_time'] = array('between',array($bg_date,$end_date)); 
        }
        
        import('ORG.Util.Page');// 导入分页类
        $count      = $dvo->where($map)->count();// 查询满足要求的总记录数
        $Page       = new Page($count,25);// 实例化分页类 传入总记录数和每页显示的记录数
        $show       = $Page->show();// 分页显示输出
        // 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $dvo->where($map)->order('order_id desc')->limit($Page->firstRow.','.$Page->listRows)->relation(true)->select();
   
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
       
        $this->display();
        
    }
    
    
    function delivery_count(){
        
        $delivery_id = I('did',0,'intval,trim');
        $btime = I('btime',0,'trim');
        $etime = I('etime',0,'trim');
        
        $map = array();
        if($btime && $etime){
           $map['create_time'] = array('between',array($btime,$etime)); 
        }
  
        if(!$delivery_id || !($this->shop_id)){
            $this->ajaxReturn(array('status'=>'error','message'=>'错误'));
        }else{
            $map['delivery_id'] = $delivery_id;
            $map['shop_id'] = $this->shop_id;
            $map['type'] = 0;
            $count = D('DeliveryOrder') ->where($map)-> count();
            if($count){
                $this->ajaxReturn(array('status'=>'success','count'=>$count));
            }else{
                $this->ajaxReturn(array('status'=>'error','message'=>'错误'));
            }
        }
    }
    
    
    public function picks() {
        $this->check_weidian();
        /*if(empty($this->shop['is_pei'])){
            //$this->error('您签订的是由配送员配送！您管理不了订单！');
        }*/
        $Orderpick = D('Orderpick');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('shop_id'=>  $this->shop_id);
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
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        if ($keyword) {
            $map['name'] = array('LIKE', '%' . $keyword . '%');
        }
        $this->assign('keyword', $keyword);

        $count = $Orderpick->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 25); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Orderpick->where($map)->order('pick_id desc')->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $this->assign('keyword', $keyword);
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display(); // 输出模板        
    }
    
    public function send($pick_id) {
        $this->check_weidian();
        $pick_id = (int) $pick_id;
        $pick = D('Orderpick')->find($pick_id);
        $orderids = explode(',', $pick['order_ids']);
        if($pick['shop_id'] != $this->shop_id){
            $this->error('请不要恶意操作其他人的订单！');
        }
        
        $Order = D('Order');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('order_id' => array('IN', $orderids));

        $list = $Order->where($map)->order(array('order_id' => 'asc'))->select();

        $user_ids = $order_ids  = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
        }
        if (!empty($order_ids)) {
            $goods = D('Ordergoods')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids = array();
            foreach ($goods as $val) {
                $goods_ids[$val['goods_id']] = $val['goods_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Goods')->itemsByIds($goods_ids));
        }
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list);
        $this->display();
    }

	 public function delivery() {
        $this->check_weidian();
        /*if(empty($this->shop['is_pei'])){
            $this->error('您签订的是由配送员配送！您管理不了订单！');
        }*/
        $Orderpick = D('Orderpick');
        import('ORG.Util.Page'); // 导入分页类
        $map = array();

        $map = array('closed' => 0, 'status' => 2,'shop_id'=>  $this->shop_id );
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
        $keyword = $this->_param('keyword', 'htmlspecialchars');
        if ($keyword) {
            $map['name'] = array('LIKE', '%' . $keyword . '%');
        }
        $this->assign('keyword', $keyword);
		$Order = D('Order');
        // var_dump($map);die();
        $count = $Order->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, 10); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Order->where($map)->order(array('order_id' => 'asc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        $user_ids = $order_ids = $shop_ids = $addr_ids = array();
        foreach ($list as $key => $val) {
            $user_ids[$val['user_id']] = $val['user_id'];
            $order_ids[$val['order_id']] = $val['order_id'];
            $addr_ids[$val['addr_id']] = $val['addr_id'];
            $shop_ids[$val['shop_id']] = $val['shop_id'];
        }
        if (!empty($order_ids)) {
            $goods = D('Ordergoods')->where(array('order_id' => array('IN', $order_ids)))->select();
            $goods_ids = array();
            foreach ($goods as $val) {
                $goods_ids[$val['goods_id']] = $val['goods_id'];
            }
            $this->assign('goods', $goods);
            $this->assign('products', D('Goods')->itemsByIds($goods_ids));
        }
        $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        $this->assign('addrs', D('Useraddr')->itemsByIds($addr_ids));
        $this->assign('areas', D('Area')->fetchAll());
        $this->assign('business', D('Business')->fetchAll());
        $this->assign('users', D('Users')->itemsByIds($user_ids));
        $this->assign('types', D('Order')->getType());
        $this->assign('goodtypes', D('Ordergoods')->getType());
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('picks', session('order'));
        $this->display(); // 输出模板
    }

    public function distribution() {
        $this->check_weidian();
        $order_id = (int) $this->_get('order_id');
        if (!$order_id) {
            $this->baoError('参数错误');
        }else if(!$order = D('Order')->find($order_id)){
            $this->baoError('该订单不存在');
        }else if($order['shop_id'] != $this->shop_id){
            $this->baoError('不能管理不是您的订单');
        }else if($order['status'] != 2){
            $this->baoError('该订单状态不正确，不能发货');
        }else{
            D('Order')->overOrder($order_id); //发货订单接口
            $this->baoSuccess('发货成功！', U('order/delivery'));
        }		
        $this->baoError('一键发货失败！');
    }

    public function detail(){
        $order_id = I('get.order_id');
        if(empty($order_id)) $this->baoError('非法访问');
        $info = D('Order')->alias('o')
            ->join('practice_users as u on u.user_id = o.user_id','left')
            ->join('practice_order_goods as og on og.order_id = o.order_id','left')
            ->join('practice_goods as g on g.goods_id = og.goods_id','left')
            ->where(array('o.order_id'=>$order_id))
            ->field('o.`status`,u.nickname,u.mobile,o.coupon_amount,o.created_at,g.title,g.photo,g.start_time,g.finaly_time,o.original_price,o.total_price,o.pay_time,o.remark,
            o.apply_refund_time,o.refund_process_time,o.refund_finish_time')
            ->find();
        $typeArr = getStatusType();
        $info['status_name'] = $typeArr[$info['status']+1];
        $info['order_receivable'] = 0;
        if((int)$info['coupon_amount'] > 0){
            $info['order_receivable'] = floatval($info['total_price'] - $info['coupon_amount']);
        }
        $this->assign('order_id',$order_id);
        $this->assign('info',$info);
        $this->display();
    }
}
