<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 슬라이드 시작 -->
<header id="intro">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- 클릭해서 넘겨주는 부분 (색깔 제외한 수정 불필요) -->
		<ol class="carousel-indicators">
		  	<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<!-- 슬라이드 부분 wrapper 역할 -->
		<div class="carousel-inner">
		    <div class="item active">
				<!-- 슬라이드 이미지 -->
		    	<img src="resources/images/image1.jpg">
				<div class="header-text hidden-xs">
                    <div class="col-md-12 text-center">
                        <h2>Welcome to Shuffle</h2>
                        <br>
                        <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                    </div>
				</div>
		    </div>
			<div class="item">
			  	<img src="resources/images/image2.jpg">
                <div class="header-text hidden-xs">
                    <div class="col-md-12 text-center">
                        <h2>Awesome Bootstrap template</h2>
                        <br>
                        <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                    </div>
                </div>
			</div>
			<div class="item">
			  	<img src="resources/images/image3.jpg">
                <div class="header-text hidden-xs">
                    <div class="col-md-12 text-center">
                        <h2>Use without any charge</h2>
                        <br>
                        <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                    </div>
                </div>
			</div>
		</div>
		<!-- 양쪽 화살표 부분 -->
		<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
		   	<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
		   	<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
</header>
<!-- 슬라이드 종료 -->
	
<!-- 카테고리 혹은 모임보기 시작 -->
<div id="page-content" class="index-page">
<div class="container">
	<div class="row">
		<div class="heading col-lg-12">
			<h2>카테고리</h2>
		</div>
		<div class="content col-lg-12">
			<div class="row">
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>				
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>
			</div>			
			<div class="row">
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>				
				<div class="col-md-3">
					<a href="#"><img src="resources/images/1.jpg" alt=""></a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 카테고리 혹은 모임보기 종료 -->

</body>
</html>