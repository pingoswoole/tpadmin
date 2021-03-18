<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\admin\service\TriggerService;
use app\common\model\system\SystemMenu;
use app\common\model\system\SystemNode;

/**
 * 菜单
 */
class MenuLogic extends BaseLogic
{
    protected $model_class = SystemMenu::class;

    public function getPidMenuList()
    {
        try {
            //code...
            return $this->model->getPidMenuList();
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }

    public function getMenuTips($limit, $node)
    {
        try {
            //code...
            $list = SystemNode::whereLike('node', "%{$node}%")
            ->field('node,title')
            ->limit($limit)
            ->select();
            return [
                'code'    => 0,
                'content' => $list,
                'type'    => 'success',
            ];
        } catch (\Throwable $th) {
            //throw $th;
        }

        return [];
    }
}
