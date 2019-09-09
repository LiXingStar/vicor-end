<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\JWT;
// 应用公共文件
/*
 *  header,get,post
 *
 * */
function checkJWT(){
    $authorization = request()->header('Authorization');
    $getToken = request()->get('token');
    $postToken = request()->post('token');
    if($authorization){
        $token = $authorization;
    }else if($getToken){
        $token = $getToken;
    }else if($postToken){
        $token = $postToken;
    }else{
        json([
            'code'=>401,
            'msg'=>'token不能为空'
        ])->send();
        exit();
    }
    $result = JWT::verify($token,config('jwtkey'));
    if(!$result){
        json([
            'code'=>401,
            'msg'=>'token验证失败'
        ])->send();
        exit();
    }
    request()->id = $result['id'];
}

function randomNames(){
    $time = time();
    $charts = ['q','w','e','r','t','y','u','i'];
    shuffle($charts);
    $str = join('',array_slice($charts,0,5));
    return $str.'_'.$time;
}

function orderStateText($state){
    $text = '未付款';
    switch ($state){
        case 0:
            $text = '未付款';
            break;
        case 1:
            $text='待发货';
            break;
        case 2:
            $text = '待收货';
            break;
        case 3:
            $text='待评价';
            break;
        default:
            $text ='';
    }
    return $text;
}
