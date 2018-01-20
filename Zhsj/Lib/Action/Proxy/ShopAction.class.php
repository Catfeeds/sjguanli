<?php



class ShopAction extends CommonAction {

    /*
     * 商家列表
     * */
    public function index() {
        $status = (int)I('get.status',-1);
        $this->assign('status', $status);
        $proxy_id = (int)$this->proxy_id;
        $Shop = D('Shop');
        import('ORG.Util.Page'); // 导入分页类
        $map = array('proxy_id' => $proxy_id);
        if ($cate_id = (int) $this->_param('cate_id')) {
            $map['cate_id'] = array('IN', D('Shopcate')->getChildren($cate_id));
            $this->assign('cate_id', $cate_id);
        }
        if($status >= 0){
            $map['status'] = $status;
        }
        $count = $Shop->where($map)->count(); // 查询满足要求的总记录数
        $Page = new Page($count, $this->listRows); // 实例化分页类 传入总记录数和每页显示的记录数
        $show = $Page->show(); // 分页显示输出
        //商家状态（0：待审核；1：审核不通过；2：已开通；3：已关闭）
        $status_arr = array(0 => '待审核', 1 => '审核不通过', 2 => '已开通', 3 => '已关闭');
        $list = $Shop->order(array('shop_id' => 'desc'))->where($map)->limit($Page->firstRow . ',' . $Page->listRows)->select();
        foreach ($list as $k => $val) {
            $list[$k]['goods_num'] = M('goods')->where(array('shop_id'=>$val['shop_id']))->count();     //活动数量
            $list[$k]['order_num'] = M('order')->where(array('shop_id'=>$val['shop_id']))->count();;     //订单数量
            $list[$k]['status_name'] = $status_arr[$val['status']];     //订单数量
        }
        $this->assign('list', $list); // 赋值数据集
        $this->assign('page', $show); // 赋值分页输出
        $this->display(); // 输出模板
    }

    /*
     * 关闭商家
     * */
    public function closeshop() {
        $shop_id = (int)I('post.shop_id');
        if (is_numeric($shop_id) && $shop_id <= 0) {
            $this->ajaxReturn(array('code'=>0,'msg'=>'请选择要关闭的商家!'));
        }
        $obj = D('Shop');
        $obj->save(array('shop_id' => $shop_id, 'status' => 3));
        $this->ajaxReturn(array('code'=>1,'msg'=>'关闭成功！'));
    }

    /*
     * 取消申请
     * */
    public function cancelapply() {
        $shop_id = (int)I('post.shop_id');
        if (is_numeric($shop_id) && $shop_id <= 0) {
            $this->ajaxReturn(array('code'=>0,'msg'=>'请选择要取消申请的商家!'));
        }
        $obj = D('Shop');
        $obj->save(array('shop_id' => $shop_id, 'status' => 3));
        $this->ajaxReturn(array('code'=>1,'msg'=>'取消申请成功！'));
    }

    /*
     * 创建商家
     * */
    public function create() {
        if ($this->isPost()) {
            $posts = $this->_post();
            //资源单位名称
            $posts['shop_name'] = htmlspecialchars($posts['shop_name']);
            if (empty($posts['shop_name'])) {
                $this->baoError('资源单位名称不能为空');
            }
            $data['shop_name'] = $posts['shop_name'];
            //LOGO图
            $logo = htmlspecialchars($posts['logo']);
            if (empty($logo)) {
                $this->baoError('请上传LOGO图');
            }
            if (!isImage($logo)) {
                $this->baoError('LOGO图格式不正确');
            }
            $data['logo'] = $logo;
            //营业执照
            $business_license = htmlspecialchars($posts['business_license']);
            if (empty($business_license)) {
                $this->baoError('请上传营业执照');
            }
            if (!isImage($business_license)) {
                $this->baoError('营业执照格式不正确');
            }
            $data['business_license'] = $business_license;
            //资源单位电话
            $area_code = $posts['area_code'];       //区号
            $seat_number = $posts['seat_number'];   //联系电话
            if(!empty($area_code) && !empty($seat_number)){
                $contact_number = $area_code . '-' . $seat_number;
                $data['contact_number'] = $contact_number;
            }
            //营业时间
            if ($posts['business_start']) $data['business_start'] = $posts['business_start'];//营业开始时间
            if ($posts['business_end']) $data['business_end'] = $posts['business_end'];//营业结束时间
            //区域信息
            if (empty($posts['province'])) {
                $this->baoError('请选择省份');
            }
            $data['province'] = $posts['province'];
            if (empty($posts['city'])) {
                $this->baoError('请选择城市');
            }
            $data['city'] = $posts['city'];
            if (empty($posts['area'])) {
                $this->baoError('请选择地区');
            }
            $data['area'] = $posts['area'];
            if (empty($posts['addr'])) {
                $this->baoError('请填写地址');
            }
            $data['addr'] = $posts['addr'];
            //经纬度
            if (empty($posts['latitude_longitude'])) {
                $this->baoError('请选择经纬度');
            }
            $latandlngs = explode(';',$posts['latitude_longitude']);
            $data['lng'] = $latandlngs[0];
            $data['lat'] = $latandlngs[1];
            //交通信息
            $traffic_info = SecurityEditorHtml($posts['traffic_info']);
            if (empty($traffic_info)) {
                $this->baoError('交通信息不能为空');
            }
            if ($words = D('Sensitive')->checkWords($traffic_info)) {
                $this->baoError('交通信息有敏感词：' . $words);
            }
            $data['traffic_info'] = $traffic_info;
            //资源单位联系人
            $posts['linkman'] = htmlspecialchars($posts['linkman']);
            if (empty($posts['linkman'])) {
                $this->baoError('联系人不能为空');
            }
            $data['linkman'] = $posts['linkman'];
            $posts['mobile'] = htmlspecialchars($posts['mobile']);
            if (empty($posts['mobile'])) {
                $this->baoError('联系电话不能为空');
            }
            $data['mobile'] = $posts['mobile'];
            //是否具有公益性质
            if ($posts['nature_id']) $data['nature_id'] = $posts['nature_id'];//资源单位性质
            if ($posts['directly_institutions']) $data['directly_institutions'] = $posts['directly_institutions'];//直属机构
            //现场拍摄介绍图
            $banner1 = htmlspecialchars($posts['banner1']);
            $banner2 = htmlspecialchars($posts['banner2']);
            $banner3 = htmlspecialchars($posts['banner3']);
            $banner4 = htmlspecialchars($posts['banner4']);
            $banner5 = htmlspecialchars($posts['banner5']);
            if(!$banner1 && !$banner2 && !$banner3 && !$banner4 && !$banner5){
                $this->baoError('请上传现场拍摄介绍图(至少一张)');
            }
            //安全保障说明
            $safeguards = SecurityEditorHtml($posts['safeguards']);
            if ($safeguards){
                if ($words = D('Sensitive')->checkWords($safeguards)) {
                    $this->baoError('安全保障说明有敏感词：' . $words);
                }
                $data['safeguards'] = $safeguards;
            }
            //资源单位合作框架协议
            $agreement = htmlspecialchars($posts['agreement']);
            if (empty($agreement)) {
                $this->baoError('请上传合作框架协议');
            }
            if (!isImage($agreement)) {
                $this->baoError('合作框架协议格式不正确');
            }
            $data['agreement'] = $agreement;
            $data['proxy_id'] = $this->proxy_id;
            $data['status'] = 0;
            $data['created_at'] = date('Y-m-d H:i:s',time());//发布时间
            M()->startTrans();//开启事务
            //创建资源单位信息
            $shop_id = D('Shop')->add($data);
            if (!$shop_id){
                M()->rollback();
                $this->baoError('申请开通资源单位失败');
            }
            //创建资源单位介绍图片信息
            $bstr = 'banner';
            for( $i = 0;$i < 5;$i++ ){
                $x = $bstr.($i+1);
                if($$x){
                    $result = D('Shopbanner')->add(array('photo'=>$$x,'shop_id'=>$shop_id,'sort'=>$i+1,'created_at'=>date('Y-m-d H:i:s',time())));
                    if($result === false){
                        M()->rollback();
                        $this->baoError('添加资源单位介绍图失败');
                    }
                }
            }
            M()->commit();
            $this->baoSuccess('申请开通资源单位成功', U('shop/index'));
        } else {
            //区域信息
            $province = D('Commondistrict')->where(array('level'=>1,'upid'=>0))->select();
            $this->assign('province',$province);
            //资源单位性质
            $natures = array(1 => '公益',2 => '商业');
            $this->assign('natures',$natures);
            $this->display();
        }
    }

    /*
     * 编辑资源单位
     * */
    public function edit() {
        $shop_id = (int)I('get.shop_id');//资源单位编号
        $op_type = (int)I('get.op_type');//操作类型（1：查看；2：编辑）
        $this->assign('op_type',$op_type);
        //资源单位信息
        $ShopInfo = D('Shop')->where(array('shop_id'=>$shop_id))->find();
        if(!empty($ShopInfo)){
            $contact_number = $ShopInfo['contact_number'];
            if(!empty($ShopInfo['contact_number'])){
                $contact_number_res = explode('-', $contact_number);
                $ShopInfo['area_code'] = $contact_number_res[0];
                $ShopInfo['seat_number'] = $contact_number_res[1];
            }
        }
        //资源单位图片信息
        $photo_info = D('Shopbanner')->where(array('shop_id'=>$shop_id))->select();
        $banner1 = $banner2 = $banner3 = $banner4 = $banner5 = '';
        foreach($photo_info as $key => $value){
            if($value['sort'] == 1) $banner1 = $value['photo'];
            if($value['sort'] == 2) $banner2 = $value['photo'];
            if($value['sort'] == 3) $banner3 = $value['photo'];
            if($value['sort'] == 4) $banner4 = $value['photo'];
            if($value['sort'] == 5) $banner5 = $value['photo'];
        }
        $this->assign('banner1',$banner1);
        $this->assign('banner2',$banner2);
        $this->assign('banner3',$banner3);
        $this->assign('banner4',$banner4);
        $this->assign('banner5',$banner5);
        //区域信息初始化
        $province = D('Commondistrict')->where(array('level'=>1,'upid'=>0))->select();
        $citys = D('Commondistrict')->where(array('level'=>2,'upid'=>$ShopInfo['province']))->select();
        $areas = D('Commondistrict')->where(array('level'=>3,'upid'=>$ShopInfo['city']))->select();
        $this->assign('province',$province);
        $this->assign('citys',$citys);
        $this->assign('areas',$areas);
        //资源单位性质
        $natures = array(
            array('nature_id' => 1, 'nature_name' => '公益'),
            array('nature_id' => 2, 'nature_name' => '商业')
        );
        $this->assign('natures',$natures);

        $this->assign('shop',$ShopInfo);
        $this->display();
    }
    

}
