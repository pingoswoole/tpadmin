<?php

// 快速开发框架  @pingo

namespace app\common\model\system;

use app\common\model\BaseModel;

class SystemAdmin extends BaseModel
{
    protected $deleteTime = 'delete_time';

    public function getAuthList()
    {
        $list = (new SystemAuth())
            ->where('status', 1)
            ->column('title', 'id');
        return $list;
    }
}
