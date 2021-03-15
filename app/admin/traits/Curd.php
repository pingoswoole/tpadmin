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
            $rule = [];
            $this->validate($post, $rule);
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
            $rule = [];
            $this->validate($post, $rule);
            $result = $this->logic->edit($id, $post);
            if ($result) {
                $this->success($result['msg']);
            } else {
                $this->error($result['msg']);
            }
        }
        $row = $this->logic->getItem($id);
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
        list($page, $limit, $where) = $this->buildTableParames();
        return  $this->logic->export($page, $limit, $where);
    }

    /**
     * @NodeAnotation(title="属性修改")
     */
    public function modify()
    {
        $post = $this->request->post();
        $rule = [
            'id|ID'    => 'require',
            'field|字段' => 'require',
            'value|值'  => 'require',
        ];
        $this->validate($post, $rule);
        if (!in_array($post['field'], $this->allowModifyFields)) {
            $this->error('该字段不允许修改：' . $post['field']);
        }
        $result = $this->logic->modify($post['id'], [$post['field'] => $post['value']]);
        if ($result) {
            $this->success($result['msg']);
        } else {
            $this->error($result['msg']);
        }
    }
}
