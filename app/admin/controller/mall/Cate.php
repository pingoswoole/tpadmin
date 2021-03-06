<?php


namespace app\admin\controller\mall;

use app\admin\model\MallCate;
use app\admin\traits\Curd;
use app\admin\base\AdminController;
use app\admin\logic\mall\CateLogic;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use think\App;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="商品分类管理")
 */
class Cate extends AdminController
{
    use Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->logic = new CateLogic;
    }
}
