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
              <h3 class="box-title">学院新闻</h3>
            </div>
			
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        <!--/.col (right) -->
      </div>
<div class="lead">
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8425" target="_blank">学院党委书记邓新洲同志为机关二支部和机电系第八党支部上专题党课</a></dt>
            <dd>[2017-05-03]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8423" target="_blank">我院学生在湖北省第二十三届外语翻译大赛中再获佳绩</a></dt>
            <dd>[2017-05-02]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8421" target="_blank">我院代表队在湖北省第十三届“江城之星”心理知识竞赛中荣获佳绩</a></dt>
            <dd>[2017-04-25]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8412" target="_blank">宜都市张家冲村来院对接精准扶贫帮扶工作</a></dt>
            <dd>[2017-04-21]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8414" target="_blank">学院举行第18期预备党员培训班开班典礼</a></dt>
            <dd>[2017-04-18]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8408" target="_blank">建筑工程系举行首届班歌大赛暨基层团支部风采展示活动</a></dt>
            <dd>[2017-04-17]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8415" target="_blank">学院党委中心组集体学习全国高校思想政治工作会议精神</a></dt>
            <dd>[2017-04-16]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8407" target="_blank">学院组织第二批讲师团深入地方高中开展系列讲座</a></dt>
            <dd>[2017-04-15]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8406" target="_blank">我院学子在第二十届“外研社杯”全国大学生英语辩论赛中再创佳绩</a></dt>
            <dd>[2017-04-13]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8413" target="_blank">学院第59期入党积极分子暨第1期发展对象培训班开班</a></dt>
            <dd>[2017-04-10]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8400" target="_blank">如何做好大学生创新创业大赛准备工作——武汉工程大学张志教授做客我院教授博士论坛</a></dt>
            <dd>[2017-04-07]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8398" target="_blank">化学工业与你、我、Ta——武汉工程大学郭嘉教授做客学院教授博士论坛</a></dt>
            <dd>[2017-03-31]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8392" target="_blank">我院举办“青年之声•百企万岗”大学生就业公益招聘会暨2017届毕业生春季校园招聘会</a></dt>
            <dd>[2017-03-23]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8388" target="_blank">我院工程造价本科新专业成功获批</a></dt>
            <dd>[2017-03-20]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8382" target="_blank">我院2015级工程管理01班团支部获全国高校“活力团支部”荣誉称号</a></dt>
            <dd>[2017-03-09]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8373" target="_blank">学院领导到邮科院校区进行新学期教育教学督导</a></dt>
            <dd>[2017-02-27]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8369" target="_blank">年终慰问送温暖 精准扶贫暖人心——学院领导率队赴宜都开展精准扶贫慰问活动</a></dt>
            <dd>[2017-01-19]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8358" target="_blank">我院两项目获批2016湖北省高校省级教学研究项目</a></dt>
            <dd>[2017-01-05]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8357" target="_blank">我院举行2015-2016学年辅导员、班主任职业技能大赛决赛</a></dt>
            <dd>[2016-12-29]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8345" target="_blank">2016年大学生职业发展与就业创业指导系列活动圆满完成</a></dt>
            <dd>[2016-12-22]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8340" target="_blank">【武汉晨报】自强大学生 参选自强之星</a></dt>
            <dd>[2016-12-20]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8337" target="_blank">学院召开2016年招生就业工作总结暨表彰大会</a></dt>
            <dd>[2016-12-14]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8336" target="_blank">我院举办2016年青年教师教学基本功竞赛</a></dt>
            <dd>[2016-12-13]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8335" target="_blank">学院举办2016年校园情景剧大赛</a></dt>
            <dd>[2016-12-12]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8331" target="_blank">我院定向越野队在2016年湖北省大学生定向越野比赛中喜获佳绩</a></dt>
            <dd>[2016-12-08]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8330" target="_blank">定格校园 美时美刻——学院举办首届校园摄影大赛</a></dt>
            <dd>[2016-12-07]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8327" target="_blank">我院举办党的十八届六中全会精神学习辅导报告会</a></dt>
            <dd>[2016-12-06]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8328" target="_blank">唱响红色旋律 践行“两学一做”——学院举办红歌合唱比赛</a></dt>
            <dd>[2016-12-05]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8325" target="_blank">我院召开期中教学检查工作汇报会</a></dt>
            <dd>[2016-12-03]</dd>
        </dl>
                <dl class="list02">
            <dt><a href="http://www.witpt.edu.cn/news/8324" target="_blank">澳洲桑瑞亚理工学院、拉筹伯大学一行来访我院</a></dt>
            <dd>[2016-12-03]</dd>
        </dl>
                <div style="text-align: right"><ul class="pagination"><li class="disabled"><span>«</span></li> <li class="active"><span>1</span></li><li><a href="http://www.witpt.edu.cn/list/50?page=2">2</a></li><li><a href="http://www.witpt.edu.cn/list/50?page=3">3</a></li><li><a href="http://www.witpt.edu.cn/list/50?page=4">4</a></li><li><a href="http://www.witpt.edu.cn/list/50?page=5">5</a></li><li><a href="http://www.witpt.edu.cn/list/50?page=6">6</a></li><li><a href="http://www.witpt.edu.cn/list/50?page=7">7</a></li><li><a href="http://www.witpt.edu.cn/list/50?page=8">8</a></li><li class="disabled"><span>...</span></li><li><a href="http://www.witpt.edu.cn/list/50?page=47">47</a></li><li><a href="http://www.witpt.edu.cn/list/50?page=48">48</a></li> <li><a href="http://www.witpt.edu.cn/list/50?page=2" rel="next">»</a></li></ul></div>
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
