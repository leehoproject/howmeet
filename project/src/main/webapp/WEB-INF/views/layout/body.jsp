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

				<!--========= 첫번째슬라이드 =========-->
				<div class="item active">
				
					<img src="resources/images/carousel_video_img.png" alt="carousel video img" />
					
					<div class="carousel-caption video_carousel_caption">
						
						<div class="video_carousel_caption_text">
							<h1>Video Carousel</h1>
							<p>Bootstrap Video Carousel supports Self Hosted Video</p>
							<a href="#" class="video_carousel_colored_button">Learn More</a>
						</div>
						
						<!--========= 1비디오 =========-->
						<video class="video_carousel_video" autoplay loop>
							<source src="resources/images/carousel_video_01.mp4" type="video/mp4">
							Your browser does not support HTML5 video.
						</video>
					
					</div>

				</div>
				
				<!--========= 두번째 슬라이드 =========-->
				<div class="item">

					<img src="resources/images/carousel_video_img.png" alt="carousel video img" />
					
					<div class="carousel-caption video_carousel_caption">
						
						<div class="video_carousel_caption_text">
							<h1 data-animation="animated fadeInDown">Video Carousel</h1>
							<p data-animation="animated fadeInUp">Bootstrap Video Carousel supports Self Hosted Video</p>
							<a href="#" class="video_carousel_colored_button" data-animation="animated fadeInLeft">Learn More</a>
						</div>
						
						<!--========= 2비디오 =========-->
						<video class="video_carousel_video" autoplay loop>
							<source src="resources/images/carousel_video_02.mp4" type="video/mp4">
							Your browser does not support HTML5 video.
						</video>
					
					</div>
					
				</div>

			</div>

			<!--======= 화살표 버튼 =========-->

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
				<div id="works"  class=" clearfix grid"> 
				    <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Cappuchino</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Latte</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Ambience</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Fruits</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Breakfast</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				    <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Kitchen</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				    <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Cappuchino</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Latte</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Ambience</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Fruits</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				     
				     <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Breakfast</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				    <figure class="effect-oscar  wowload fadeInUp">
				        <img src="resources/images/1.jpg" alt="img01"/>
				        <figcaption>
				            <h2>Kitchen</h2>
				            <p>Lily likes to play with crayons and pencils<br>
				            <a href="resources/images/1.jpg" title="1" data-gallery>View more</a></p>            
				        </figcaption>
				    </figure>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 카테고리 혹은 모임보기 종료 -->

</body>
</html>