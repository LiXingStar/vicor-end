<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;
use think\JWT;
class Login extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $data = $this->request->get();
         return  json($data);
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
        $data = $this->request->post();
        $validate = validate('Login');
        if(!$validate->check($data)){
            return  json([
               'code'=>config('code.fail'),
               'msg'=>$validate->getError()
            ]);
        }

        $username = $data['username'];
        $password = md5($data['password']);

        $result = Db::table('manager')->where(['username'=>$username,'password'=>$password])
            ->find();
        if($result){
           $code = config('code.success');
           $msg = '登录成功';
           $token = JWT::getToken(['id'=>$result['id']],config('jwtkey'));
        }else{
            $code = config('code.fail');
            $msg = '登录失败';
            $token = '';
        }
        return json([
            'code'=>$code,
            'msg'=>$msg,
            'token'=>$token
        ]);


       /*
        *

        *
        * */

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
        echo 'update';
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        $data = $this->request->get();
        $data['id'] = $id;
        return json($data);
    }
}
