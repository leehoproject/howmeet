<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<!--*-*-*-*-*-*-*-*-*-*- BOOTSTRAP CAROUSEL *-*-*-*-*-*-*-*-*-*-->

		<div id="video_carousel" class="carousel video_carousel_fade animate_text video_carousel_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">

			<!--======= Wrapper For Slides =======-->
			<div class="carousel-inner" role="listbox">

				<!--========= First Slide =========-->
				<div class="item active">
				
					<img src="resources/images/carousel_video_img.png" alt="carousel video img" />
					
					<div class="carousel-caption video_carousel_caption">
						
						<div class="video_carousel_caption_text">
							<h1>Video Carousel</h1>
							<p>Bootstrap Video Carousel supports Self Hosted Video</p>
							<a href="#" class="video_carousel_colored_button">Learn More</a>
						</div>
						
						<!--========= Video =========-->
						<video class="video_carousel_video" autoplay loop>
							<source src="resources/images/carousel_video_01.mp4" type="video/mp4">
							Your browser does not support HTML5 video.
						</video>
					
					</div>

				</div>
				
				<!--========= Second Slide =========-->
				<div class="item">

					<img src="resources/images/carousel_video_img.png" alt="carousel video img" />
					
					<div class="carousel-caption video_carousel_caption">
						
						<div class="video_carousel_caption_text">
							<h1 data-animation="animated fadeInDown">Video Carousel</h1>
							<p data-animation="animated fadeInUp">Bootstrap Video Carousel supports Self Hosted Video</p>
							<a href="#" class="video_carousel_colored_button" data-animation="animated fadeInLeft">Learn More</a>
						</div>
						
						<!--========= Video =========-->
						<video class="video_carousel_video" autoplay loop>
							<source src="resources/images/carousel_video_02.mp4" type="video/mp4">
							Your browser does not support HTML5 video.
						</video>
					
					</div>
					
				</div>

			</div>

			<!--======= Navigation Buttons =========-->

		<!-- 양쪽 화살표 부분 -->
		<a class="left carousel-control video_carousel_control_left" href="#video_carousel" data-slide="prev">
		   	<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control video_carousel_control_right" href="#video_carousel" data-slide="next">
		   	<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
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