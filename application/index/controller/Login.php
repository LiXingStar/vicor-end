<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class Login extends Controller
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
        // md5(123456789 + xxxx)
        $data = $this->request->post();
        // 手机号是否注册

        $username = randomNames();
        $password = $data['password'];
        $data['password'] = md5( crypt($password,config('salt')) );
        $data['uname'] = $username;
        $model = model('Usermodel');
        $result = $model->inserts($data);
        if($result){
            return  json([
                'code'=>config('code.success'),
                'msg'=>"注册成功"
            ]);
        }else{
            return  json([
                'code'=>config('code.fail'),
                'msg'=>"注册失败"
            ]);
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
