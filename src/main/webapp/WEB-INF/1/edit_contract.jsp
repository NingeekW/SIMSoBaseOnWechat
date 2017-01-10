<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="js/jquery.js"></script>
 <link rel="stylesheet" href="css/pintuer.css">
 <link rel="stylesheet" href="css/admin.css">
 <script src="js/pintuer.js"></script>
 <script src="inc/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function(){
	});
	
	function checkFile() {
		//用元素的id获得该元素的值，从而进行判断选择的文件是否合法  
		var file = document.getElementById("cont_path").value;
		if (file == null || file == "") {
			alert("未选择文件!");
			return false;
		}
		if (file.lastIndexOf(".") == -1) {
			alert("路径不正确!");
			return false;
		}
		var allType = ".doc|.docx|";//可扩展类型
		var extName = file.substring(file.lastIndexOf("."));
		if (allType.indexOf(extName + "|") == -1) {
			errMsg = "请上传 " + allType + " 类型的文件，当前文件类型为" + extName;
			alert(errMsg);
			document.getElementById("cont_path").value="";
			return false;
		}
	}
</script>
</head>
<body>
	<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 创建合同</strong></div>
  <div class="body-content" style="margin-left: 100px;">
    <form method="post" class="form-x" action="modify_contract.htm"  enctype="multipart/form-data">  
      <c:if test="${result != null}">
      	 <div class="form-group" >
	        <div class="label" >
	          <label for="sitename">操作结果：</label>
	        </div>
	        <div class="field">
	          <label for="sitename" style="color: red;">${result }</label>      
	        </div>
	      </div>      
      </c:if>
      <!-- cid -->
     <input type="hidden" name="cid" value="${contract.cid }">
      <div class="form-group">
        <div class="label">
          <label for="sitename">合同编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="cont_no" name="cont_no" size="50" value="${contract.contNo }" readonly="readonly" />       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">合同名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="cont_name" name="cont_name" size="50" value="${contract.contName }" data-validate="required:请输入合同名称" />         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">合同类型：</label>
        </div>
        <div class="field">
      		<select id="cont_type" name="cont_type" class="input w50" >
      			<c:forEach items="${ctype }" var="d">
        	 		 <option value="${d.code }" <c:if test="${d.code == contract.contType }">selected="selected"</c:if>>${d.ddesc }</option>
        	 	</c:forEach>
             <%--  <option value="201" <c:if test="${contract.contType == '201' }">selected="selected"</c:if>>买卖合同</option>
              <option value="202" <c:if test="${contract.contType == '202' }">selected="selected"</c:if>>供用电、水、气、热力合同</option>
              <option value="203" <c:if test="${contract.contType == '203' }">selected="selected"</c:if>>借款合同</option>
              <option value="204" <c:if test="${contract.contType == '204' }">selected="selected"</c:if>>赠与合同</option>
              <option value="205" <c:if test="${contract.contType == '205' }">selected="selected"</c:if>>租赁合同</option>
              <option value="206" <c:if test="${contract.contType == '206' }">selected="selected"</c:if>>融资租赁合同</option>
              <option value="207" <c:if test="${contract.contType == '207' }">selected="selected"</c:if>>承揽合同</option>
              <option value="208" <c:if test="${contract.contType == '208' }">selected="selected"</c:if>>建设工程合同</option>
              <option value="209" <c:if test="${contract.contType == '209' }">selected="selected"</c:if>>运输合同</option>
              <option value="210" <c:if test="${contract.contType == '210' }">selected="selected"</c:if>>技术合同</option>
              <option value="211" <c:if test="${contract.contType == '211' }">selected="selected"</c:if>>保管合同</option>
              <option value="212" <c:if test="${contract.contType == '212' }">selected="selected"</c:if>>仓储合同</option>
              <option value="213" <c:if test="${contract.contType == '213' }">selected="selected"</c:if>>委托合同</option>
              <option value="214" <c:if test="${contract.contType == '214' }">selected="selected"</c:if>>行纪合同</option>
              <option value="215" <c:if test="${contract.contType == '215' }">selected="selected"</c:if>>居间合同</option>
             --%></select>
        </div>
      </div>
        <div class="form-group">
	        <div class="label">
	          <label for="sitename">所属部门：</label>
	        </div>
	        <div class="field">
	        	<select id="depart_id" name="depart_id" class="input w50"">
	            	 <c:forEach items="${departs }" var="d">
        	 		 <option value="${d.depId }" <c:if test="${contract.departId == d.depId }">selected="selected"</c:if>>${d.depName }</option>
        	 		</c:forEach>
	             <%--  <option value="1" <c:if test="${contract.departId == '1' }">selected="selected"</c:if>>研发部门</option>
	              <option value="2" <c:if test="${contract.departId == '2' }">selected="selected"</c:if>>人力部门</option>
	              <option value="3" <c:if test="${contract.departId == '3' }">selected="selected"</c:if>>财务部门</option>
	            --%> </select> 
	        </div>
	      </div>
       <div class="form-group">
        <div class="label">
          <label for="sitename">履行开始日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="perform_start_date" name="perform_start_date" size="50" value="<fmt:formatDate value="${contract.performStartDate}" pattern="yyyy-MM-dd"/>"  data-validate="required:请选择开始日期" onclick="laydate()"/>       
        </div>
      </div>    
       <div class="form-group">
        <div class="label">
          <label for="sitename">履行结束日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="perform_end_date" name="perform_end_date" size="50" value="<fmt:formatDate value="${contract.performEndDate}" pattern="yyyy-MM-dd"/>" data-validate="required:请选择结束日期" />       
        </div>
      </div>  
       <div class="form-group">
        <div class="label">
          <label for="sitename">收付类型：</label>
        </div>
        <div class="field">
        	<select id="io" name="io" class="input w50">
        		 <c:forEach items="${mtype }" var="m">
        	 		 <option value="${m.code }" <c:if test="${contract.io == m.code }">selected="selected"</c:if>>${m.ddesc }</option>
        	 		</c:forEach>
	            <%--   <option value="1" <c:if test="${contract.io == '1' }">selected="selected"</c:if>>收款</option>
	              <option value="2" <c:if test="${contract.io == '2' }">selected="selected"</c:if>>付款</option>
	        --%> </select>   
        </div>
      </div>  
       <div class="form-group">
        <div class="label">
          <label for="sitename">合同总额(元)：</label>
        </div>
        <div class="field">
        	  <input type="text" class="input w50" id="total_fund" name="total_fund" size="50" value="${contract.totalFund }" data-validate="required:请选输入合同总额" />       
        </div>
      </div>  
       <div class="form-group">
        <div class="label">
          <label for="sitename">合同状态：</label>
        </div>
        <div class="field">
        	 <select id="state" name="state" class="input w50">
        	 		<c:forEach items="${state }" var="d">
	        	 		 <option value="${d.code }" <c:if test="${contract.state == d.code }">selected="selected"</c:if>>${d.ddesc }</option>
	        	 	</c:forEach>
	              <%-- <option value="101" <c:if test="${contract.state == '101' }">selected="selected"</c:if>>待审批</option>
	              <option value="102" <c:if test="${contract.state == '102' }">selected="selected"</c:if>>待签订</option>
	              <option value="103" <c:if test="${contract.state == '103' }">selected="selected"</c:if>>执行中</option>
	              <option value="104" <c:if test="${contract.state == '104' }">selected="selected"</c:if>>已结束</option>
	         --%> </select>   
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label for="sitename">甲方单位：</label>
        </div>
        <div class="field">
        	<input type="text" class="input w50" id="oper_a" name="oper_a" size="50" value="${contract.operA }" data-validate="required:请输入单位名称" />       
      
        	 <%-- <select id="oper_a" name="oper_a" class="input w50" ">
        	 	  <c:forEach items="${enterpressInfos }" var="e">
	        	 		 <option value="${e.enId }" <c:if test="${contract.operA == e.edId }">selected="selected"</c:if>>${e.enName }</option>
	        	 	</c:forEach>
	              <option value="1" <c:if test="${contract.operA == '1' }">selected="selected"</c:if>>百度公司</option>
	              <option value="2" <c:if test="${contract.operA == '2' }">selected="selected"</c:if>>腾讯公司</option>
	              <option value="3" <c:if test="${contract.operA == '3' }">selected="selected"</c:if>>阿里啊啊</option>
	         </select>    --%>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label for="sitename">甲方负责人：</label>
        </div>
        <div class="field">
        	<input type="text" class="input w50" id="principal_a" name="principal_a" size="50" value="${contract.principalA }" data-validate="" />       
        	
        	<!--  <select id="principal_a" name="principal_a" class="input w50" onchange="changesearch()">
	              <option value="">张三</option>
	              <option value="">李斯</option>
	              <option value="">王五</option>
	         </select>   --> 
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label for="sitename">已方单位：</label>
        </div>
        <div class="field">
        	<input type="text" class="input w50" id="oper_b" name="oper_b" size="50" value="${contract.operB}" data-validate="required:请输入单位名称" />       
      
        	<%--  <select id="oper_b" name="oper_b" class="input w50" onchange="changesearch()">
        	 	  <c:forEach items="${enterpressInfos }" var="e">
	        	 		 <option value="${e.enId }" <c:if test="${contract.operA == e.edId }">selected="selected"</c:if>>${e.enName }</option>
	        	 	</c:forEach>
	              <option value="1" <c:if test="${contract.operB == '1' }">selected="selected"</c:if>>百度公司</option>
	              <option value="2" <c:if test="${contract.operB == '2' }">selected="selected"</c:if>>腾讯公司</option>
	              <option value="3" <c:if test="${contract.operB == '3' }">selected="selected"</c:if>>阿里啊啊</option>
	         </select>    --%>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label for="sitename">已方负责人：</label>
        </div>
        <div class="field">
        	 <input type="text" class="input w50" id="principal_b" name="principal_b" size="50" value="${contract.principalB} " data-validate="" />       
        	 <!-- <select id="principal_b" name="principal_b" class="input w50" onchange="changesearch()">
	              <option value="">张三</option>
	              <option value="">李斯</option>
	              <option value="">王五</option>
	         </select>   --> 
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label for="sitename">创建人：</label>
        </div>
        <div class="field">
        	  <input type="text" class="input w50" id="create_oper" name="create_oper" size="50" value="${contract.createOper }" readonly="readonly" />       
        </div>
      </div> 
       <div class="form-group">
        <div class="label">
          <label for="sitename">创建日期：</label>
        </div>
        <div class="field">
        	  <input type="text" class="input w50" id="create_date" name="create_date" size="50" value="<fmt:formatDate value="${contract.createDate}" pattern="yyyy-MM-dd"/>" readonly="readonly"/>       
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label for="sitename">合同文件：</label>
        </div>
        <div class="field">
        	<input type="hidden" name="expath" value="${contract.contPath }"/>
        	<p>已上传：${fn:substringAfter(contract.contPath, 'contract/')}</p>
        	  <input type="file" class="input w50" id="cont_path" name="cont_path" size="50"  data-validate="" onchange="return checkFile(this);"/>       
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" id="submit" type="submit" > 提交</button>   
        </div>
      </div>      
    </form>
  </div>
</div>
</body>
<script>
		;!function(){
		laydate({
		   elem: '#perform_end_date'
		})
		}();
	</script>
</html>