<?php

namespace app\admin\controller\system;

use app\admin\model\SystemLog;
use app\admin\base\AdminController;
use app\admin\logic\system\LogLogic;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="操作日志管理")
 * Class Auth
 * @package app\admin\controller\system
 */
class Log extends AdminController
{
    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->logic = new LogLogic;
    }
   
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            [$page, $limit, $where, $excludeFields] = $this->buildTableParames(['month']);

            $month = (isset($excludeFields['month']) && !empty($excludeFields['month']))
                ? date('Ym', strtotime($excludeFields['month']))
                : date('Ym');

            // todo TP6框架有一个BUG，非模型名与表名不对应时（name属性自定义），withJoin生成的sql有问题
            $data = $this->logic->getPageList($page, $limit, $where, $this->sort, $month);
            return json($data);
        }
        return $this->fetch();
    }
}
