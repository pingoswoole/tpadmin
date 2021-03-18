<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\common\model\system\SystemQuick;

/**
 * 快速启动栏
 */
class QuickLogic extends BaseLogic
{
    protected $model_class = SystemQuick::class;

    public function getWelcome()
    {
        try {
            //code...
            $quicks = $this->model->field('id,title,icon,href')
            ->where(['status' => 1])
            ->order('sort', 'desc')
            ->limit(8)
            ->select();
            return $quicks;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }
}
