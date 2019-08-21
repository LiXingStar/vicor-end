<?php


namespace app\admin\validate;


use think\Validate;

class Login extends Validate
{
  protected $rule = [
      'username'=>'require|min:3|max:10'
  ];
  protected $message = [];
  protected $scene = [];
}
