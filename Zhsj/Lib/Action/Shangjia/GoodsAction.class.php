<?php



class GoodsAction extends CommonAction {

    private $create_fields = array('title', 'photo', 'cate_id', 'intro','guige', 'num','select1', 'select2', 'select3', 'select4', 'select5','price', 'shopcate_id', 'mall_price','use_integral','commission', 'instructions', 'details', 'end_date','is_vs1','is_vs2','is_vs3','is_vs4','is_vs5',
	'is_vs6',);
    private $edit_fields = array('title', 'photo', 'cate_id', 'intro','guige', 'num','select1', 'select2', 'select3', 'select4', 'select5','price', 'shopcate_id', 'mall_price','use_integral','commission', 'instructions', 'details', 'end_date','is_vs1','is_vs2','is_vs3','is_vs4','is_vs5',
	'is_vs6',);

    public function _initialize() {
        parent::_initialize();
        $this->autocates = D('Goodsshopcate')->where(array('shop_id' => $this->shop_id))->select();
        $this->assign('autocates', $this->autocates);
    }

    /*
     * 首页
     */
    public function index() {
        $type = I('get.type',0);
        $this->assign('type', $type);
        $Goods = D('Goods');
        import('ORG.Util.Page'); // 导入分页类
        $map['shop_id'] = $this->shop_id;
        $tt = 0;//用于时间已结束判断
        $de = 0;//用于判断回收站
        if($type == 99){
            $map['is_delete'] = 1;//回收站
            $de = 1;
        }else{
            $map = array('closed' => 0, 'shop_id' => $this->shop_id, 'is_mall' => 1);
            if($type == 1) $map['status'] = 1;//编辑中
            if($type == 2) $map['status'] = 2;//待审核
            if($type == 3) $map['status'] = 3;//审核不通过
            if($type == 4) $map['status'] = 4;//已发布
            if($type == 88){//已结束
                $map['status'] = 4;
                $map['end_time'] = array('elt',time());
                $tt = 1;
            }
            $map['is_delete'] = 0;//回收站
        }
        $count = $Goods->where($map)->count(); // 查询满足要求的总记录数 
        $Page = new Page($count, $this->listRows); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        $list = $Goods->where($map)->order(array('goods_id' => 'desc'))->limit($Page->firstRow . ',' . $Page->listRows)->select();
        foreach ($list as $k => $val) {
            $wheres['og.goods_id'] = $val['goods_id'];
            $wheres['o.status'] = array('in',array(1,2,3));
            $count = D('Order')->alias(o)
                ->join('practice_order_goods as og on og.order_id = o.order_id','left')
                ->where($wheres)
                ->count();
            if ($val['shop_id']) {
                $shop_ids[$val['shop_id']] = $val['shop_id'];
            }
            $list[$k] = $val;
            $list[$k]['count'] = $count;
        }
        if ($shop_ids) {
            $this->assign('shops', D('Shop')->itemsByIds($shop_ids));
        }
        $this->assign('cates', D('Goodscate')->fetchAll());
        $this->assign('tt',$tt);
        $this->assign('de',$de);
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display(); // 输出模板
    }

    public function get_select() {
        if (IS_AJAX) {
            $pid = I('pid', 0, 'intval,trim');
            $gc = D('GoodsCate');
            $list = $gc->where('parent_id =' . $pid)->select();
            if ($pid == 0) {
                $this->ajaxReturn(array('status' => 'success', 'list' => ''));
            }
            if ($list) {
                $l = '';
                foreach ($list as $k => $v) {
                    $l = $l . '<option value=' . $v['cate_id'] . ' style="color:#333333;">' . $v['cate_name'] . '</option>';
                }
                $this->ajaxReturn(array('status' => 'success', 'list' => $l));
            }
        }
    }

    /*
     * 发布活动
     */
    public function createadd(){
        $posts = $this->_post();
        if (empty($posts['status_type'])) $this->baoError('非法参数');
        $data['status'] = $posts['status_type'];
        if (empty($posts['goods_type'])) $this->baoError('非法参数');
        $data['goods_type'] = $posts['goods_type'];
        if (empty($posts['com_type'])) $this->baoError('请选择所属活动分类');
        $data['com_type'] = $posts['com_type'];
        $posts['title'] = htmlspecialchars($posts['title']);
        if (empty($posts['title'])) $this->baoError('活动名称不能为空');
        $detail = D('Goods')->where(array('title'=>$posts['title'],'is_delete'=>0))->getField('title');
        if ($detail) $this->baoError('活动名称已经存在');
        $data['title'] = $posts['title'];
        $count = count($posts['ability_type']);
        if($count == 0) $this->baoError('请选择能力培养');
        $ability_type = $posts['ability_type'];
        $str = '';
        foreach($ability_type as $key=>$value){
            if($count == ($key+1)){
                $str .=$value;
            }else{
                $str .=$value.',';
            }
        }
        $data['ability_type'] = $str;
        $photo = htmlspecialchars($posts['photo']);
        if (empty($photo)) $this->baoError('请上传缩略图');
        if (!isImage($photo)) $this->baoError('缩略图格式不正确');
        $data['photo'] = $photo;
        $banner1 = htmlspecialchars($posts['banner1']);
        $banner2 = htmlspecialchars($posts['banner2']);
        $banner3 = htmlspecialchars($posts['banner3']);
        if(!$banner1 && !$banner2 && !$banner3) $this->baoError('请上传详情banner广告图(至少一张)');
        $flow = SecurityEditorHtml($posts['flow']);
        if (empty($flow)) $this->baoError('活动流程不能为空');
        if ($words = D('Sensitive')->checkWords($flow)) $this->baoError('活动流程含有敏感词：' . $words);
        $data['flow'] = $flow;
        $details = SecurityEditorHtml($posts['details']);
        if (empty($details)) $this->baoError('活动详情不能为空');
        if ($words = D('Sensitive')->checkWords($details)) $this->baoError('活动详情含有敏感词：' . $words);
        $data['details'] = $details;
        $mall_price = (int)($posts['mall_price']);
        if (empty($mall_price)) $this->baoError('市场价格不能为空');
        $data['mall_price'] = $mall_price;
        $price = (int)($posts['price']);
        if (empty($price)) $this->baoError('活动价格不能为空');
        $data['price'] = $price;
        $settlement_price = (int)($posts['settlement_price']);
        if (empty($settlement_price)) $this->baoError('结算价格不能为空');
        if ($settlement_price >= $price) $this->baoError('结算价格必须小于活动价格');
        $data['settlement_price'] = $settlement_price;
        if ($posts['goods_type'] == 2){//当活动为团体活动的时候
            if($posts['nolimit']){
                $data['max_num'] = 0;//最大人数
                $data['min_num'] = 0;//最小人数
            }else{
                $data['max_num'] = $posts['max_num'];//最大人数
                $data['min_num'] = $posts['min_num'];//最小人数
            }
        }
        if (empty($posts['start_time'])) $this->baoError('请选择开始时间');
        $data['start_time'] = strtotime($posts['start_time']);
        if (empty($posts['end_time'])) $this->baoError('请选择结束时间');
        $data['end_time'] = strtotime($posts['end_time']);
        if ($posts['finaly_time']) $data['finaly_time'] = strtotime($posts['finaly_time']);//报名截止时间
        $scount = count($posts['suit_type']);
        if($scount == 0) $this->baoError('请选择适学学段');
        $suit_type = $posts['suit_type'];
        $strs = '';
        foreach($suit_type as $key=>$value){
            if($scount == ($key+1)){
                $strs .=$value;
            }else{
                $strs .=$value.',';
            }
        }
        $data['suit_type'] = $strs;
        $use_detail = SecurityEditorHtml($posts['use_detail']);
        if (empty($use_detail)) $this->baoError('使用说明不能为空');
        if ($words = D('Sensitive')->checkWords($use_detail)) $this->baoError('使用说明含有敏感词：' . $words);
        $data['use_detail'] = $use_detail;
        if (empty($posts['refund_type'])) $this->baoError('请选择退款规则');
        $data['refund_type'] = $posts['refund_type'];
        $refund_detail = SecurityEditorHtml($posts['refund_detail']);
        if (empty($refund_detail)) $this->baoError('退款说明不能为空');
        if ($words = D('Sensitive')->checkWords($refund_detail)) $this->baoError('退款说明含有敏感词：' . $words);
        $data['refund_detail'] = $posts['refund_detail'];
        if (empty($posts['phone'])){
            $data['phone'] = D('Shop')->where(array('shop_id'=>$this->shop_id))->getField('mobile');
        }else{
            $data['phone'] = $posts['phone'];
        }
        if ($posts['business_start']) $data['business_start'] = $posts['business_start'];//营业开始时间
        if ($posts['business_end']) $data['business_end'] = $posts['business_end'];//营业结束时间
        if (empty($posts['province'])) $this->baoError('请选择省份');
        $data['province'] = $posts['province'];
        if (empty($posts['city'])) $this->baoError('请选择城市');
        $data['city'] = $posts['city'];
        if (empty($posts['area'])) $this->baoError('请选择地区');
        $data['area'] = $posts['area'];
        if (empty($posts['address'])) $this->baoError('请填写地址');
        $data['address'] = $posts['address'];
        if (empty($posts['latandlng'])) $this->baoError('请选择经纬度');
        $latandlngs = explode(';',$posts['latandlng']);
        $data['longitude'] = $latandlngs[0];
        $data['latitude'] = $latandlngs[1];
        $traffic_info = SecurityEditorHtml($posts['traffic_info']);
        if (empty($traffic_info)) $this->baoError('交通信息不能为空');
        if ($words = D('Sensitive')->checkWords($traffic_info)) $this->baoError('交通信息有敏感词：' . $words);
        $data['traffic_info'] = $traffic_info;
        $notice = SecurityEditorHtml($posts['notice']);
        if ($notice){
            if ($words = D('Sensitive')->checkWords($notice)) $this->baoError('交通信息有敏感词：' . $words);
            $data['notice'] = $notice;
        }
        $data['shop_id'] = $this->shop_id;
        $data['created_at'] = date('Y-m-d H:i:s',time());//发布时间
        $data['create_ip'] = get_client_ip();//发布人IP
        $data['sold_num'] = 0;
        $data['views'] = 0;
        M()->startTrans();//开启事务
        $goods_id = D('Goods')->add($data);
        if (!$goods_id){
            M()->rollback();
            $this->baoError('添加失败');
        }
        $bstr = 'banner';
        for($i=0;$i<3;$i++){
            $x = $bstr.($i+1);
            if($$x){
                $result = D('Goodsphoto')->add(array('photo'=>$$x,'goods_id'=>$goods_id,'sort'=>$i+1));
                if($result === false){
                    M()->rollback();
                    $this->baoError('添加失败');
                }
            }
        }
        M()->commit();
        $this->baoSuccess('操作成功', U('goods/index'));
    }

    /*
     * 活动删除
     */
    public function deletes(){
        $goods_id = I('post.goods_id');//活动id
        if(!$goods_id) $this->ajaxReturn(array('code'=>0,'msg'=>'活动参数无效!'));
        $where['goods_id'] = $goods_id;
        $data['is_delete'] = 1;
        $result = D('Goods')->where($where)->save($data);
        if($result !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }

    /*
     * 活动复制
     */
    public function copys(){
        $goods_id = I('post.goods_id');
        $goodsinfo = D('Goods')->where(array('goods_id'=>$goods_id))->find();
        $photos = D('Goodsphoto')->where(array('goods_id'=>$goods_id))->select();
        $goodsinfo['created_at'] = date('Y-m-d H:i:s',time());
        $goodsinfo['create_ip'] = get_client_ip();
        $goodsinfo['view'] = 0;
        $goodsinfo['status'] = 1;
        unset($goodsinfo['updated_at']);
        unset($goodsinfo['goods_id']);
        M()->startTrans();
        $id = D('Goods')->add($goodsinfo);
        if($id !== false){
            foreach($photos as $key =>$value){
                $arrs['goods_id'] = $id;
                $arrs['sort'] = $value['sort'];
                $arrs['photo'] = $value['photo'];
                $result = D('Goodsphoto')->add($arrs);
                if($result === false){
                    M()->rollback();
                    $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
                }
            }
            M()->commit();
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            M()->rollback();
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }

    /*
     * 恢复
     */
    public function recovers(){
        $goods_id = I('post.goods_id');
        $data['is_delete'] = 0;
        $data['status'] = 1;
        $result = D('Goods')->where(array('goods_id'=>$goods_id))->save($data);
        if($result !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }

    /*
     * 取消申请
     */
    public function returnedits(){
        $goods_id = I('post.goods_id');
        $data['status'] = 1;//将待审核状态变成编辑中
        $result = D('Goods')->where(array('goods_id'=>$goods_id))->save($data);
        if($result !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'操作成功!'));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'操作失败!'));
        }
    }

    /*
     * 活动类型
     */
    public function chosetype(){
        $this->display();
    }

    /*
     * 团体活动
     */
    public function creategroup(){
        $abilitys = ability_arrs();
        $province = D('Commondistrict')->where(array('level'=>1,'upid'=>0))->select();
        $this->assign('cates', D('Goodscate')->fetchAll());
        $this->assign('abilitys',$abilitys);
        $this->assign('province',$province);
        $this->display();
    }

    /*
     * 票务活动
     */
    public function createticket(){
        $abilitys = ability_arrs();
        $province = D('Commondistrict')->where(array('level'=>1,'upid'=>0))->select();
        $this->assign('cates', D('Goodscate')->fetchAll());
        $this->assign('abilitys',$abilitys);
        $this->assign('province',$province);
        $this->display();
    }

    /*
     * 编辑活动页面
     */
    public function editgoods(){
        $goods_type = I('get.goods_type');//获取活动类型
        $goods_id = I('get.goods_id');//活动id
        $status = D('Goods')->where(array('goods_id'=>$goods_id))->getField('status');
        if($status != 1 && $status !=3) $this->baoError('非法操作');
        $goods_info = D('Goods')->where(array('goods_id'=>$goods_id))->find();
        $citys = D('Commondistrict')->where(array('level'=>2,'upid'=>$goods_info['province']))->select();
        $areas = D('Commondistrict')->where(array('level'=>3,'upid'=>$goods_info['city']))->select();
        $this->assign('citys',$citys);
        $this->assign('areas',$areas);
        $abis = explode(',',$goods_info['ability_type']);
        $abis1 = $abis2 = $abis3 = 0;
        if($abis[0]) $abis1 = $abis[0];
        if($abis[1]) $abis2 = $abis[1];
        if($abis[2]) $abis3 = $abis[2];
        $this->assign('abis1',$abis1);
        $this->assign('abis2',$abis2);
        $this->assign('abis3',$abis3);
        $suits = explode(',',$goods_info['suit_type']);
        $suits1 = $suits2 = $suits3 = $suits4 = 0;
        if($suits[0]) $suits1 = $suits[0];
        if($suits[1]) $suits2 = $suits[1];
        if($suits[2]) $suits3 = $suits[2];
        if($suits[3]) $suits4 = $suits[3];
        $this->assign('abis1',$abis1);
        $this->assign('abis2',$abis2);
        $this->assign('abis3',$abis3);
        $this->assign('suits1',$suits1);
        $this->assign('suits2',$suits2);
        $this->assign('suits3',$suits3);
        $this->assign('suits4',$suits4);
        $photo_info = D('Goodsphoto')->where(array('goods_id'=>$goods_id))->select();//banner轮播图
        $banner1 = $banner2 = $banner3 = '';
        foreach($photo_info as $key=>$value){
            if($value['sort'] == 1) $banner1 = $value['photo'];
            if($value['sort'] == 2) $banner2 = $value['photo'];
            if($value['sort'] == 3) $banner3 = $value['photo'];
        }
        $this->assign('banner1',$banner1);
        $this->assign('banner2',$banner2);
        $this->assign('banner3',$banner3);
        $abilitys = ability_arrs();
        $province = D('Commondistrict')->where(array('level'=>1,'upid'=>0))->select();
        $latandlng = $goods_info['longitude'].';'.$goods_info['latitude'];
        $this->assign('cates', D('Goodscate')->fetchAll());
        $this->assign('latandlng',$latandlng);
        $this->assign('abilitys',$abilitys);
        $this->assign('province',$province);
        $this->assign('info',$goods_info);
        $this->assign('goods_id',$goods_id);
        if($goods_type == 1) $this->display('editticket');//票务活动
        if($goods_type == 2) $this->display('editgroup');//团体活动
    }

    public function editsave(){
        $posts = $this->_post();
        if (empty($posts['goods_id'])) $this->baoError('非法操作');
        $where['goods_id'] = $posts['goods_id'];
        if (empty($posts['status_type'])) $this->baoError('非法参数');
        $data['status'] = $posts['status_type'];
        if (empty($posts['goods_type'])) $this->baoError('非法参数');
        $data['goods_type'] = $posts['goods_type'];
        if (empty($posts['com_type'])) $this->baoError('请选择所属活动分类');
        $data['com_type'] = $posts['com_type'];
        $posts['title'] = htmlspecialchars($posts['title']);
        if (empty($posts['title'])) $this->baoError('活动名称不能为空');
        $detail = D('Goods')->where(array('title'=>$posts['title'],'is_delete'=>0,'goods_id'=>array('neq',$posts['goods_id'])))->getField('title');
        if ($detail) $this->baoError('活动名称已经存在');
        $data['title'] = $posts['title'];
        $count = count($posts['ability_type']);
        if($count == 0) $this->baoError('请选择能力培养');
        $ability_type = $posts['ability_type'];
        $str = '';
        foreach($ability_type as $key=>$value){
            if($count == ($key+1)){
                $str .=$value;
            }else{
                $str .=$value.',';
            }
        }
        $data['ability_type'] = $str;
        $photo = htmlspecialchars($posts['photo']);
        if (empty($photo)) $this->baoError('请上传缩略图');
        if (!isImage($photo)) $this->baoError('缩略图格式不正确');
        $data['photo'] = $photo;
        $banner1 = htmlspecialchars($posts['banner1']);
        $banner2 = htmlspecialchars($posts['banner2']);
        $banner3 = htmlspecialchars($posts['banner3']);
        if(!$banner1 && !$banner2 && !$banner3) $this->baoError('请上传详情banner广告图(至少一张)');
        $flow = SecurityEditorHtml($posts['flow']);
        if (empty($flow)) $this->baoError('活动流程不能为空');
        if ($words = D('Sensitive')->checkWords($flow)) $this->baoError('活动流程含有敏感词：' . $words);
        $data['flow'] = $flow;
        $details = SecurityEditorHtml($posts['details']);
        if (empty($details)) $this->baoError('活动详情不能为空');
        if ($words = D('Sensitive')->checkWords($details)) $this->baoError('活动详情含有敏感词：' . $words);
        $data['details'] = $details;
        $mall_price = (int)($posts['mall_price']);
        if (empty($mall_price)) $this->baoError('市场价格不能为空');
        $data['mall_price'] = $mall_price;
        $price = (int)($posts['price']);
        if (empty($price)) $this->baoError('活动价格不能为空');
        $data['price'] = $price;
        $settlement_price = (int)($posts['settlement_price']);
        if (empty($settlement_price)) $this->baoError('结算价格不能为空');
        if ($settlement_price >= $price) $this->baoError('结算价格必须小于活动价格');
        $data['settlement_price'] = $settlement_price;
        if ($posts['goods_type'] == 2){//当活动为团体活动的时候
            if($posts['nolimit']){
                $data['max_num'] = 0;//最大人数
                $data['min_num'] = 0;//最小人数
            }else{
                $data['max_num'] = $posts['max_num'];//最大人数
                $data['min_num'] = $posts['min_num'];//最小人数
            }
        }
        if (empty($posts['start_time'])) $this->baoError('请选择开始时间');
        $data['start_time'] = strtotime($posts['start_time']);
        if (empty($posts['end_time'])) $this->baoError('请选择结束时间');
        $data['end_time'] = strtotime($posts['end_time']);
        if ($posts['finaly_time']) $data['finaly_time'] = strtotime($posts['finaly_time']);//报名截止时间
        $scount = count($posts['suit_type']);
        if($scount == 0) $this->baoError('请选择适学学段');
        $suit_type = $posts['suit_type'];
        $strs = '';
        foreach($suit_type as $key=>$value){
            if($scount == ($key+1)){
                $strs .=$value;
            }else{
                $strs .=$value.',';
            }
        }
        $data['suit_type'] = $strs;
        $use_detail = SecurityEditorHtml($posts['use_detail']);
        if (empty($use_detail)) $this->baoError('使用说明不能为空');
        if ($words = D('Sensitive')->checkWords($use_detail)) $this->baoError('使用说明含有敏感词：' . $words);
        $data['use_detail'] = $use_detail;
        if (empty($posts['refund_type'])) $this->baoError('请选择退款规则');
        $data['refund_type'] = $posts['refund_type'];
        $refund_detail = SecurityEditorHtml($posts['refund_detail']);
        if (empty($refund_detail)) $this->baoError('退款说明不能为空');
        if ($words = D('Sensitive')->checkWords($refund_detail)) $this->baoError('退款说明含有敏感词：' . $words);
        $data['refund_detail'] = $posts['refund_detail'];
        if (empty($posts['phone'])){
            $data['phone'] = D('Shop')->where(array('shop_id'=>$this->shop_id))->getField('mobile');
        }else{
            $data['phone'] = $posts['phone'];
        }
        if ($posts['business_start']) $data['business_start'] = $posts['business_start'];//营业开始时间
        if ($posts['business_end']) $data['business_end'] = $posts['business_end'];//营业结束时间
        if (empty($posts['province'])) $this->baoError('请选择省份');
        $data['province'] = $posts['province'];
        if (empty($posts['city'])) $this->baoError('请选择城市');
        $data['city'] = $posts['city'];
        if (empty($posts['area'])) $this->baoError('请选择地区');
        $data['area'] = $posts['area'];
        if (empty($posts['address'])) $this->baoError('请填写地址');
        $data['address'] = $posts['address'];
        if (empty($posts['latandlng'])) $this->baoError('请选择经纬度');
        $latandlngs = explode(';',$posts['latandlng']);
        $data['longitude'] = $latandlngs[0];
        $data['latitude'] = $latandlngs[1];
        $traffic_info = SecurityEditorHtml($posts['traffic_info']);
        if (empty($traffic_info)) $this->baoError('交通信息不能为空');
        if ($words = D('Sensitive')->checkWords($traffic_info)) $this->baoError('交通信息有敏感词：' . $words);
        $data['traffic_info'] = $traffic_info;
        $notice = SecurityEditorHtml($posts['notice']);
        if ($notice){
            if ($words = D('Sensitive')->checkWords($notice)) $this->baoError('交通信息有敏感词：' . $words);
            $data['notice'] = $notice;
        }
        $data['updated_at'] = date('Y-m-d H:i:s',time());//更新时间
        M()->startTrans();//开启事务
        $result = D('Goods')->where($where)->save($data);
        if ($result === false){
            M()->rollback();
            $this->baoError('编辑失败');
        }
        $bstr = 'banner';
        for($i=0;$i<3;$i++){
            $x = $bstr.($i+1);
            if($$x){
                $result = D('Goodsphoto')->where(array('sort'=>$i+1,'goods_id'=>$posts['goods_id']))->save(array('photo'=>$$x));
                if($result === false){
                    M()->rollback();
                    $this->baoError('编辑失败');
                }
            }
        }
        M()->commit();
        $this->baoSuccess('操作成功', U('goods/index'));

    }
    /*
     * 省市区数据
     */
    public function obtains(){
        $uid = I('post.uid');
        $type = I('post.type');
        if(!$uid)$this->ajaxReturn(array('code'=>0,'msg'=>'参数无效!'));
        if(!$type)$this->ajaxReturn(array('code'=>0,'msg'=>'参数无效!'));
        $where['upid'] = $uid;
        $where['level'] = $type + 1;
        $info = D('Commondistrict')->where($where)->field('id,name')->select();
        if($type == 1) $str = '<option value="0">市级</option>'.'\n\r';
        if($type == 2) $str = '<option value="0">区/县</option>'.'\n\r';
        foreach($info as $key=>$value){
            $str.='<option value="'.$value['id'].'">'.$value['name'].'</option>'.'\n\r';
        }
        if($info !== false){
            $this->ajaxReturn(array('code'=>1,'msg'=>'获取成功!','data'=>$str));
        }else{
            $this->ajaxReturn(array('code'=>0,'msg'=>'获取失败!'));
        }
    }

}
