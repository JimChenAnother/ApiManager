<?php
defined('API') or exit('http://gwalker.cn');
if($vcap = getenv("VCAP_SERVICES")){
    //coding.net上部署
    $data = json_decode($vcap, true);
    $creds = $data['mysql'][0]['credentials'];
    return array(
    //数据库连接配置
        'db'=>array(
            'host' => $creds['hostname'],   //数据库地址
            'dbname' => $creds['name'],   //数据库名
            'user' => $creds['username'],    //帐号
            'passwd' => $creds['password'],    //密码
            'linktype' => 'mysqli',    //数据库连接类型 支持mysqli与pdo两种类型
        ),
        //session配置
        'session'=>array(
            'prefix' => 'api_',
        ),
        //cookie配置
        'cookie' => array(
            'navbar' => 'API_NAVBAR_STATUS',
        ),
        //版本信息
        'version'=>array(
            'no' => 'v1.2',  //版本号
            'time' => '2015-08-19 00:40',   //版本时间
        )
    );
} else {
    return array(
        //本地数据库连接配置
        'db'=>array(
            'host' => 'localhost',   //数据库地址
            'dbname' => 'api_manager',   //数据库名
            'user' => 'root',    //帐号
            'passwd' => 'chenjunwu007',    //密码
            'linktype' => 'mysqli',    //数据库连接类型 支持mysqli与pdo两种类型
        ),
        //session配置
        'session'=>array(
            'prefix' => 'api_',
        ),
        //cookie配置
        'cookie' => array(
            'navbar' => 'API_NAVBAR_STATUS',
        ),
        //版本信息
        'version'=>array(
            'no' => 'v1.2',  //版本号
            'time' => '2015-08-19 00:40',   //版本时间
        )
    );


}
