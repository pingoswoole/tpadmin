<?php


// +----------------------------------------------------------------------

namespace app\admin\traits;

use EasyAdminCmd\annotation\NodeAnotation;
use EasyAdminCmd\tool\CommonTool;
use jianyan\excel\Excel;
use think\facade\Db;

/**
 * 后台CURD复用
 * Trait Curd
 * @package app\admin\traits
 */
trait Curd
{


    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->logic->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $data = $this->logic->getPageList($page, $limit, $where, $this->sort);
            return json($data);
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add()
    {
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            if ($this->add_rule) {
                $this->validate($post, $this->add_rule);
            }
            $result = $this->logic->add($post);
            if ($result['flag']) {
                $this->success($result['msg']);
            } else {
                $this->error($result['msg']);
            }
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            if ($this->edit_rule) {
                $this->validate($post, $this->edit_rule);
            }
            $result = $this->logic->edit($id, $post);
            if ($result) {
                $this->success($result['msg']);
            } else {
                $this->error($result['msg']);
            }
        }
        $row = $this->logic->getItem(['id' => $id]);
        empty($row) && $this->error('数据不存在');
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="删除")
     */
    public function delete($id)
    {
        $result = $this->logic->delete($id);
        if ($result) {
            $this->success($result['msg']);
        } else {
            $this->error($result['msg']);
        }
    }

    /**
     * @NodeAnotation(title="导出")
     */
    public function export()
    {

        //return download('/www/tp6_layui_admin/public/storage/upload/20210317/ee9644d5df7e00e219e686439b852b54.png', 'my.jpg');
        list($page, $limit, $where) = $this->buildTableParames();
        return  $this->logic->export($where, $this->noExportFields);
    }

    /**
     * @NodeAnotation(title="属性修改")
     */
    public function modify()
    {
        $post = $this->request->post();
        if ($this->modify_rule) {
            $this->validate($post, $this->modify_rule);
        }
        if (!in_array($post['field'], $this->allowModifyFields)) {
            $this->error('该字段不允许修改：' . $post['field']);
        }
        $result = $this->logic->modify(['id' => $post['id']], [$post['field'] => $post['value']]);
        if ($result) {
            $this->success($result['msg']);
        } else {
            $this->error($result['msg']);
        }
    }
}
