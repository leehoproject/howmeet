<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>사람을 만나는 방법, HowMeet!</title>

<!-- 부트스트랩,font-awsome 부분 필요 CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<!-- 페이지 구성 CSS -->
<link href="resources/css/style.css" rel="stylesheet" type="text/css" >
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
<!-- set.css -->
<link href="resources/css/set.css" rel="stylesheet" type="text/css">
<!-- cloud.css -->
<link href="resources/css/bootstrap-tag-cloud.css" rel="stylesheet">

<!-- 제이쿼리 부분 -->
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/wow.min.js"></script>
<script src="resources/js/typewriter.js"></script>
<script src="resources/js/jquery.onepagenav.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/bootstrap-tag-cloud.js"></script>


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
							<c:choose>
								<c:when test="${sessionid == null }">
									<li><a href="member.html">회원가입</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="createmeeting">모임만들기</a></li>
		                       		<li><a href="memberUpdateForm?m_id=${sessionid}">내 정보</a></li>
		                       	</c:otherwise>
			                </c:choose>
						<li><a href="member_list">회원목록</a></li>
						<li>
							<c:choose>
							 	<c:when test="${sessionid == null }">
									<a href="login" data-toggle="modal" data-target="#modal1" class="btn btn-blue">로그인</a>
								</c:when>
								<c:otherwise>
	                       		 	<a href="logout" class="btn btn-blue">로그아웃</a>
	                       		</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- 상단 메뉴바 종료 -->
	
	<!--  로그인창 -->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup" style="background-image: url(resources/images/popup.jpg);">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Login</h3>
				<form  action="login" method="POST" class="popup-form">
					<input type="text" class="form-control form-white" id="m_id" name="m_id" placeholder="아이디" style="-webkit-input-placeholder { color: #fff; }" >
					<input type="password" class="form-control form-white" id="m_pw" name="m_pw" placeholder="패스워드" style="margin-top: 20px">
					<button type="submit" class="btn btn-submit">로그인</button>
				</form>
			</div>
		</div>
	</div>
	
	
</body>
