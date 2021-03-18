<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\admin\service\TriggerService;
use app\common\model\system\SystemAuth;
use app\common\model\system\SystemAuthNode;

/**
 * 授权
 */
class AuthLogic extends BaseLogic
{
    protected $model_class = SystemAuth::class;

    public function getAuthorizeNodeListByAdminId(int $id)
    {
        try {
            //code...
            return $this->model->getAuthorizeNodeListByAdminId($id);
        } catch (\Throwable $th) {
            //throw $th;
        }
        return [];
    }

    public function resetList($delete_id, $node): bool
    {
        try {
            //code...
            $authNode = new SystemAuthNode();
            $authNode->where('auth_id', $delete_id)->delete();
            if (!empty($node)) {
                $saveAll = [];
                foreach ($node as $vo) {
                    $saveAll[] = [
                        'auth_id' => $delete_id,
                        'node_id' => $vo,
                    ];
                }
                $authNode->saveAll($saveAll);
            }
            TriggerService::updateMenu();
            return true;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }
}
