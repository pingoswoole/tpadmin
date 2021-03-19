<?php

// +----------------------------------------------------------------------
namespace app\admin\base;

use EasyAdminCmd\tool\CommonTool;
use jianyan\excel\Excel;
use think\facade\Db;
use think\facade\Env;
use think\Model;

use \PhpOffice\PhpSpreadsheet\IOFactory;
use \PhpOffice\PhpSpreadsheet\Spreadsheet;
use \PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use \PhpOffice\PhpSpreadsheet\Cell\Coordinate;

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
    protected function result($flag = true, $msg = '操作成功', $data = []):array
    {
        return [
            'flag' => $flag,
            'msg'  => $msg,
            'data' => $data,
        ];
    }
    /**
     * 分页数据
     *
     * @param integer $page
     * @param integer $pagesize
     * @param array $where
     * @param string $sort
     * @return array
     */
    public function getPageList(int $page = 1, int $pagesize = 20, array $where = [], $sort = ''):array
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

    /**
     * Undocumented function
     *
     * @param array $post
     * @return void
     */
    public function add(array $post): array
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

    /**
     * 编辑数据
     *
     * @param integer $id
     * @param array $data
     * @return array
     */
    public function edit(int $id, array $data = []):array
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
    /**
     * 获取单条数据
     *
     * @param array $where
     * @return void
     */
    public function getItem(array $where = [])
    {
        try {
            //code...
            return $this->model->where($where)->find();
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }
    
    /**
     * 删除数据
     *
     * @param [type] $id
     * @return array
     */
    public function delete($id):array
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

    /**
     * 导出数据
     *
     * @param array $where
     * @param array $noExportFields
     * @return void
     */
    public function export(array $where = [], $noExportFields = [])
    {
        $tableName = $this->model->getName();
        $tableName = CommonTool::humpToLine(lcfirst($tableName));
        $prefix = config('database.connections.mysql.prefix');
        $dbList = Db::query("show full columns from {$prefix}{$tableName}");
        $spreadsheet = new Spreadsheet();
        $sheet       = $spreadsheet->getActiveSheet();
        //把数据循环写入到excel里
         
        foreach ($dbList as $key => $vo) {
            $comment = !empty($vo['Comment']) ? $vo['Comment'] : $vo['Field'];
            if (!in_array($vo['Field'], $noExportFields)) {
                $header[] = [$comment, $vo['Field']];
                $htitle = chr(65 + $key) . '1';
                $sheet->setCellValue($htitle, $comment);
            }
        }
         
        $list = $this->model
            ->where($where)
            ->limit(100000)
            ->order('id', 'desc')
            ->select()
            ->toArray();
        $fileName = time() . mt_rand(1000, 9999) . ".xlsx";
        //把数据循环写入到excel里
        foreach ($list as $k => $row) {
            foreach ($header as $key => $hrow) {
                # code...
                $hkey = chr(65 + $key) . ($k + 2);
                $sheet->setCellValue($hkey, $row[$hrow[1]]);
            }
        }
        $writer   = new Xlsx($spreadsheet);
        //这里可以写绝对路径，其他框架到这步就结束了
        $file = root_path() . 'public/storage/' . $fileName;
        $writer->save($file);
        //关闭连接，销毁变量
        $spreadsheet->disconnectWorksheets();
        unset($spreadsheet);
        return download($file, $fileName);
    }

   
    /**
     * 属性修改
     *
     * @param array $where
     * @param array $data
     * @return array
     */
    public function modify(array $where = [], array $data = []):array
    {
        try {
            //code...
            $row = $this->model->where($where)->find();
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
