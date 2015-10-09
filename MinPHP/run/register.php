<!--注册start-->
<?php defined('API') or exit('http://gwalker.cn');?>
<?php
	 $type= I($_GET['type']);
	 if($type  == 'do'){
        $_VAL = I($_POST);
        $login_name = $_VAL['registerName'];
        $login_pwd = md5($_VAL['registerPwd']);
        $login_repwd = md5($_VAL['registerRepwd']);
        if( $login_pwd == $login_repwd) {
	        $sql = "select * from user where login_name = '{$login_name}' and isdel = '0'";
	        $info = find($sql);
	        if(! $info){
	        	M()->autocommit(false);
	        	$sql1 = "insert into user (nice_name,login_name,login_pwd,issuper) values ('{$login_name}','{$login_name}','{$login_pwd}',1)";
	        	$sql2 = "DROP TABLE IF EXISTS `{$login_name}_api`";
	        	$sql3 = "CREATE TABLE `{$login_name}_api` (
						  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '接口编号',
						  `aid` int(11) DEFAULT '0' COMMENT '接口分类id',
						  `num` varchar(100) DEFAULT NULL COMMENT '接口编号',
						  `url` varchar(240) DEFAULT NULL COMMENT '请求地址',
						  `name` varchar(100) DEFAULT NULL COMMENT '接口名',
						  `des` varchar(300) DEFAULT NULL COMMENT '接口描述',
						  `parameter` text COMMENT '请求参数{所有的主求参数,以json格式在此存放}',
						  `memo` text COMMENT '备注',
						  `re` text COMMENT '返回值',
						  `lasttime` int(11) unsigned DEFAULT NULL COMMENT '提后操作时间',
						  `lastuid` int(11) unsigned DEFAULT NULL COMMENT '最后修改uid',
						  `isdel` tinyint(4) unsigned DEFAULT '0' COMMENT '{0:正常,1:删除}',
						  `type` char(11) DEFAULT NULL COMMENT '请求方式',
						  `ord` int(11) DEFAULT '0' COMMENT '排序(值越大,越靠前)',
						  PRIMARY KEY (`id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='接口明细表';";
				if(insert($sql1) && update($sql2) && update($sql3)) {
					M()->commit();
					echo "<script>alert('注册成功！');</script>";
        			go(U(array('act'=>'login')));
				} else{
					M()->rollback();
					echo '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> 注册失败！</div>';
				}
			}else{
				echo '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> 注册失败，账号已存在！</div>';
        	}
    	}else {
			echo '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> 注册失败，确认密码与密码不一致！</div>';
		}
	}
?>


<div style="border:1px solid #ddd">
    <div style="background:#f5f5f5;padding:20px;position:relative">
        <h4>注册</h4>
        <div>
            <form action="?act=register&type=do" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="registerName" placeholder="登录名" value='' required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="registerPwd" placeholder="密码" value='' required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="registerRepwd" placeholder="确认密码" value='' required="required">
                </div>
                <button class="btn btn-success">Submit</button>
            </form>
        </div>
    </div>
</div>
<!--注册end-->