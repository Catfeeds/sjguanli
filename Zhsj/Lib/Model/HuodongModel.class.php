<?php


class HuodongModel extends CommonModel {
    protected $pk = 'huodong_id';
    protected $tableName = 'huodong';

 public function getHuoCate(){
        return array(
            '1' => '约吃饭',
            '2' => '约看电影',
            '3' => '约K歌',
            '4' => '约游玩',
        );
    }
    public function getPeopleCate(){
       return array(
         '1'=>'女生',
         '2'=>'男生',
         '3'=>'不限',
     );
    }
}