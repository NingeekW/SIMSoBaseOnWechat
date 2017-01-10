<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<strong><span class="icon-pencil-square-o"></span>修改用户信息</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="updateMsg.htm?username=${userinfo.username}">
				<div class="form-group">
					<div class="label">
						<label>用户名：</label>
					</div>
					<div class="field">
					<label  style="line-height:33px;">
							${userinfo.username}
					</label>
				    </div>
                </div>
				<div class="form-group">
					<div class="label">
						<label>原密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50"
							value="${userinfo.password}" name="prepass"
							data-validate="required:请输入密码" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>新密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" value="" name="newpass"
							data-validate="required:请再次输入密码" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>重复新密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" value="" name="renewpass"
							data-validate="required:请再次输入密码,repeat#newpass:两次输入密码不一致" />
						<div class="tips"></div>
					</div>
				</div>


				<div class="form-group">
					<div class="label">
						<label>真实姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${userinfo.name}"
							name="name"
							onfocus='if(this.value=="${userinfo.name}"){this.value="";}; '
							data-validate="required:请输入真实姓名" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>手机号码：</label>
					</div>
					<div class="field">
						<input type="phone" class="input w50" value="${userinfo.phone}"
							name="phone"
							onfocus='if(this.value=="${userinfo.phone}"){this.value="";}; '
							data-validate="required:请输入手机号码" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>邮箱地址：</label>
					</div>
					<div class="field">
						<input type="email" class="input w50" value="${userinfo.email}"
							name="email"
							onfocus='if(this.value=="${userinfo.email}"){this.value="";}; '
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
          <label>启用状态：</label>
        </div>
        <div class="field">
          <div class="button-group radio">
          
          <label class="button active">
         	  <span class="icon icon-check"></span>             
              <input name="isshow" value='1' type="radio" checked="checked">启用             
          </label>             
        
          <label class="button active"><span class="icon icon-times"></span>          	
              <input name="isshow" value='0'  type="radio" checked="checked">禁止
          </label>         
           </div>       
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