<?php

namespace app\admin\controller;

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

        $data = $this->request->get();

        $sdata = [];
        /*if(isset($data['page']) && !empty($data['page'])){
            $sdata['page'] = $data['page'];
        }else{
            $sdata['page'] = 1;
        }
        if(isset($data['limit']) && !empty($data['limit'])){
            $sdata['limit'] = $data['limit'];
        }else{
            $sdata['limit'] = config('paginate.list_rows');
        }*/


       $result =  Db::table('orders')->alias('o')
            ->join('users','o.uid=users.uid')
            ->field('o.*,users.uname')
            ->paginate($data['limit'],false,[
                'page'=>$data['page']
            ]);
       $total = $result->total();
       $orders = $result->items();
       if($total  &&  count($orders)){
           for($i=0;$i<count($orders);$i++){
               $orders[$i]['statetext'] = orderStateText($orders[$i]['state']);

               $ordersnum = $orders[$i]['ordernum'];

               $goods = Db::table('orders_extra')->alias('o')
                   ->join('goods','o.gid=goods.gid')
                   ->field('o.gid,o.num,goods.gname,goods.price,goods.gthumb,goods.gtype')
                   ->where('o.ordernum',$ordersnum)
                   ->select();

               $orders[$i]['goods'] = $goods;
           }
           return  json([
               'code'=>config('code.success'),
               'msg'=>'订单获取成功',
               'total'=>$total,
               'data'=>$orders
           ]);
       }else{
           return  json([
               'code'=>config('code.success'),
               'msg'=>'暂无数据',
               'total'=>$total,
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
