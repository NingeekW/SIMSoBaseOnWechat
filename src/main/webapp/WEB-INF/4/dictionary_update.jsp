<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		<title></title>
		<link rel="stylesheet" href="css/pintuer.css">
		<link rel="stylesheet" href="css/admin.css">
		<script src="js/jquery.js"></script>
		<script src="js/pintuer.js"></script>
	</head>
	
    <body>
		<div class="panel admin-panel">
			<div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 合同详细信息</strong></div>

			<div class="body-content">
				<form method="post" class="form-x" action="updatedicttypeconf.htm">
					<div class="form-group">
						<div class="label">
							<label>字典类型：</label>
						</div>
						<div class="field">
							<input value="${dicttypeconf.dtype }" id="dtype" name="dtype" type="text" class="input" name="stitle" value="" style="width: 20%;float:left;" data-validate="required:请填写字典类型"/>
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>字典类型说明：</label>
						</div>
						<div class="field">
							<input value="${dicttypeconf.tdesc }" id="tdesc" name="tdesc"  type="text" class="input" name="stitle" value="" style="width: 20%;float:left;" data-validate="required:请填写字典类型说明"/>
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>字典代码：</label>
						</div>
						<div class="field">
							<input  value="${dicttypeconf.code }" id="code"  name="code"  type="text" class="input" name="stitle" value="" style="width: 20%;float:left;" data-validate="required:请填写字典代码"/>
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>字典代码说明：</label>
						</div>
						<div class="field">
							<input  value="${dicttypeconf.ddesc }" id="ddesc" name="ddesc" stype="text" class="input" name="stitle" value="" style="width: 40%;float:left;" data-validate="required:请填写字典代码说明"/>
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
							<div class="label">
								<label></label>
							</div>
							<div class="field">
								<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
								<button class="button bg-main icon-refresh" type="reset"> 重置</button>
							<a class="button border-blue" href="<%=request.getHeader("Referer") %>"><span class="icon-step-backward"></span> 返回上级</a>
							</div>
					</div>
				</form>
				
				
			</div>
		</div>
	</body>
</html>