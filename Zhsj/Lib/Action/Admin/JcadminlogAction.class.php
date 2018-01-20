<?php

class JcadminlogAction extends CommonAction {

    public function weblogread(){
        $keyword = I('post.keyword');
        $start_time = strtotime(date('Y-m-d',time()));
        $arrs = array();
        $where = array();
        if($keyword) $where['remark'] = array('like','%'.$keyword.'%');
        $info = D('Jcadminlog')->where($where)->order('admin_id_FK')->select();
        foreach($info as $key =>$value){
            $arrs[$value['admin_id_FK']][] = $value;
        }
        $this->assign('arrs',$arrs);
//        echo"<pre>";
//        print_r($arrs);die;
        $this->assign('keyword',$keyword);
        $this->display();
    }
}
