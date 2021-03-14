<?php


// +----------------------------------------------------------------------

namespace app\api\controller;

use app\admin\model\SystemAdmin;
 
use app\admin\service\TriggerService;
use app\common\constants\AdminConstant;
use app\admin\base\AdminController;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use think\App;
use think\facade\Db;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="管理员管理")
 */
class Index extends AdminController
{
    use \app\admin\traits\Curd;

    protected $sort = [
        'sort' => 'desc',
        'id'   => 'desc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
    }

    public function test()
    {
        
        
        return __CLASS__;
    }
}
 