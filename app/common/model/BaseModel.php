<?php

// 快速开发框架  @pingo


namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

/**
 *  BaseModel模型
 * Class BaseModel
 * @package app\common\model
 */
class BaseModel extends Model
{

    /**
     * 自动时间戳类型
     * @var string
     */
    protected $autoWriteTimestamp = true;

    /**
     * 添加时间
     * @var string
     */
    protected $createTime = 'create_time';

    /**
     * 更新时间
     * @var string
     */
    protected $updateTime = 'update_time';

    /**
     * 软删除
     */
    use SoftDelete;
    protected $deleteTime = false;
}
