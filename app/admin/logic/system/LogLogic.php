<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\common\model\system\SystemLog;

/**
 * 日记
 */
class LogLogic extends BaseLogic
{
    protected $model_class = SystemLog::class;

    public function getPageList(int $page = 1, int $pagesize = 20, array $where = [], $sort = '', $month = '')
    {
        try {
            //code...
            $count = $this->model
                ->setMonth($month)
                ->with('admin')
                ->where($where)
                ->count();
            $list = $this->model
                ->setMonth($month)
                ->with('admin')
                ->where($where)
                ->page($page, $pagesize)
                ->order($sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return $data;
        } catch (\Throwable $th) {
            //throw $th;
            return [
                'code'  => -1,
                'msg'   => $th->getMessage(),
                'count' => 0,
                'data'  => [],
            ];
        }
    }
}
