<?php

// 快速开发框架  @pingo

namespace app\common\model\system;


use app\common\model\TimeModel;

class SystemAdmin extends TimeModel
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