<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="zh-cn">
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
<form method="post" action="over.htm" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 待归档合同列表[${over_total}]</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>搜索：</li>
        <li>签订时间
          <select name="s_ishome" class="input" onchange="changesearch()" style="width:120px; line-height:17px; display:inline-block">
            <option value="">选择</option>
            <option value="">2016-07-01</option>
            <option value="">2017-07-01</option>
			<option value="">2018-07-01</option>
          </select>
          &nbsp;&nbsp;
	  
        </li>
      
          <li>分类
            <select name="cid" class="input" style="width:200px; line-height:17px;display:inline-block" onchange="changesearch()">
              <option value="">请选择分类</option>
			  <option value="">软件</option>
              <option value="">工程</option>
              <option value="">金融</option>
              <option value="">银行</option>
			  <option value="">工厂</option>
			  <option value="">政府</option>
            </select>
          </li>
      <li>
        <div>
          <input type="text" placeholder="请输入搜索关键字" name="contName" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type ="submit"  class="button border-main icon-search" onclick="changesearch()"  value="提交"/>
        </div>  
      </li>
          
  <!--   <div>	
  		合同名：<input type="text" name="contName" />
  		<input type ="submit" value="提交"/>
  	</div>
 -->
       
      </ul>
    </div>
  <!--   <div>
    
          <input type="text" placeholder="请输入搜索关键字" name="contName" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type ="submit"  class="button border-main icon-search" onclick="changesearch()"  value="提交"/>
          
    </div>   -->    
    <table class="table table-hover text-center">
        <tr>
          <th width="150" style="text-align:left; padding-left:20px;">ID</th>
          <th width="310">合同名称</th>
          <th width="310">合同状态</th>
          <th width="310">合同类型</th>
          <th width="310">签订时间</th>
          <th width="310">操作</th>
        </tr>

      <c:forEach items="${list}" var="li" >
           <tr>
          <td  style="text-align:left; padding-left:20px;"><input type="checkbox" name="check" value="${li.getCid()}" />${li.getCid()}</td>
          <td>${li.getContName()}</td>
          <td><font color="#00CC99">${li.getState()}</font></td>
          <td>${li.getContType()}</td>
          <td>${li.getSignDate()}</td>
          <td><div class="button-group"> <a class="button border-main" href="upload.htm?id=${li.getCid()}"><span class="icon-edit"></span> 归档</a> <a class="button border-black" href="show_all.htm?=${li.getCid()}" >详情</a> </div></td>
        </tr>
        
      </c:forEach> 
		
        <tr>
          <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>全选 </td>
          <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a></td>
        </tr>
        
        <tr>
          <td colspan="5"><div class="pagelist">
      		${page.pageStr}
      	 </div></td>
        </tr>
		 <!--  <tr>
          <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
        </tr> -->
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='check']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='check']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}


</script>
</body>
</html>