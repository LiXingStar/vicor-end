<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Upload extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
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

        $file = request()->file('file');
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            echo DS.'uploads'.DS.$info->getSaveName();
        }
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
        $data = $this->request->put();
        $srcs = $data['srcs'];
        for($i = 0;$i<count($srcs);$i++){
            $path =UPLOAD_PATH . $srcs[$i];
            if(!file_exists($path)){
                continue;
            }
            unlink($path);
        }

    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        $data = $this->request->get('path');
        // \uploads\20190823\56c8ff3352e07d888d739a3f2840c8e1.webp

        $path =UPLOAD_PATH . $data;
        if(file_exists($path)){
            $result = unlink($path);
            if($result){
                return  json([
                    'code'=>config('code.success'),
                    'msg'=>'文件删除成功'
                ])  ;
            }else{
                return  json([
                    'code'=>config('code.fail'),
                    'msg'=>'文件删除失败'
                ])  ;
            }

        }else{
           return  json([
               'code'=>config('code.fail'),
               'msg'=>'文件不存在'
           ])  ;
        }

    }
}
