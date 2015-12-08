<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>SET New Scoop</title>
	<meta name="description" content="description">
	<meta name="author" content="DevOOPS">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="/SETNewScoop/js/plugins/jquery/jquery-2.1.0.min.js"></script>
	<link href="/SETNewScoop/js/plugins/bootstrap/bootstrap.css" rel="stylesheet">
	<link href="/SETNewScoop/js/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	<link href="/SETNewScoop/js/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="/SETNewScoop/js/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
	<link href="/SETNewScoop/js/plugins/xcharts/xcharts.min.css" rel="stylesheet">
	<link href="/SETNewScoop/js/plugins/select2/select2.css" rel="stylesheet">
	<link href="/SETNewScoop/css/style.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
	<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
<!--Start Header-->
<div id="screensaver">
	<canvas id="canvas"></canvas>
	<i class="fa fa-lock" id="screen_unlock"></i>
</div>
<div id="modalbox">
	<div class="devoops-modal">
		<div class="devoops-modal-header">
			<div class="modal-header-name">
				<span>Basic table</span>
			</div>
			<div class="box-icons">
				<a class="close-link">
					<i class="fa fa-times"></i>
				</a>
			</div>
		</div>
		<div class="devoops-modal-inner">
		</div>
		<div class="devoops-modal-bottom">
		</div>
	</div>
</div>
<header class="navbar">
	<div class="container-fluid expanded-panel">
		<div class="row">
			<div id="logo" class="col-xs-12 col-sm-2">
				<a href="/SETNewScoop">SETNewScoop</a>
			</div>
			<div id="top-panel" class="col-xs-12 col-sm-10">
				<div class="row">
					<div class="col-xs-8 col-sm-4">
						<a href="#" class="show-sidebar">
							<i class="fa fa-bars"></i>
						</a>
					</div>
					<div class="col-xs-4 col-sm-8 top-panel-right">
						<ul class="nav navbar-nav pull-right panel-menu">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle account" data-toggle="dropdown">
									<div class="avatar">
										<img src="/SETNewScoop/images/icon-user-default.png" class="img-rounded" alt="avatar" />
									</div>
									<i class="fa fa-angle-down pull-right"></i>
									<div class="user-mini pull-right">
										<span class="welcome">Welcome,</span>
										<span><sec:loggedInUserInfo field="username"/></span>
									</div>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="/SETNewScoop/user/changePassword">
											<i class="fa fa-cog"></i>
											<span>Change Password</span>
										</a>
									</li>
									<li>
										<a href="/SETNewScoop/j_spring_security_logout">
											<i class="fa fa-power-off"></i>
											<span>Logout</span>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!--End Header-->
<!--Start Container-->
<div id="main" class="container-fluid">
	<div class="row">
		<div id="sidebar-left" class="col-xs-2 col-sm-2">
			<ul class="nav main-menu">
				<sec:ifAnyGranted roles="ADMIN">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle">
							<i class="fa fa-user"></i>
							<span class="hidden-xs">จัดการ User</span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="/SETNewScoop/user/create">สร้าง User</a></li>
							<li><a href="/SETNewScoop/user/">รายการ User</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="/SETNewScoop/queryPage">
							<i class="fa fa-table"></i>
							<span class="hidden-xs">Query Page</span>
						</a>
					</li>
				</sec:ifAnyGranted>
				<sec:ifAnyGranted roles="USER">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle">
							<i class="fa fa-user"></i>
							<span class="hidden-xs">ข้อมูลสมาชิกสหกรณ์</span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="/SETNewScoop/member/create">สมัครสมาชิกสหกรณ์</a></li>
							<li><a href="/SETNewScoop/member/editMember">แก้ไขข้อมูลสมาชิก</a></li>
							<li><a href="/SETNewScoop/member/resignMember">สมาชิกลาออก</a></li>
							<li><a href="/SETNewScoop/member/changeSharedMember">การเปลี่ยนแปลงค่าหุ้นของสมาชิก</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle">
							<i class="fa fa-money"></i>
							<span class="hidden-xs">สัญญาเงินกู้</span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="/SETNewScoop/loan/addLoan">เพิ่มข้อมูลสัญญาเงินกู้</a></li>
							<li><a href="/SETNewScoop/loan/editLoan">แก้ไขข้อมูลสัญญาเงินกู้</a></li>
						</ul>
					</li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-10">
			%{--<div class="preloader">
				<img src="/SETNewScoop/images/devoops_getdata.gif" class="devoops-getdata" alt="preloader" style="display: none"/>
			</div>--}%
			<div id="ajax-content">
				<g:layoutBody/>
			</div>
		</div>
		<!--End Content-->
	</div>
</div>
<!--End Container-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="http://code.jquery.com/jquery.js"></script>-->
<script src="/SETNewScoop/js/plugins/jquery/jquery-2.1.0.min.js"></script>
<script src="/SETNewScoop/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/SETNewScoop/js/plugins/bootstrap/bootstrap.min.js"></script>
<script src="/SETNewScoop/js/plugins/justified-gallery/jquery.justifiedgallery.min.js"></script>
<script src="/SETNewScoop/js/plugins/tinymce/tinymce.min.js"></script>
<script src="/SETNewScoop/js/plugins/tinymce/jquery.tinymce.min.js"></script>
<!-- All functions for this theme + document.ready processing -->
<script src="/SETNewScoop/js/devoops.js"></script>
<script src="/SETNewScoop/js/validation.js"></script>
</body>
</html>

