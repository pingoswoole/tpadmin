<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\admin\service\TriggerService;
use app\common\model\system\SystemNode;
use EasyAdminCmd\auth\Node as NodeService;

/**
 * 权限节点
 */
class NodeLogic extends BaseLogic
{
    protected $model_class = SystemNode::class;

    public function getPageList(int $page = 1, int $pagesize = 20, array $where = [], $sort = '')
    {
        try {
            //code...
            $count = $this->model
                ->count();
            $list = $this->model
                ->getNodeTreeList();
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

    public function refreshNode($force, $nodeList):bool
    {
        try {
            //code...
            $model = $this->model;
            if ($force == 1) {
                $updateNodeList = $model->whereIn('node', array_column($nodeList, 'node'))->select();
                $formatNodeList = array_format_key($nodeList, 'node');
                foreach ($updateNodeList as $vo) {
                    isset($formatNodeList[$vo['node']]) && $model->where('id', $vo['id'])->update([
                        'title'   => $formatNodeList[$vo['node']]['title'],
                        'is_auth' => $formatNodeList[$vo['node']]['is_auth'],
                    ]);
                }
            }
            $existNodeList = $model->field('node,title,type,is_auth')->select();
            foreach ($nodeList as $key => $vo) {
                foreach ($existNodeList as $v) {
                    if ($vo['node'] == $v->node) {
                        unset($nodeList[$key]);
                        break;
                    }
                }
            }
            $model->saveAll($nodeList);
            TriggerService::updateNode();
            return true;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return false;
    }

    public function clearNode()
    {
        $nodeList = (new NodeService())->getNodelist();
        $model = new SystemNode();
        try {
            $existNodeList = $model->field('id,node,title,type,is_auth')->select()->toArray();
            $formatNodeList = array_format_key($nodeList, 'node');
            foreach ($existNodeList as $vo) {
                !isset($formatNodeList[$vo['node']]) && $model->where('id', $vo['id'])->delete();
            }
            TriggerService::updateNode();
            return true;
        } catch (\Exception $e) {
        }
        return false;
    }
}
