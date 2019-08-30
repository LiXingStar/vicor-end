<?php


namespace app\common\model;


use think\Model;

class Usermodel  extends Model
{
  protected $table= 'users';
  protected $autoWriteTimestamp=true;
  public function inserts($data){
      return $this->isUpdate(false)->save($data);
  }
}
