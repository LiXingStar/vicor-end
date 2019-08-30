<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\JWT;
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
        $data = $this->request->put();
        $result = Db::table('users')->where('phone',$data['phone'])->find();
        if($result){
            $pass = md5(crypt($data['password'],config('salt')));
            if($pass == $result['password']){
                $token =  JWT::getToken(['id'=>$result['uid'],'uname'=>$result['uname']],config('jwtkey'));
                return  json([
                    'code'=>config('code.success'),
                    'msg'=>"登录成功",
                    'token'=>$token
                ]);
            }   else{
                return  json([
                    'code'=>config('code.fail'),
                    'msg'=>"手机号和密码不匹配"
                ]);
            }
        }else{
            return  json([
                'code'=>config('code.fail'),
                'msg'=>"该用户不存在，请先注册"
            ]);
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
        //
    }
}
