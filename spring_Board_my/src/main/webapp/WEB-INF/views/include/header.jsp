<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="<%=request.getContextPath() %>/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="<%=request.getContextPath() %>/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
      <!-- jQuery 2.1.4 -->
    <script src="<%=request.getContextPath() %>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
  <body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the messages -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <!-- User Image -->
                        <img src="<%=request.getContextPath() %>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <!-- Message title and timestamp -->
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <!-- The message -->
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                </ul>
                <!-- /.menu -->
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- /.messages-menu -->

          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- Inner menu: contains the tasks -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <!-- Task title and progress text -->
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <!-- The progress bar -->
                      <div class="progress xs">
                        <!-- Change the css width attribute to simulate progress -->
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account Menu -->
          <sec:authorize access="!isAuthenticated()">
          <li class="dropdown user user-menu">    
          	<a href="#" class="dropdown-toggle" style="padding:10px;"
          	   data-toggle="dropdown">
          	   <button class="btn btn-primary">Sign in</button>
          	</a>
          	<ul class="dropdown-menu">
          		<!-- menu body -->
          		<li class="user-body">
          			<form action="<%=request.getContextPath() %>/user/loginPost"
          				  method="post">
          				  <input type="hidden" name="returl" value="${param.returl }"/>
          				  <div class="form-group has-feedback">
          				  	<input type="text" name="uid" class="form-control" 
          				  		   placeholder="USER-ID"/>
          				  	<span class="glyphicon glyphicon-envelope form-control-feedback">
          				  	</span>           				  	
          				  </div>
          				  <div class="form-group has-feedback">
          				  	<input type="password" name="upwd" class="form-control" 
          				  		   placeholder="USER-PASSWORD"/>
          				  	<span class="glyphicon glyphicon-envelope form-control-feedback">
          				  	</span>           				  	
          				  </div>
          				  <button type="button" onclick="login_go();"
          				  		  class="btn btn-primary btn-block btn-flat">Sing in</button>
          				  
          			</form>
          		</li>
          	</ul>	        
          </li>
          </sec:authorize>
          
          <sec:authorize access="isAuthenticated()">          
          <li class="dropdown user user-menu">  
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
          		<img src="<%=request.getContextPath() %>/resources/dist/img/user2-160x160.jpg"
          		class="user-image" alt="User Image" />
          		<span class="hidden-xs">${loginUser.username }</span>
          	</a>
          	<ul class="dropdown-menu">
          		<li class="user-header">
          			<img src="<%=request.getContextPath() %>/resources/dist/img/user2-160x160.jpg"
          				 class="img-circle" alt="User Image" />
	          		<p>
	          			${loginUser.userid } : ${loginUser.username } 님 환영합니다.
	          			<small>등록일 : ${loginUser.regDate }</small>
	          		</p>
          		</li>
          		
          		<li class="user-body">
          			<button class="btn btn-primary btn-block btn-flat"
          			onclick="logout_go();">Sign out</button>
          		</li>
          	</ul> 
          	 
          </li>
          </sec:authorize>
          
          
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<%=request.getContextPath() %>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header"><strong>관리자 메뉴</strong></li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="sboard/listPage"><i class="fa fa-link"></i> <span>게시판 관리</span></a></li>
        <li><a href="product/listPage"><i class="fa fa-link"></i> <span>상품 관리</span></a></li>
        <li class="treeview">
          <a href="member/listPage"><i class="fa fa-link"></i> <span>회원 관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">Link in level 2</a></li>
            <li><a href="#">Link in level 2</a></li>
          </ul>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Board Management
            <small>Preview</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Forms</a></li>
            <li class="active">General Elements</li>
          </ol>
        </section>

<script>
	$('ul.sidebar-menu li a').on('click',function(event){
		
		event.preventDefault();
		
		var uri=$(this).attr("href");
		
		self.location="<c:url value="/" />"+uri;
	});
	
	function login_go(){
		$.ajax({
			url:"<%=request.getContextPath()%>/user/loginPost",
			data:$('form').serialize(),
			type:"post",
			dataType:'json',				
			beforeSend:function(xhr){
				xhr.setRequestHeader("Accept","application/json");			
			}
		}).done(function(body){
			var message=body.message;
			var retUrl=body.retUrl;
			var error=body.error;
			
			alert(message);
			
			if(error){
				$('input[name="upwd"]').val("");
			}else{
				location.href=retUrl;					
			}
		});
	};
	function logout_go(){
		location.href="<%=request.getContextPath()%>/user/logout";		
	};	
</script>











 