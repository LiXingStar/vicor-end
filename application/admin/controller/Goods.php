<?php

namespace app\admin\controller;

use think\Controller;
use think\Exception;
use think\Request;

class Goods extends Controller
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
        try {
            $model = model('Goodsmodel');
            $goods = $model->querys();

            if ($goods) {
                return json([
                    'code' => config('code.success'),
                    'msg' => '商品获取成功',
                    'data' => $goods
                ]);
            } else {
                return json([
                    'code' => config('code.success'),
                    'msg' => '暂无商品',
                    'data' => []
                ]);
            }
        }catch (Exception $exception){
            return json([
                'code' => config('code.fail'),
                'msg' => '商品获取失败'
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
        $data = $this->request->post();
        $model = model('Goodsmodel');
        $result = $model->inserts($data);
        if ($result) {
            return json([
                'code' => config('code.success'),
                'msg' => '商品添加成功'
            ]);
        } else {
            return json([
                'code' => config('code.fail'),
                'msg' => '商品添加失败'
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
