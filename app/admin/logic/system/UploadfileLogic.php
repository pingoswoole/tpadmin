<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\common\model\system\SystemUploadfile;

/**
 * 上传文件
 */
class UploadfileLogic extends BaseLogic
{
    protected $model_class = SystemUploadfile::class;
}
