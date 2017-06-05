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
  <![endif]-->
  <script src="js/jquery.js"></script> 
  <script type="text/javascript">
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
			if("<%=session.getAttribute("TAInfo")%>" != "null" ){
				document.getElementById("score").setAttribute("class","hidden");//隐藏score
				document.getElementById("talist").setAttribute("class","hidden");//隐藏talist
				document.getElementById("spec").setAttribute("class","hidden");//隐藏spec
				document.getElementById("courselist").setAttribute("class","hidden");//隐藏courselist
			}
			if("<%=session.getAttribute("AdminInfo")%>" != "null"){
  				document.getElementById("score").setAttribute("class","hidden");//隐藏allscore
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
          <img src="images/y.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
        	<p>${TAInfo.taName}${stuInfo.stuName}${AdminInfo.adminName}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">欢迎使用学生信息管理系统</li>
        <li><a href="gopersonCenter.htm" id="gopersonCenter"><i class="fa fa-book"></i> <span>个人中心</span></a></li>
        <li><a href="stulist.htm" id="stulist"><i class="fa fa-book"></i> <span>学生信息管理（教师）</span></a></li>
        <li><a href="talist.htm" id="talist"><i class="fa fa-book"></i> <span>教师信息管理（管理员）</span></a></li>
        <li><a href="stuscorelist.htm" id="stuscorelist"><i class="fa fa-book"></i> <span>成绩录入（教师）</span></a></li>
        <li><a href="allscore.htm" id="allscore"><i class="fa fa-book"></i> <span>成绩查询（教师）</span></a></li>
        <li><a href="allscore.htm" id="score" ><i class="fa fa-book"></i> <span>成绩查询</span></a></li>
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
       欢迎使用学生信息管理系统
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
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
              <h3 class="box-title">通知公告</h3>
            </div>
			
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        <!--/.col (right) -->
      </div>
<div class="lead">
       <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8422" target="_blank">关于2017年青年节假日安排的通知</a></dt>
            <dd>[2017-05-02]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8420" target="_blank">无线电台设备采购招标公告 (2017-4)</a></dt>
            <dd>[2017-04-26]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8419" target="_blank">多媒体设备招标公告 (2017-3)</a></dt>
            <dd>[2017-04-26]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8417" target="_blank">关于2017年劳动节假日安排的通知</a></dt>
            <dd>[2017-04-25]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8416" target="_blank">关于举办2017年校园微视频大赛的通知</a></dt>
            <dd>[2017-04-24]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8405" target="_blank">2017年招聘公告 （第四号）</a></dt>
            <dd>[2017-04-13]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8401" target="_blank">教材招标公告</a></dt>
            <dd>[2017-04-10]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8399" target="_blank">2017年辅导员招聘公告 （第三号）</a></dt>
            <dd>[2017-04-05]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8393" target="_blank">关于2017年清明节假日安排的通知</a></dt>
            <dd>[2017-03-27]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8391" target="_blank">2017年辅导员招聘公告（第二号） 关于开展2017年辅导员招聘面试的通知</a></dt>
            <dd>[2017-03-22]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8387" target="_blank">服务器采购项目中标公告2017-（2）</a></dt>
            <dd>[2017-03-17]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8385" target="_blank">关于2017年辅导员招聘考试准考证信息填写的通知</a></dt>
            <dd>[2017-03-13]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8379" target="_blank">招标公告 2017-(2)</a></dt>
            <dd>[2017-03-07]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8377" target="_blank">2017年辅导员招聘公告（第一号）</a></dt>
            <dd>[2017-03-06]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8376" target="_blank">关于2017年妇女节假日安排的通知</a></dt>
            <dd>[2017-03-06]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8371" target="_blank">2017年实验员招聘启事</a></dt>
            <dd>[2017-02-28]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8367" target="_blank">2017年教师招聘启事</a></dt>
            <dd>[2017-02-20]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8368" target="_blank">2016年度教职工考核优秀人员名单公示</a></dt>
            <dd>[2017-02-19]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8361" target="_blank">实验室改造项目中标公告</a></dt>
            <dd>[2017-01-18]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8360" target="_blank">实验室改造工程招标公告 (2017-1)</a></dt>
            <dd>[2017-01-09]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8359" target="_blank">关于期末及寒假工作安排的通知</a></dt>
            <dd>[2017-01-06]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8349" target="_blank">关于2017年元旦假日安排的通知</a></dt>
            <dd>[2016-12-27]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8353" target="_blank">2016年度履职尽责工作项目考核清单公示</a></dt>
            <dd>[2016-12-25]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8344" target="_blank">2016年院工会先进集体和工会活动积极分子评选公示</a></dt>
            <dd>[2016-12-20]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8343" target="_blank">关于余子牛等同志任职试用期满的考察预告</a></dt>
            <dd>[2016-12-20]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8342" target="_blank">2017年招聘计划</a></dt>
            <dd>[2016-12-20]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8338" target="_blank">2016年度工会福利物资供应项目中标公告</a></dt>
            <dd>[2016-12-17]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8334" target="_blank">招标公告2016-(27)</a></dt>
            <dd>[2016-12-09]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8315" target="_blank">2016、2017年度办公用纸和办公耗材协议供应商项目中标公告</a></dt>
            <dd>[2016-11-17]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8301" target="_blank">二级网站建设项目中标公告</a></dt>
            <dd>[2016-11-04]</dd>
        </dl>
                <div style="text-align: right"><ul class="pagination"><li class="disabled"><span>«</span></li> <li class="active"><span>1</span></li><li><a href="http://www.witpt.edu.cn/list/51?page=2">2</a></li><li><a href="http://www.witpt.edu.cn/list/51?page=3">3</a></li><li><a href="http://www.witpt.edu.cn/list/51?page=4">4</a></li><li><a href="http://www.witpt.edu.cn/list/51?page=5">5</a></li><li><a href="http://www.witpt.edu.cn/list/51?page=6">6</a></li><li><a href="http://www.witpt.edu.cn/list/51?page=7">7</a></li><li><a href="http://www.witpt.edu.cn/list/51?page=8">8</a></li><li class="disabled"><span>...</span></li><li><a href="http://www.witpt.edu.cn/list/51?page=11">11</a></li><li><a href="http://www.witpt.edu.cn/list/51?page=12">12</a></li> <li><a href="http://www.witpt.edu.cn/list/51?page=2" rel="next">»</a></li></ul></div>
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

            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">

            </a>
          </li>
          <li>
            <a href="javascript:void(0)">


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
