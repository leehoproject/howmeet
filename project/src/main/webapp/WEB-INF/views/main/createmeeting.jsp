<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사람을 만나는 방법, HowMeet</title>
</head>
<content tag="local_script">
	<!-- 부트스트랩,font-awsome 부분 필요 CSS -->
	<link href="resources/css/bootstrap.css" rel="stylesheet">
	<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	<!-- 페이지 구성 CSS -->
	<link href="resources/css/style.css" rel="stylesheet">
	
	<!-- 제이쿼리 부분 -->
	<script src="resources/js/jquery-1.11.3.min.js"></script>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	
<!-- 모임 만들기 창 디자인(차후 외부CSS로) -->
<style>
.mainframe{margin-top:50px; padding:50px; border:2px solid #f7f7f7;}
</style>
	
</content>
<body>
<!-- 모임생성 시작 -->
<div id="page-content" class="index-page">
<div class="container">
	<div class="row">
		<form class="form-horizontal" action="SocietyCreate" method="GET" role="form" data-parsley-validate="true">
			<div class="col-md-12 mainframe">
				<div class="form-group">
					<label for="s_area"><span class="labeltext">지역</span></label>
					<div style="padding:0;">
						<select class="form-control" name="s_area" id="s_area">
							<option value="서울">서울</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="인천">인천</option>
							<option value="광주">광주</option>
							<option value="대전">대전</option>
							<option value="울산">울산</option>
							<option value="세종">세종</option>
							<option value="경기">경기</option>
							<option value="강원">강원</option>
							<option value="충남">충남</option>
							<option value="충북">충북</option>
							<option value="전남">전남</option>
							<option value="전북">전북</option>
							<option value="경남">경남</option>
							<option value="경북">경북</option>
							<option value="제주">제주</option>
						</select>
					</div>
				</div>	
				<div class="form-group">
					<label for="s_hobby"><span class="labeltext">관심사</span></label>
					<div style="padding:0;">
						<select class="form-control" name="s_hobby" id="s_hobby">
							<option value=1>축구</option>
							<option value=2>맛집탐방</option>
							<option value=3>여행</option>
							<option value=4>스터디</option>
							<option value=5>영화</option>
							<option value=6>헬스</option>
							<option value=7>음악</option>
							<option value=8>그림</option>
						</select>
					</div>
				</div>	
				<div class="form-group">
					<label for="s_name"><span class="labeltext">모임 이름</span></label>
					<div class="input-group">
						<input type="text" size="50" id="s_name" name="s_name" class="form-control" placeholder="모임 이름">
						<span class="input-group-btn">
							<button id="confirm" name="confirm" class="btn btn-default">중복확인</button>
						</span>
					</div>
				</div>		
				<div class="form-group">
					<label for="s_content"><span class="labeltext">모임 설명</span></label>
					<textarea class="form-control" rows="5" id="s_content" name="s_content"></textarea>
				</div>	
				<div class="form-group">
					<label for="s_peoplenum"><span class="labeltext">모임 인원</span></label>
					<div style="padding:0;">
							<select class="form-control" id="s_peoplenum" name="s_peoplenum">
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
									<option value="5">5명</option>
									<option value="6">6명</option>
									<option value="7">7명</option>
									<option value="8">8명</option>
									<option value="9">9명</option>
									<option value="10">10명</option>
									<option value="11">11명</option>
									<option value="12">12명</option>
									<option value="13">13명</option>
									<option value="14">14명</option>
									<option value="15">15명</option>
									<option value="16">16명</option>
									<option value="17">17명</option>
									<option value="18">18명</option>
									<option value="19">19명</option>
									<option value="20">20명</option>
								</select>
						</div>
					</div>
				<div class="form-group">
					<div class="col-md-12 text-center" style="padding:0;">
						<button type="submit" class="btn btn-default col-md-12">보내기</button>
					</div>
				</div>				
			</div>
		</form>
	</div>
</div>
</div>
<!-- 모임생성 종료 -->
</body>
</html>