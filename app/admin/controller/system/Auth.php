<?php


// +----------------------------------------------------------------------

namespace app\admin\controller\system;

use app\admin\model\SystemAuth;
use app\admin\model\SystemAuthNode;
use app\admin\service\TriggerService;
use app\admin\base\AdminController;
use app\admin\logic\system\AuthLogic;
use EasyAdminCmd\annotation\ControllerAnnotation;
use EasyAdminCmd\annotation\NodeAnotation;
use think\App;

/**
 * @ControllerAnnotation(title="角色权限管理")
 * Class Auth
 * @package app\admin\controller\system
 */
class Auth extends AdminController
{
    use \app\admin\traits\Curd;

    protected $sort = [
        'sort' => 'desc',
        'id'   => 'desc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
         
        $this->logic = new AuthLogic;
    }

    /**
     * @NodeAnotation(title="授权")
     */
    public function authorize($id)
    {
        $row = $this->logic->getItem(['id' => $id]);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isAjax()) {
            $list = $this->logic->getAuthorizeNodeListByAdminId($id);
            $this->success('获取成功', $list);
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="授权保存")
     */
    public function saveAuthorize()
    {
        $id = $this->request->post('id');
        $node = $this->request->post('node', "[]");
        $node = json_decode($node, true);
        $row = $this->logic->getItem(['id' => $id]);
        empty($row) && $this->error('数据不存在');

        $result = $this->logic->resetList($id, $node);
        if ($result) {
            # code...
            $this->success('保存成功');
        } else {
            $this->error('保存失败');
        }
    }
}
