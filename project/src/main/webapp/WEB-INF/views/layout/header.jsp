<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>사람을 만나는 방법, HowMeet?</title>

<!-- 부트스트랩,font-awsome 부분 필요 CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<!-- 페이지 구성 CSS -->
<link href="resources/css/style.css" rel="stylesheet">
<!-- Main style -->
<link rel="stylesheet" type="text/css" href="resources/css/cardio.css">
<!-- Normalize -->
<link rel="stylesheet" type="text/css" href="resources/css/normalize.css">
<!-- Owl -->
<link rel="stylesheet" type="text/css" href="resources/css/owl.css">
<!-- Animate.css -->
<link rel="stylesheet" type="text/css" href="resources/css/animate.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.1.0/css/font-awesome.min.css">
<!-- Elegant Icons -->
<link rel="stylesheet" type="text/css" href="resources/fonts/eleganticons/et-icons.css">
<!-- carousel video -->
<link href="resources/css/responsive_bootstrap_carousel_mega_min.css" rel="stylesheet" media="all">

<!-- 제이쿼리 부분 -->
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/wow.min.js"></script>
<script src="resources/js/typewriter.js"></script>
<script src="resources/js/jquery.onepagenav.js"></script>
<script src="resources/js/main.js"></script>

<!-- 회원가입 창 디자인(차후 외부CSS로) -->
<style>
.mainframe{padding:0; margin-top:50px; background:#f7f7f7;}
.logoframe{height:100px; padding-top:30px; padding-bottom:20px; border-bottom:2px solid #e9e9e9;}
.memberframe,.sendframe{padding:30px; border-bottom:2px solid #e9e9e9;}
.slogan{font-size:20px;}
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div class="preloader">
		<img src="resources/images/loader.gif" alt="Preloader image">
	</div>
	<!-- 상단 메뉴바 시작 -->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mynavbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">
				<img src="resources/images/logo.jpg" data-active-url="resources/images/logo.jpg" alt="">
				</a>
			</div>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="searchmeeting.html">Find group</a></li>
					<li><a href="createmeeting.html">Create group</a></li>
					<li><a href="member.html">Register</a></li>
					<li><a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Sign Up</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 상단 메뉴바 종료 -->
	
	<!-- 회원가입창 -->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign Up</h3>
				<form action="" class="popup-form">
					<input type="text" class="form-control form-white" placeholder="Full Name">
					<input type="text" class="form-control form-white" placeholder="Email Address">
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="None" id="squaredOne" name="check" />
							<label for="squaredOne"><span>I Agree to the <strong>Terms &amp; Conditions</strong></span></label>
						</div>
					</div>
					<button type="submit" class="btn btn-submit">Submit</button>
				</form>
			</div>
		</div>
	</div>
	
</body>
