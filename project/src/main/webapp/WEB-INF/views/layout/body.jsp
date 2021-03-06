<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사람을 만나는 방법, HowMeet</title>
</head>
<content tag="local_script">
<!-- 	<link rel="stylesheet" href="resources/filter/css/reset.css"> -->
	<link rel="stylesheet" href="resources/filter/css/style.css">
	<script src="resources/filter/js/modernizr.js"></script>
	<script src="resources/filter/js/jquery.mixitup.min.js"></script>
	<script src="resources/filter/js/main.js"></script>
</content>
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
							<h1>누구와 어떻게 만날까요?</h1>
							<p>그 방법은 howMeet입니다!</p>
							<a href="member.html" class="video_carousel_colored_button">회원가입</a>
						</div>
						
						<!--========= 1비디오 =========-->
						<video class="video_carousel_video" autoplay loop muted>
							<source src="resources/images/carousel_video_03.mp4" type="video/mp4">
							현재 브라우저에서 지원되지 않는 기능입니다.
						</video>
					
					</div>

				</div>
				
				<!--========= 두번째 슬라이드 =========-->
				<div class="item">

					<img src="resources/images/carousel_video_img.png" alt="carousel video img" />
					
					<div class="carousel-caption video_carousel_caption">
						
						<div class="video_carousel_caption_text">
							<h1 data-animation="animated fadeInDown">누구와 어떻게 만날까요?</h1>
							<p data-animation="animated fadeInUp">그 방법은 howMeet입니다!</p>
							<a href="member.html" class="video_carousel_colored_button" data-animation="animated fadeInLeft">회원가입</a>
						</div>
						
<!-- 						========= 2비디오 ========= -->
						<video class="video_carousel_video" autoplay loop>
							<source src="resources/images/carousel_video_02.mp4" type="video/mp4">
							현재 브라우저에서 지원되지 않는 기능입니다.
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
				<main class="cd-main-content">
					<div class="cd-filter-block">
						<h4>Search</h4>
						<div class="cd-filter-content">
							<input type="search" placeholder="Try search...">
						</div> <!-- cd-filter-content -->
					</div> <!-- cd-filter-block -->
					<section class="cd-gallery">
						<div id="works"  class=" clearfix grid"> 
						<ul>
							<li class="mix 그림">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/그림.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=그림'">
							            <h2>그림</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 축구">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/축구.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=축구'">
							            <h2>축구</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 밴드">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/밴드.jpg" alt="img01" />
							        <figcaption onclick="location.href='societyFind?category=밴드'">
							            <h2>밴드</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 스터디">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/스터디.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=스터디'">
							            <h2>스터디</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 여행">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/여행.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=여행'">
							            <h2>여행</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 영화">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/영화.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=영화'">
							            <h2>영화</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 하키">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/하키.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=하키'">
							            <h2>하키</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 농구">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/농구.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=농구'">
							            <h2>농구</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="mix 야구">
			 					<figure class="effect-oscar  wowload fadeInUp">
							        <img src="resources/images/category/야구.jpg" alt="img01"/>
							        <figcaption onclick="location.href='societyFind?category=야구'">
							            <h2>야구</h2>
							            <p>동호회<br>
							        </figcaption>
							    </figure>
							</li>
							<li class="gap"></li>
							<li class="gap"></li>
							<li class="gap"></li>
						</ul>
						</div>
						<div class="cd-fail-message">No results found</div>
					</section> <!-- cd-gallery -->
				</main> <!-- cd-main-content -->
			</div>
		</div>
	</div>
</div>

<!-- 카테고리 혹은 모임보기 종료 -->

</body>
</html>