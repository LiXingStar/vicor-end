<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Exception;
use think\JWT;
use think\Request;

class Category extends Controller
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
        /* $data = [
            ['cid'=>1,'cname'=>'沙发','sort'=>10,'pid'=>0,
              'children'=>[]
            ],
            ['cid'=>2,'cname'=>'茶几','sort'=>11,'pid'=>0],
         ];*/
        $data = Db::table('category')->order('cid', 'asc')->select();

        function cateTree($cate, $pid)
        {
            $arr = [];
            for ($i = 0; $i < count($cate); $i++) {
                $current = $cate[$i];
                if ($current['pid'] == $pid) {
                    $children = cateTree($cate, $current['cid']);
                    if (count($children)) {
                        $current['children'] = $children;
                    }
                    array_push($arr, $current);
                }
            }
            return $arr;
        }

        $catetree = cateTree($data, 0);

        return json([
            'code' => config('code.success'),
            'msg' => '数据获取成功',
            'data' => $catetree
        ]);

    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
        return json([
            'code' => 200,
            'msg' => 'ceate'
        ]);
    }

    /**
     * 保存新建的资源
     *
     * @param \think\Request $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
        try {
            $data = $this->request->post();
            $result = Db::table('category')->insertGetId($data);
            if ($result) {
                return json([
                    'code' => config('code.success'),
                    'msg' => '分类插入成功',
                    'lastid' => $result
                ]);
            } else {
                return json([
                    'code' => config('code.fail'),
                    'msg' => '分类插入失败'
                ]);
            }
        } catch (Exception $exception) {
            return json([
                'code' => config('code.fail'),
                'msg' => '分类插入失败'
            ]);
        }
    }

    /**
     * 显示指定的资源
     *
     * @param int $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
        return json([
            'code' => 200,
            'msg' => $id
        ]);
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param int $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
        return json([
            'code' => 200,
            'msg' => 'edit' . $id
        ]);
    }

    /**
     * 保存更新的资源
     *
     * @param \think\Request $request
     * @param int $id
     * @return \think\Response
     *
     * api/category/12
     */
    public function update(Request $request, $id)
    {
        //
//        try {
            $data = $this->request->put();
            $model = model('Categorymodel');
            $result = $model->queryone($data);
            if ($result) {
                return json([
                    'code' => config('code.fail'),
                    'msg' => '已存在和修改信息相同的分类'
                ]);
            }
            $updateResult = $model->updates($data, $id);
            if ($updateResult) {
                return json([
                    'code' => config('code.success'),
                    'msg' => '栏目修改成功'
                ]);
            } else {
                return json([
                    'code' => config('code.fail'),
                    'msg' => '栏目修改失败'
                ]);
            }

//        } catch (Exception $exception) {
//            return json([
//                'code' => config('code.fail'),
//                'msg' => '栏目修改失败'
//            ]);
//        }
    }

    public function delete($id)
    {
        // api/category/12
        $data = model('Categorymodel')->deletes($id);
        if ($data) {
            return json([
                'code' => config('code.fail'),
                'msg' => '当前栏目存在子栏目，不允许删除'
            ]);
        }

        $result = Db::table('category')->where(['cid' => $id])->delete();
        if ($result) {
            return json([
                'code' => config('code.success'),
                'msg' => '栏目成功'
            ]);
        } else {
            return json([
                'code' => config('code.fail'),
                'msg' => '栏目删除失败'
            ]);
        }


    }
}
