<?php


// +----------------------------------------------------------------------

namespace app\common\command;

use think\console\Command;
use think\console\Input;
use think\console\input\Option;
use think\console\Output;

class Install extends Command
{
    protected function configure()
    {
        $this->setName('install')
            //->addOption('force', null, Option::VALUE_REQUIRED, '是否强制刷新', 0)
            ->setDescription('系统安装初始化工作');
    }

    protected function execute(Input $input, Output $output)
    {
        //$force = $input->getOption('force');
        $output->writeln("========正在安装配置服务：=====" . date('Y-m-d H:i:s'));
        $check = $this->start();
        $check !== true && $output->writeln("安装失败：" . $check);
        $output->writeln("安装完成：" . date('Y-m-d H:i:s'));
    }

    protected function start()
    {
         
        try {
            //数据库导入
            //配置
            
        } catch (\Exception $e) {
            return $e->getMessage();
        }
        return true;
    }
}
