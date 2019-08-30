<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Team extends Controller
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        $result = Db::table('team')->alias('t')
            ->join('category c','t.cid=c.cid')
            ->field('t.*,c.cname')->paginate(3,false,[
                'page'=>1
            ]);

        if ($result) {
            return json([
                'code' => config('code.success'),
                'msg' => '团队成功添加成功',
                'data'=>$result->items(),
                'total'=>$result->total()
            ]);
        } else {
            return json([
                'code' => config('code.fail'),
                'msg' => '团队成员添加失败',
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
        $data = $this->request->post();
        $model  = model('Team');
        $result = $model->inserts($data);
        if ($result) {
            return json([
                'code' => config('code.success'),
                'msg' => '团队成功添加成功'
            ]);
        } else {
            return json([
                'code' => config('code.fail'),
                'msg' => '团队成员添加失败'
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
        $model = model('Team');
        $result = $model->queryone($id);
        if ($result) {
            return json([
                'code' => config('code.success'),
                'msg' => '团队成功添加成功',
                'data'=>$result
            ]);
        } else {
            return json([
                'code' => config('code.fail'),
                'msg' => '团队成员添加失败',
                'data'=>[]
            ]);
        }
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
        $model = model('Team');
        if($model->queryone1($data)){
            return  json([
                'code'=>config('code.fail')
            ]);
        }
        $result = Db::table('team')->where('id',$id)->update($data);
        if ($result) {
            return json([
                'code' => config('code.success'),
                'msg' => '团队更新成功',
                'data'=>$result
            ]);
        } else {
            return json([
                'code' => config('code.fail'),
                'msg' => '团队更新失败',
                'data'=>[]
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
