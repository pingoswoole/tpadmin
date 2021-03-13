<?php
namespace app\controller;

use app\BaseController;
use think\facade\Db;
use think\facade\View;

class Index extends BaseController
{
    public function index()
    {
        return View::fetch('admin/home/index');
    }

    public function hello($name = 'ThinkPHP6')
    {
        return 'hello,' . $name;
    }

    public function test()
    {
        $id = Db::table("test")->insert(['title' => mt_rand(100, 9999)]);
        var_dump($id);
    }
}
