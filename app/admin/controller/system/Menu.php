<?php


// +----------------------------------------------------------------------

namespace app\admin\controller\system;

use app\admin\model\SystemMenu;
use app\admin\model\SystemNode;
use app\admin\service\TriggerService;
use app\admin\constants\MenuConstant;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use app\admin\base\AdminController;
 
use app\admin\logic\system\MenuLogic;
use think\App;

/**
 * Class Menu
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="菜单管理",auth=true)
 */
class Menu extends AdminController
{
    use \app\admin\traits\Curd;

    protected $sort = [
        'sort' => 'desc',
        'id'   => 'asc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->logic = new MenuLogic;
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
            $data = $this->logic->getPageList(1, 2000, [], $this->sort);
            return json($data);
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add($id = null)
    {
        $menu_item = $this->logic->getItem(['pid' => MenuConstant::HOME_PID ]);
        if ($id == $menu_item['id']) {
            $this->error('首页不能添加子菜单');
        }
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [
                'pid|上级菜单'   => 'require',
                'title|菜单名称' => 'require',
                'icon|菜单图标'  => 'require',
            ];
            $this->validate($post, $rule);

            $result = $this->logic->add($post);
            if ($result['flag']) {
                $this->success('保存成功');
                TriggerService::updateMenu();
            } else {
                $this->error($result['msg']);
            }
        }
        $pidMenuList = $this->logic->getPidMenuList();
       
        $this->assign('id', $id);
        $this->assign('pidMenuList', $pidMenuList);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->logic->getItem(['id' => $id]);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [
                'pid|上级菜单'   => 'require',
                'title|菜单名称' => 'require',
                'icon|菜单图标'  => 'require',
            ];
            $this->validate($post, $rule);
            $result = $this->logic->edit($id, $post);
            if ($result) {
                TriggerService::updateMenu();
                $this->success($result['msg']);
            } else {
                $this->error($result['msg']);
            }
        }
        $pidMenuList = $this->logic->getPidMenuList();
        $this->assign([
            'id'          => $id,
            'pidMenuList' => $pidMenuList,
            'row'         => $row,
        ]);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="删除")
     */
    /* public function delete($id)
    {
        $row = $this->model->whereIn('id', $id)->select();
        empty($row) && $this->error('数据不存在');
        try {
            $save = $row->delete();
        } catch (\Exception $e) {
            $this->error('删除失败');
        }
        if ($save) {
            TriggerService::updateMenu();
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    } */

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
        $row = $this->model->find($post['id']);
        if (!$row) {
            $this->error('数据不存在');
        }
        
        $item = $this->logic
            ->getItem([
                'pid' => MenuConstant::HOME_PID,
            ]);
        if ($post['id'] == $item['id'] && $post['field'] == 'status') {
            $this->error('首页状态不允许关闭');
        }
        $result = $this->logic->modify(
            ['id' => $post['id']],
            [$post['field'] => $post['value'],]
        );
        if ($result['flag']) {
            TriggerService::updateMenu();
            $this->success('保存成功');
        } else {
            $this->error($result['msg']);
        }
    }

    /**
     * @NodeAnotation(title="添加菜单提示")
     */
    public function getMenuTips()
    {
        $node = input('get.keywords');
        $limit = 10;
        $data = $this->logic->getMenuTips($limit, $node);
        
        return json($data);
    }
}
