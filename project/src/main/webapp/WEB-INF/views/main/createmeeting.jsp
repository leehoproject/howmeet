<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사람을 만나는 방법, HowMeet</title>
</head>
<content tag="local_script">
	<!-- 부트스트랩,font-awsome 부분 필요 CSS -->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
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
		<form class="form-horizontal" action="" method="POST" role="form" data-parsley-validate="true">
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
							<option value="1">축구</option>
							<option value="2">맛집탐방</option>
							<option value="3">여행</option>
							<option value="4">스터디</option>
							<option value="5">영화</option>
							<option value="6">헬스</option>
							<option value="7">음악</option>
							<option value="8">그림</option>
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
					<label for="c_peoplenum"><span class="labeltext">모임 인원</span></label>
					<div>
						<input type="text" size="50" id="c_peoplenum" name="c_peoplenum" class="form-control" placeholder="모임 인원">
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