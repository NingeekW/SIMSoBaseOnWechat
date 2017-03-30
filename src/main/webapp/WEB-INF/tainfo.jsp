<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>学生信息管理系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Font Awesome -->
  
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
   <script src="js/jquery.js"></script> 
      <script >
      $(function() {
    	  	var error = "${error}";
    			if(error){
    				alert(error);
    			}
    			if("<%=session.getAttribute("stuInfo")%>" != "null"){
    				document.getElementById("stulist").setAttribute("class","hidden");//隐藏stulist
    				document.getElementById("stuscorelist").setAttribute("class","hidden");//隐藏stuscorelist
    				document.getElementById("allscore").setAttribute("class","hidden");//隐藏allscore
    				document.getElementById("courselist").setAttribute("class","hidden");//隐藏courselist
    				document.getElementById("talist").setAttribute("class","hidden");//隐藏talist
    				document.getElementById("spec").setAttribute("class","hidden");//隐藏spec
    			}
    			if("<%=session.getAttribute("TAInfo")%>" != "null"){
    				document.getElementById("score").setAttribute("class","hidden");//隐藏score
 					
    			}
    		});
	</script> 
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index.htm" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>SI</b>MS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>学生信息管理</b>系统</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="images/y.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${taInfo.taName}${stuInfo.stuName}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header ">欢迎使用学生信息管理系统</li>
        <li id="gopersonCenter" class="show"><a href="gopersonCenter.htm" ><i class="fa fa-book"></i> <span>个人中心</span></a></li>
        <li><a href="stulist.htm" id="stulist"><i class="fa fa-book"></i> <span>学生信息管理（教师）</span></a></li>
        <li><a href="talist.htm" id="talist"><i class="fa fa-book"></i> <span>教师信息管理（教师）</span></a></li>
        <li><a href="stuscorelist.htm" id="stuscorelist"><i class="fa fa-book"></i> <span>成绩录入（教师）</span></a></li>
        <li><a href="allscore.htm" id="allscore"><i class="fa fa-book"></i> <span>成绩查询（教师）</span></a></li>
        <li><a href="courselist.htm" id="courselist"><i class="fa fa-book"></i> <span>课程信息</span></a></li>
        <li><a href="speclist.htm" id="spec" ><i class="fa fa-book"></i> <span>专业信息</span></a></li>
        <li><a href="changepwd.htm"><i class="fa fa-book"></i> <span>修改密码</span></a></li>
<li><a href="exit.htm"><i class="fa fa-book"></i> <span>安全退出</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        学生信息管理系统
        <small>管理员</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">教师信息管理</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- right column -->
        <div class="col-md-30">
          <!-- Horizontal Form -->
          <!-- /.box -->
                        
          <!-- general form elements disabled -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">教师信息管理</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form" method="post" class="form-x" action="infoupdata.htm">
                <!-- text input -->
                <div class="form-group">
                  <label>教工号</label>
                  <input type="text" class="form-control"  readonly required placeholder="${taInfo.taId}" value="${taInfo.taId}"name="taId">
                </div>
                <div class="form-group">
                  <label>姓名</label>
                  <input type="text" class="form-control" required  placeholder="${taInfo.taName}" value="${taInfo.taName}"name="taName">
                </div>
                <!-- select -->
                <div class="form-group">
                  <label>性别</label>
                  <select class="form-control"   name="taSex">
                   	<option value="${taInfo.taSex}">${taInfo.taSex}</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>生日</label>
                  <input type="date" class="form-control"  required placeholder="${taInfo.taBirth}" value="${taInfo.taBirth}"name="taBirth">
                </div>
                <div class="form-group">
                  <label>民族</label>
                  <input type="text" class="form-control" required placeholder="${taInfo.taNation}" value="${taInfo.taNation}"name="taNation">
                </div>
                <div class="form-group">
                  <label>班级</label>
                  <input type="text" class="form-control" required placeholder="${taInfo.taClassId}" value="${taInfo.taClassId}"name="taClassId">
                </div>
                <div class="form-group">
                  <label>入学时间</label>
                  <input type="date" class="form-control" required placeholder="${taInfo.taEntranceDate}" value="${taInfo.taEntranceDate}"name="taEntranceDate">
                </div>
                <div class="form-group">
                  <label>家庭住址</label>
                  <input type="text" class="form-control" required placeholder="${taInfo.taHome}" value="${taInfo.taHome}"name="taHome">
                </div>
                <div class="form-group">
                  <label>政治面貌</label>
                  <select class="form-control"  name="taPolitic">
                    <option value="${taInfo.taPolitic}">${taInfo.taPolitic}</option>
                    <option value="群众">群众</option>
            		<option value="党员">党员</option>
            		<option value="团员">团员</option>
                  </select>
                </div>
 
                <div class="form-group">
                  <label>身份证号</label>
                  <input type="text" class="form-control" required placeholder="${taInfo.idNumber}" value="${taInfo.idNumber}"name="idNumber">
                </div>
                <div class="form-group">
                  <label>专业</label>
                  <select class="form-control"  name="taSpecialty">
                    <option value="${taInfo.taSpecialty}">${taInfo.taSpecialtyName}</option>
                     <c:forEach items="${Specialtys}" var="spec">
						<option value="${spec.specId}">${spec.specName}</option>						
					</c:forEach>
                  </select>
                </div>
     			<div class="form-group">
                  <label>权限</label>
                  <select class="form-control" name="admin">
                  		<option value="${taInfo.admin}">${taInfo.adminName}</option>
						<option value="0">管理员</option>		
						<option value="1">普通教师</option>						
                  </select>
                </div>
				<div class="box-footer">
               <a class="btn btn-info" href="talist.htm">
                <i class="fa fa-save"></i> 返回
              </a>
                <button type="submit" class="btn btn-danger pull-right">提交</button>
              </div>
              </form>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.7
    </div>
    <strong>Copyright &copy; 2016 <a href="https://ning3f1.cn">学生信息管理系统</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>


            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>

</body>
</html>
