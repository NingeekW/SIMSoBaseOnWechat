﻿<%@ page language="java" contentType="text/html; charset=utf-8"
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
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
  <![endif]--><script src="js/jquery.js"></script> 
      <script >
      $(function() {
    	  	var error = "${error}";
    			if(error){
    				alert(error);
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
        	<p>${TAInfo.taName}${stuInfo.stuName}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li><a href="gopersonCenter.htm" id="gopersonCenter"><i class="fa fa-book"></i> <span>个人中心</span></a></li>
       
        <li><a href="allscore.htm" id="score" ><i class="fa fa-book"></i> <span>成绩查询</span></a></li>
       
       
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
        <small>学生</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">个人中心</li>
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
              <h3 class="box-title">个人中心</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form" method="post" class="form-x" action="infoupdata.htm">
                <!-- text input -->
                <div class="form-group">
                  <label>教工号</label>
                  <input type="text" class="form-control"  readonly placeholder="${StuInfo.stuId}" value="${StuInfo.stuId}" name="stuId">
                </div>
                <div class="form-group">
                  <label>姓名</label>
                  <input type="text" class="form-control" required  placeholder="${StuInfo.stuName}" value="${StuInfo.stuName}" name="stuName">
                </div>
                <!-- select -->
                <div class="form-group">
                  <label>性别</label>
                  <select class="form-control"  placeholder="${StuInfo.stuSex}" value="${StuInfo.stuSex}" name="stuSex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>生日</label>
                  <input type="date" class="form-control"  required placeholder="${StuInfo.stuBirth}" value="${StuInfo.stuBirth}" name="stuBirth">
                </div>
                <div class="form-group">
                  <label>民族</label>
                  <input type="text" class="form-control" required placeholder="${StuInfo.stuNation}" value="${StuInfo.stuNation}" name="stuNation">
                </div>
                <div class="form-group">
                  <label>班级</label>
                  <input type="text" class="form-control" required placeholder="${StuInfo.stuClassId}" value="${StuInfo.stuClassId}" name="stuClassId">
                </div>
                <div class="form-group">
                  <label>入职时间</label>
                  <input type="date" class="form-control" required placeholder="${StuInfo.stuEntranceDate}" value="${StuInfo.stuEntranceDate}" name="stuEntranceDate">
                </div>
                <div class="form-group">
                  <label>家庭住址</label>
                  <input type="text" class="form-control" required placeholder="${StuInfo.stuHome}" value="${StuInfo.stuHome}" name="stuHome">
                </div>
                <div class="form-group">
                  <label>政治面貌</label>
                  <select class="form-control"  >
                    <option value="${StuInfo.stuPolitic}">${StuInfo.stuPolitic}</option>
                    <option value="群众">群众</option>
            		<option value="党员">党员</option>
            		<option value="团员">团员</option>
                  </select>
                </div>
 
                <div class="form-group">
                  <label>身份证号</label>
                  <input type="text" class="form-control" required placeholder="${StuInfo.idNumber}" value="${StuInfo.idNumber}" name="idNumber">
                </div>
                <div class="form-group">
                  <label>专业</label>
                  <select class="form-control"   name="stuSpecialty">
                    <option value="${StuInfo.stuSpecialty}">${StuInfo.stuSpecialtyName}</option>
                     <c:forEach items="${Specialtys}" var="spec">
						<option value="${spec.specId}">${spec.specName}</option>						
					</c:forEach>
                  </select>
                </div>
                <div class="form-group">
                  <label>密码</label>
                  <input type="password" class="form-control" required id="InputPassword" placeholder="Password" name="passwd">
                </div>
                

           
				<div class="box-footer">
                <button type="submit" class="btn btn-info pull-right">提交</button>
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