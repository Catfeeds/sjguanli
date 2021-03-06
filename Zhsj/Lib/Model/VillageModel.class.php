<?php



class VillageModel extends CommonModel {

    protected $pk = 'village_id';
    protected $tableName = 'village';
    protected $token = 'village';
    protected $orderby = array('orderby' => 'asc');

    public function _format($data) {
        static $area = null;
        if ($area == null) {
            $area = D('Area')->fetchAll();
        }
        $data['area_name'] = $area[$data['area_id']]['area_name'];
        return $data;
    }

    
}
