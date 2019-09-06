<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Request;

class Orders extends Controller
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
     * @param \think\Request $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        /*
         * 产生订单 ->order (uid,ordernum,price,) -->订单商品(gid,num,uid,ordernum)
         *
         * 购物车
         *
         * 订单商品销量
         *
         *  */
        Db::startTrans();
        $uid = $this->request->id;
        $ordernum = time() . mt_rand(1000, 9999);
        $cart = Db::table('cart')->where(['uid' => $uid])->find();
        $price = $cart['price'];
        $orders = model('Ordermodel');
        $orderResult = $orders->inserts(['uid' => $uid, 'ordernum' => $ordernum, 'price' => $price]);
        // 订单商品
        $activeGoods = Db::table('cart_extra')->field('gid,num')->where(['uid' => $uid, 'state' => 1])->select();

        for ($i = 0; $i < count($activeGoods); $i++) {
            $activeGoods[$i]['uid'] = $uid;
            $activeGoods[$i]['ordernum'] = $ordernum;
        }

        $orderExtraResult = Db::table('orders_extra')->insertAll($activeGoods);

        // 购物车

        $cartExtraResult = Db::table('cart_extra')->where(['uid'=>$uid,'state'=>1])->delete();

        $cartResult =  Db::table('cart')->where(['uid'=>$uid])->update(['total'=>0,'price'=>0]);
        if($orderResult && $orderExtraResult && $cartResult && $cartExtraResult){
            return  json([
                'code'=>config('code.success'),
                'msg'=>'下单成功',
                'data'=>$ordernum
            ]);
        }else{
            return  json([
                'code'=>config('code.fail'),
                'msg'=>'下单失败'
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
    }

    /**
     * 保存更新的资源
     *
     * @param \think\Request $request
     * @param int $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param int $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
