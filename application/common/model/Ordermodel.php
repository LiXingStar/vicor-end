<?php


namespace app\common\model;


use think\Model;

class Ordermodel extends Model
{
   protected $table="orders";
   protected $autoWriteTimestamp=true;
   public function inserts($data){
       $result = $this->isUpdate(false)->allowField(true)->save($data);
       return $result;
   }
}
