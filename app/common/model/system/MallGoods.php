<?php

// 快速开发框架  @pingo

namespace app\common\model\system;


use app\common\model\TimeModel;

class MallGoods extends TimeModel
{

    protected $table = "";

    protected $deleteTime = 'delete_time';

    public function cate()
    {
        return $this->belongsTo('app\admin\model\MallCate', 'cate_id', 'id');
    }

}