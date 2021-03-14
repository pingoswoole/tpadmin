<?php

// +----------------------------------------------------------------------
namespace app\admin\base;

 
use EasyAdminCmd\tool\CommonTool;
use think\facade\Env;
use think\Model;

/**
 * Class AdminLogic
 * @package app\admin\base
 */
class AdminLogic
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
        if($this->model_class){
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
    
      
}
