<?php

// 快速开发框架  @pingo

namespace app\common\model\mall;

use app\common\model\BaseModel;

class MallGoods extends BaseModel
{
    protected $table = "";

    protected $deleteTime = 'delete_time';

    public function cate()
    {
        return $this->belongsTo(MallCate::class, 'cate_id', 'id');
    }
}
