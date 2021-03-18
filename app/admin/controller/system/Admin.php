<?php


// +----------------------------------------------------------------------

namespace app\admin\controller\system;

use app\admin\model\SystemAdmin;
use app\admin\service\TriggerService;
use app\admin\constants\AdminConstant;
use app\admin\base\AdminController;
use app\admin\logic\system\AdminLogic;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use think\App;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="管理员管理")
 */
class Admin extends AdminController
{
    use \app\admin\traits\Curd;

    protected $sort = [
        'sort' => 'desc',
        'id'   => 'desc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->logic = new AdminLogic;
        $this->assign('auth_list', $this->logic->getAuthList());
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            $data = $this->logic->getPageList($page, $limit, $where);
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
            $authIds = $this->request->post('auth_ids', []);
            $post['auth_ids'] = implode(',', array_keys($authIds));
            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $this->logic->add($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->logic->getItem(['id' => $id ]);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $authIds = $this->request->post('auth_ids', []);
            $post['auth_ids'] = implode(',', array_keys($authIds));
            $rule = [];
            $this->validate($post, $rule);
            if (isset($row['password'])) {
                unset($row['password']);
            }
            $result = $this->logic->edit($id, $post);
            TriggerService::updateMenu($id);
            $result ? $this->success('保存成功') : $this->error('保存失败');
        }
        $row->auth_ids = explode(',', $row->auth_ids);
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function password($id)
    {
        $row = $this->logic->getItem(['id' => $id]);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [
                'password|登录密码'       => 'require',
                'password_again|确认密码' => 'require',
            ];
            $this->validate($post, $rule);
            if ($post['password'] != $post['password_again']) {
                $this->error('两次密码输入不一致');
            }
           
            $result = $this->logic->modify(
                ['id' => $id],
                [
                    'password' => password($post['password']),
                ]
            );
            if ($result['flag']) {
                $this->success($result['msg']);
            } else {
                $this->error($result['msg']);
            }
        }
        $row->auth_ids = explode(',', $row->auth_ids);
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="删除")
     */
    public function delete($id)
    {
        //$row = $this->model->whereIn('id', $id)->select();
        //$row->isEmpty() && $this->error('数据不存在');
        $id == AdminConstant::SUPER_ADMIN_ID && $this->error('超级管理员不允许修改');
        if (is_array($id)) {
            if (in_array(AdminConstant::SUPER_ADMIN_ID, $id)) {
                $this->error('超级管理员不允许修改');
            }
        }
        $result = $this->logic->delete($id);
        if ($result['flag']) {
            $this->success($result['msg']);
        } else {
            $this->error($result['msg']);
        }
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
        if ($post['id'] == AdminConstant::SUPER_ADMIN_ID && $post['field'] == 'status') {
            $this->error('超级管理员状态不允许修改');
        }
        $row = $this->logic->getItem([ 'id' => $post['id']]);
        empty($row) && $this->error('数据不存在');
        try {
            $this->logic->modify(
                [ 'id' => $post['id']],
                [
                $post['field'] => $post['value'],
            ]
            );
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        $this->success('保存成功');
    }
}
