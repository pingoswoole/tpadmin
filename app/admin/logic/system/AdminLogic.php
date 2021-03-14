<?php

namespace app\admin\logic\system;

use app\admin\base\BaseLogic;
use app\common\model\system\SystemAdmin;

/**
 * 管理员
 */
class AdminLogic extends BaseLogic
{
    /**
     * 登录
     *
     * @param [type] $username
     * @param [type] $password
     * @param integer $keep_login
     * @return void
     */
    public function login($username, $password, $keep_login = 0)
    {
        try {
            //code...
            $admin = SystemAdmin::where(['username' => $username])->find();
            if (empty($admin)) {
                return '用户不存在';
            }
            if (password($password) != $admin->password) {
                return '密码输入有误';
            }
            if ($admin->status == 0) {
                return '账号已被禁用';
            }
            $admin->login_num += 1;
            $admin->save();
            $admin = $admin->toArray();
            unset($admin['password']);
            $admin['expire_time'] = $keep_login == 1 ? true : time() + 7200;
            session('admin', $admin);
            return true;
        } catch (\Throwable $th) {
            //throw $th;
        }
        return '登录异常';
    }

    /**
     * 是否登录
     *
     * @return boolean
     */
    public function isLogin()
    {
        $adminId = session('admin.id');
        if(empty($adminId)) return false;
        return  true;
    }

    /**
     * 注销
     *
     * @return void
     */
    public function logout()
    {
        session('admin', null);
        return true;
    }

}
