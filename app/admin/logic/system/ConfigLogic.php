<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\common\model\system\SystemConfig;

/**
 * 配置
 */
class ConfigLogic extends BaseLogic
{
    protected $model_class = SystemConfig::class;
}
