<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>新建用户</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="docreate.htm">
				<div class="form-group">
					<div class="label">
						<label>用户名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="username"
							data-validate="required:请输入用户名" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" value="" name="pass"
							data-validate="required:请输入密码" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>重复密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" value="" name="repass"
							data-validate="required:请再次输入密码,repeat#pass:两次输入不一致" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>真实姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="name"
							data-validate="required:请输入真实姓名" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>手机号码：</label>
					</div>
					<div class="field">
						<input type="phone" class="input w50" value="" name="phone"
							data-validate="required:请输入手机号码" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>邮箱地址：</label>
					</div>
					<div class="field">
						<input type="email" class="input w50" value="" name="email"
							data-validate="required:请输入邮箱地址" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>所属部门：</label>
					</div>
					<div class="field">
						<select name="cid" class="input w50">
							<option value="">请选择部门</option>
							<c:forEach items="${dlist}" var="d">
								<option value="${d.depId}">${d.depName}</option>
							</c:forEach>
						</select>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>用户角色：</label>
					</div>
					<div class="field">
						<select name="rid" class="input w50">
							<option value="">请选择角色</option>
							<c:forEach items="${rlist}" var="r">
								<option value="${r.roleId}">${r.roleName}</option>
							</c:forEach>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>