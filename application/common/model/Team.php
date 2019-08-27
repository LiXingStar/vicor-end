<?php


namespace app\common\model;


use think\Model;

class Team extends Model
{
  protected $autoWriteTimestamp = true;
  function inserts($data){
      return $this->isUpdate(false)->allowField(true)->save($data);
  }
  function  queryone($id){
      return $this->where('id',$id)->field('id,tname,avatar,des,exp,cid')->find();
  }
  function queryone1($data){
      return $this->where($data)->find();
  }
}
