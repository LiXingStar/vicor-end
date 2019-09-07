<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Request;

class Collect extends Controller
{
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        checkJWT();
    }


    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        $uid = $this->request->id;
        $collection = Db::table('users')->field('collect')->where('uid',$uid)->find();
        if($collection['collect']){
           $result =  Db::table('goods')->where('gid','in',$collection['collect'])->field('gid,gthumb,gname,gename,price,create_time,gtype')->select();
           return json([
               'code'=>config('code.success'),
               'msg'=>'收藏获取成功',
               'data'=>$result
           ]);
        }else{
            return json([
                'code'=>config('code.success'),
                'msg'=>'暂无收藏'
            ]);
        }
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
