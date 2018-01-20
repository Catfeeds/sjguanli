<?php



class IndexAction extends CommonAction {

    public function index() {
        $this->display();
    }

//    public function main() {
//        $startt = date('Y-m-d H:i:s',time()-604800);
//        $endt = date('Y-m-d H:i:s',time());
//        $where['shop_id'] = $this->shop_id;
//        $where['status'] = array('in',array(1,2,3));
//        $where['created_at'] = array('between',array($startt,$endt));
//        $sevenc = D('Order')->where($where)->count();//近七日订单量
//        $this->assign('sevenc',$sevenc);
//        //sum1 可结算金额 sum2 总金额
//        $sum = D('Order')->where(array('shop_id'=>$this->shop_id))
//            ->field(' sum(case when status = 3 and is_balance = 0 then total_price else 0 end) as sum1,
//            sum(case when status in ("1","2","3") then total_price else 0 end) as sum2,
//            sum(case when (status in ("1","2","3")) and (created_at between "'.$startt.'" and "'.$endt.'") then total_price else 0 end) as sum3')->find();
//        $this->assign('sum',$sum);//可结算金额，总金额
//        $counts = array();
//        $bg_time = strtotime(TODAY);
//        $counts['totay_order'] = (int) D('Order')->where(array(
//                    'shop_id' => $this->shop_id,
//                    'create_time' => array(
//                        array('ELT', NOW_TIME),
//                        array('EGT', $bg_time),
//                    ), 'status' => array(
//                        'EGT', 0
//                    ),
//                ))->count();
//        $counts['order'] = (int) D('Order')->where(array(
//                    'shop_id' => $this->shop_id,
//                    'status' => array(
//                        'GT', 0
//                    ),
//                ))->count();
//
//        $counts['today_yuyue'] = (int) D('Shopyuyue')->where(array(
//                    'shop_id' => $this->shop_id,
//                    'create_time' => array(
//                        array('ELT', NOW_TIME),
//                        array('EGT', $bg_time),
//            )))->count();
//        $counts['yuyue'] = (int) D('Shopyuyue')->where(array(
//                    'shop_id' => $this->shop_id,
//                    'create_time' => array(
//                        array('ELT', NOW_TIME),
//                        array('EGT', $bg_time),
//            )))->count();
//
//
//        $counts['today_coupon'] = (int) D('Coupondownload')->where(array(
//                    'shop_id' => $this->shop_id,
//                    'create_time' => array(
//                        array('ELT', NOW_TIME),
//                        array('EGT', $bg_time),
//            )))->count();
//        $counts['coupon'] = (int) D('Coupondownload')->where(array(
//                    'shop_id' => $this->shop_id,
//                ))->count();
//        $counts['dianping'] = (int) D('Shopdianping')->where(array(
//                    'shop_id' => $this->shop_id,
//                ))->count();
//
//        $counts['orderby'] = (int) D('Shop')->where(array(
//                    'ranking' => array(
//                        'EGT', $this->shop['ranking']
//                    )
//                ))->count();
//
//        $this->assign('counts', $counts);
//
//        /* 统计抢购 */
//        $bg_date = date('Y-m-d', NOW_TIME - 86400 * 6);
//        $end_date = TODAY;
//        $bg_time = strtotime($bg_date);
//        $end_time = strtotime($end_date);
//        $this->assign('bg_date', $bg_date);
//        $this->assign('end_date', $end_date);
//        $this->assign('money', D('Tuanorder')->money($bg_time, $end_time, $this->shop_id));
//        $this->assign('ordermoney', D('Order')->money($bg_time, $end_time, $this->shop_id));
//        $this->assign('shopmoney', D('Shopmoney')->money($bg_time, $end_time, $this->shop_id));
//        $this->display();
//    }

    public function main(){
        $proxy_id = (int)$this->proxy_id;
        //根据代理商编号获取所有商家信息
        $shop_ids = array();
        $shop_where['proxy_id'] = $proxy_id;
        $ShopList = D('Shop')->where($shop_where)->select();
        foreach ($ShopList as $key => $val){
            $shop_ids[] = $val['shop_id'];
        }
        $startt = date('Y-m-d H:i:s',time()-604800);
        $endt = date('Y-m-d H:i:s',time());
        $where['shop_id'] = array('in',$shop_ids);
        $where['status'] = array('in',array(1,2,3));
        $where['created_at'] = array('between',array($startt,$endt));
        $sevenc = (int)D('Order')->where($where)->count();//近七日订单量
        $ctime = time()-259200;
        $this->assign('sevenc',$sevenc);
        //$goods_map['g.closed'] = 0;
        $goods_map['g.is_delete'] = 0;
        $goods_map['g.status'] = 4;
        $goods_map['g.shop_id'] = array('in',$shop_ids);
        $goods_map['o.status'] = array('in',array(1,2,3));
        //sum1 已结算  sum2 冻结金额 sum3 可结算金额 sum4 总金额
        $arr = D('Goods')->alias('g')
            ->join('practice_order_goods as og on og.goods_id = g.goods_id','left')
            ->join('practice_order as o on o.order_id = og.order_id','left')
            ->field('sum(case when o.`status` in ("1","2","3") then o.total_price else 0 end)as sum4,
            sum(case when o.`status` = 3 and o.is_balance = 0 and check_time < '.$ctime.' then o.total_price else 0 end)as sum3,
            sum(case when o.`status` in ("1","2","3") and (o.created_at between "'.$startt.'"and "'.$endt.'") then o.total_price else 0 end)as sum1')
            ->where($goods_map)->find();
        $this->assign('sum',$arr);
        $whereg['shop_id'] = array('in',$shop_ids);
        $whereg['status'] = 4;
        $whereg['is_delete'] = 0;
        //$whereg['closed'] = 0;
        $goods = D('Goods')->where($whereg)->field('goods_id,title,goods_type,max_num')->limit(4)->order('created_at desc')->select();
        foreach($goods as $key=>$value){
            $wheres['og.goods_id'] = $value['goods_id'];
            $wheres['o.status'] = array('in',array(1,2,3));
            $count = D('Order')->alias(o)
                ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                ->where($wheres)
                ->count();
            $goods[$key]['count'] = $count;
            if($value['goods_type'] == 2){
                $goods[$key]['difference'] = $value['max_num'] - $count;
            }
        }
        $ktime = time()-259200;
        //$kgoods_map['g.closed'] = 0;
        $kgoods_map['g.is_delete'] = 0;
        $kgoods_map['g.status'] = 4;
        $kgoods_map['g.shop_id'] = array('in',$shop_ids);
        $kgoods = D('Goods')->alias('g')
            ->field('g.goods_id,g.title,
                (SELECT sum(case when o.`status`=3 and o.is_balance=0 and o.check_time<'.$ktime.' then o.total_price else 0 end) from practice_order as o
                left join practice_order_goods as og on og.order_id = o.order_id
                where og.goods_id = g.goods_id)as sum')
            ->where($kgoods_map)->limit(4)->select();
        $this->assign('kgoods',$kgoods);
        $this->assign('goods',$goods);
        $this->display();
    }

}
