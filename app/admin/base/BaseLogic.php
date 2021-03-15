<?php

// +----------------------------------------------------------------------
namespace app\admin\base;

use EasyAdminCmd\tool\CommonTool;
use jianyan\excel\Excel;
use think\facade\Db;
use think\facade\Env;
use think\Model;

/**
 * Class AdminLogic
 * @package app\admin\base
 */
class BaseLogic
{
     

    /**
     * 当前模型
     * @Model
     * @var object
     */
    protected $model;

    /**
     * 当前模型类
     *
     * @var [type]
     */
    protected $model_class;

    /**
     * 架构方法
     */
    public function __construct()
    {
        if ($this->model_class) {
            $this->model = new $this->model_class;
        }

        $this->initialize();
    }

    /**
     * 初始化方法
     */
    protected function initialize()
    {
    }
    
    /**
     * 增修改删 返回结果
     *
     * @param boolean $flag
     * @param string $msg
     * @param array $data
     * @return void
     */
    protected function result($flag = true, $msg = '操作成功', $data = [])
    {
        return [
            'flag' => $flag,
            'msg'  => $msg,
            'data' => $data,
        ];
    }
    
    public function getPageList(int $page = 1, int $pagesize = 20, array $where = [], $sort = '')
    {
        try {
            //code...
            $count = $this->model
                    ->where($where)
                    ->count();
            $list = $this->model
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

     
    public function add(array $post)
    {
        try {
            //code...
            $result = $this->model->save($post);
            if ($result) {
                return $this->result(true, '保存成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
            return $this->result(false, '保存失败：'. $th->getMessage());
        }
        return $this->result(false, '保存失败1');
    }

     
    public function edit(int $id, array $data = [])
    {
        try {
            //code...
            $row = $this->model->find($id);
            if (empty($row)) {
                return $this->result(false, '数据不存在');
            }
            $result = $row->save($data);
            if ($result) {
                return $this->result(true, '保存成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
            return $this->result(false, $th->getMessage());
        }
        return $this->result(false, '保存失败');
    }

    public function getItem(int $id)
    {
        try {
            //code...
            return $this->model->find($id);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }
   
    public function delete($id)
    {
        try {
            //code...
            $row = $this->model->whereIn('id', $id)->select();
            if ($row->isEmpty()) {
                return $this->result(false, '数据不存在');
            }
            $save = $row->delete();
            if ($save) {
                return $this->result(true, '删除成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
            return $this->result(false, $th->getMessage());
        }
        return $this->result(false, '删除失败');
    }

     
    public function export(int $page = 1, int $pagesize = 20, array $where = [])
    {
        $tableName = $this->model->getName();
        $tableName = CommonTool::humpToLine(lcfirst($tableName));
        $prefix = config('database.connections.mysql.prefix');
        $dbList = Db::query("show full columns from {$prefix}{$tableName}");
        $header = [];
        foreach ($dbList as $vo) {
            $comment = !empty($vo['Comment']) ? $vo['Comment'] : $vo['Field'];
            if (!in_array($vo['Field'], $this->noExportFields)) {
                $header[] = [$comment, $vo['Field']];
            }
        }
        $list = $this->model
            ->where($where)
            ->limit(100000)
            ->order('id', 'desc')
            ->select()
            ->toArray();
        $fileName = time();
        return Excel::exportData($list, $header, $fileName, 'xlsx');
    }

    /**
     *  "属性修改"
     */
    public function modify(int $id, array $data = [])
    {
        try {
            //code...
            $row = $this->model->find($id);
            if (!$row) {
                return $this->result(false, '数据不存在');
            }
            $result = $row->save($data);
            if ($result) {
                return $this->result(true, '保存成功');
            }
        } catch (\Throwable $th) {
            //throw $th;
            return $this->result(false, $th->getMessage());
        }
        return $this->result(false, '修改失败');
    }
}
