<?php
// 事件定义文件

use app\event\Sms as EventSms;
use app\listener\Sms;

return [
    'bind'      => [
         
    ],

    'listen'    => [
        'AppInit'  => [],
        'HttpRun'  => [],
        'HttpEnd'  => [],
        'LogLevel' => [],
        'LogWrite' => [],
         
    ],

    'subscribe' => [
    ],
];
