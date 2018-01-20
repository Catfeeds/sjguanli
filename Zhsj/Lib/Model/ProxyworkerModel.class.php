<?php


class ProxyWorkerModel extends CommonModel{
    protected $pk   = 'proxy_work_id';
    protected $tableName =  'proxy_worker';
	
	public function getUserByMobile($mobile){
        $data = $this->find(array('where'=>array('proxy_mobile'=>$mobile)));
        return $this->_format($data);
    }

  
}