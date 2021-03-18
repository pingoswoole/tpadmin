<?php

namespace app\common\model\system;

use app\common\model\BaseModel;

class SystemLog extends BaseModel
{
    public function __construct(array $data = [])
    {
        parent::__construct($data);
        //$this->name = 'system_log_' . date('Ym');
    }

    public function setMonth($month)
    {
        //$this->name = 'system_log_' . $month;
        return $this;
    }

    public function admin()
    {
        return $this->belongsTo(SystemAdmin::class, 'admin_id', 'id');
    }
}
