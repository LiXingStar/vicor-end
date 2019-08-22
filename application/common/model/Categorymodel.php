<?php


namespace app\common\model;


use think\Model;

class Categorymodel extends Model
{
    protected  $table = 'category';
    function querys(){
        return $this->order('cid','asc')->select();
    }
    function queryone($data){
        return $this->where($data)->find();
    }
    function deletes($cid){
        return $this->where('cid',$cid)->delete();
    }
    function updates($data,$cid){
        return $this->isUpdate(true)->where('cid',$cid)->save($data);
    }
    function inserts($data){
        return $this->isUpdate(false)->allowField(true)->save($data);
    }
}
