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
              <h3 class="box-title">学院概况</h3>
            </div>
			
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        <!--/.col (right) -->
      </div>
<div class="container fr">
        <div class="p_content">
            <p>武汉工程大学邮电与信息工程学院是国家教育部首批确认具有普通高等教育办学资格的独立学院。学院创建于2002年8月，由武汉工程大学与武汉化院科技有限公司按照新机制、新模式联合举办，是一所以普通本科教育为主，培养化工、材料、通信、电子、经济、管理和艺术等学科领域高级应用型专门人才为主的全日制普通高等学校。</p>



<p>学院注册地址为湖北省武汉市洪山区虎泉街366号（原武汉工程大学老校区），地处武汉东湖国家自主创新示范区“武汉·中国光谷”的中心。学院另设邮科院校区，位于武汉邮电科学研究院内。学院风景秀美，环境幽雅，文化氛围浓郁，交通便利，现代教学与生活设施完备，是莘莘学子学习生活的理想场所。</p>



<p>学院现有38个本科专业，11个专科专业，涉及工学、理学、管理学、经济学、文学、法学、艺术学7个学科门类。现有湖北省独立学院重点培育本科专业3个（化学工程与工艺、自动化、通信工程），省级精品课程2门（《经济法》、《光纤通信技术》），省级精品资源共享本科课程1门（《展示设计》），湖北省普通高等学校战略性新兴（支柱）产业人才培养计划项目4个（通信工程、化学工程与工艺、自动化、市场营销），湖北省专业综合改革试点项目5个（通信工程、自动化、过程装备与控制工程、化学工程与工艺、工程管理），湖北省高等学校省级教学研究项目5个，省教育科学“十二五”规划课题1个，省级重点（培育）学科1个（信息与通信工程学科），省级实习实训基地2个，国家地方所属高校“本科教学工程”大学生校外实践教育基地1个，省级质量工程数量居同类高校首位。2010年3月，学院顺利通过了湖北省独立学院本科专业教学合格评估；2012年5月，学院获得学士学位授予权 。</p>



<p>学院现有全日制在校学生近1万余人，教师总数680人，其中具有硕士学位及以上的比例为85.4%，具有中高级职称的比例79.3%，聘请了国家教育部教学指导委员会专家、企业高管等近40多位专家、学者和知名人士为学院客座教授。学院校园占地面积800余亩，教学行政用房面积16.8万平方米，教学科研仪器设备总值6100余万元，图书64.5万余册。学院建立了湖北省第一个“移动通信实验室”、国内最先进的4G移动通信实验室、高速率大容量光传输实验室和政治理论课网络工作室等有特色的实习实训基地，与中国电信、浙江物产化工集团等100多家国有大中型国企、外资企业、民营企业等建立了密切的校企合作关系。</p>



<p>学院秉承“厚德、明志、勤奋、笃行”的院训，以“促进学生全面发展”为宗旨，坚持“以人为本、规范办学、保证质量、改革创新、提高效益”的办学理念，着力培养学生的社会适应能力、创业能力和实践创新能力，使学生具备突出的专业技能优势。学院坚持开放办学，通过多种形式开展对外交流与合作，增强办学活力。</p>



<p>学院始终突出教学工作的中心地位，狠抓教育教学质量，取得了喜人的成绩。近年来，学院学生在全国大学生数学建模竞赛、电子设计竞赛、艺术设计大赛等国家和省市各类课外科技竞赛中荣获佳绩，其中获国家级奖励近100项，省市级奖励200余项；获省级优秀学士学位论文107篇，湖北省大学生科研成果奖1项。学院毕业生就业率90%以上，考研上线率达到14%，稳居湖北省同类高校前列，受到社会的广泛好评。</p>



        </div>
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
