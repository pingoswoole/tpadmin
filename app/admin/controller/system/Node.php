<?php


// +----------------------------------------------------------------------

namespace app\admin\controller\system;

use app\admin\model\SystemNode;
use app\admin\service\TriggerService;
use app\admin\base\AdminController;
use app\admin\logic\system\NodeLogic;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use EasyAdminCmd\auth\Node as NodeService;
use think\App;

/**
 * @ControllerAnnotation(title="系统节点管理")
 * Class Node
 * @package app\admin\controller\system
 */
class Node extends AdminController
{
    use \app\admin\traits\Curd;

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->logic = new NodeLogic;
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
     * @NodeAnotation(title="系统节点更新")
     */
    public function refreshNode($force = 0)
    {
        $nodeList = (new NodeService())->getNodelist();
        empty($nodeList) && $this->error('暂无需要更新的系统节点');
        $res = $this->logic->refreshNode($force, $nodeList);
        if ($res) {
            $this->success('节点更新成功');
        } else {
            $this->error('节点更新失败');
        }
    }

    /**
     * @NodeAnotation(title="清除失效节点")
     */
    public function clearNode()
    {
        $res = $this->logic->clearNode();
        if ($res) {
            $this->success('节点更新成功');
        } else {
            $this->error('节点更新失败');
        }
    }
}
