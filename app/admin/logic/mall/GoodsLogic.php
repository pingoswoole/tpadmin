<?php

namespace app\admin\logic\mall;

use app\admin\base\BaseLogic;
use app\common\model\mall\MallGoods;

/**
 * 商品逻辑
 */
class GoodsLogic extends BaseLogic
{
    protected $model_class = MallGoods::class;

    public function getPageList(int $page = 1, int $pagesize = 20, array $where = [], $sort = ''):array
    {
        try {
            //code...
            $count = $this->model
                ->withJoin('cate', 'LEFT')
                ->where($where)
                ->count();
            $list = $this->model
                ->withJoin('cate', 'LEFT')
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
