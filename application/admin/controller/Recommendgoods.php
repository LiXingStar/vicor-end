<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Recommendgoods extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
         $data  = $this->request->get();
         $cid = $data['typeid'];
         $gid = $data['gid'];
         $sdata = [];
         if($cid){
             $sdata['cid'] = $cid;
         }
         $sdata['gid'] = ['<>',$gid];
         $recommendGoods = Db::table('goods')->where($sdata)->order('gid','desc')
             ->limit(0,4)
             ->select();

         if($recommendGoods){
             return  json([
                'code'=>config('code.success'),
                'msg'=>'商品获取成功',
                'data'=>$recommendGoods
             ]);
         }else{
             return  json([
                 'code'=>config('code.success'),
                 'msg'=>'暂无数据',
                 'data'=>[]
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
