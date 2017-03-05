<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>学生信息管理系统登录</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("img[src='gercode']").click(function() {
				$(this).attr("src", "gercode?no-cache=" + Math.random());
			});
			
			var info = "${info}";
			if(info){
				alert(info);
			}
		});
		
	</script>
</head>
<body>
	<div class="bg"></div>
	<div class="container">
		<div class="line bouncein">
			<div class="xs6 xm4 xs3-move xm4-move">
				<div style="height: 120px;">
				</div>
				<div class="media media-y margin-big-bottom"></div>
				<form action="dologin.htm" method="post">
					<div class="panel loginbox">
						<div class="text-center margin-big padding-big-top">
							<h1>学生信息管理系统</h1>
						</div>
						<div class="panel-body"
							style="padding: 30px; padding-bottom: 10px; padding-top: 10px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input input-big" name="username"
										placeholder="登录账号" data-validate="required:请填写账号" /> <span
										class="icon icon-user margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password"
										placeholder="登录密码" data-validate="required:请填写密码" /> <span
										class="icon icon-key margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field">
									<input type="text" class="input input-big" name="vercode"
										placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
									<img src="gencode" alt="" width="100" height="32"
										class="passcode" style="height: 43px; cursor: pointer;"
										onclick="this.src=this.src+'?'">

								</div>
							</div>
						</div>
						<div style="padding: 5px;">
							<input type="submit"
								class="button button-block bg-main"
								value="登录"><br>
							<input type="reset"
								class="button button-block bg-red"
								value="重置">		
						</div>
						<div class="input-block">
						<ul><a href="findpass.htm"> <li style="text-align: right">忘记密码？</li> </a></ul>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>