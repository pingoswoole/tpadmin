<?php


// +----------------------------------------------------------------------

namespace app\admin\controller\system;

use app\admin\model\SystemUploadfile;
use app\admin\base\AdminController;
use app\admin\logic\system\UploadfileLogic;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="上传文件管理")
 * Class Uploadfile
 * @package app\admin\controller\system
 */
class Uploadfile extends AdminController
{
    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->logic = new UploadfileLogic;
    }
}
