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
	<!-- 회원가입 창 디자인(차후 외부CSS로) -->
<style>
 	.mainframe{padding:0; margin-top:50px; background:#f7f7f7;} 
 	.logoframe{height:100px; padding-top:30px; padding-bottom:20px; border-bottom:2px solid #e9e9e9;} 
 	.memberframe,.sendframe{padding:30px; border-bottom:2px solid #e9e9e9;}
 	.slogan{font-size:20px;}
</style>	
</content>
<body>
<!-- 정보수정 시작 -->
<div id="page-content" class="index-page">
<div class="container">
	<div class="row" >
		<form class="form-horizontal" action="memberUpdate" method="POST" role="form" data-parsley-validate="true">
			<div class="col-md-offset-3 col-md-6 mainframe">
				<div class="col-md-12 text-center logoframe">
					<span class="slogan">사람을 만나는 방법, HowMeet!</span>
				</div>
				<div class="col-md-12 memberframe">
					<div class="form-group">
						<label for="m_id" class="col-md-3"><span class="labeltext">아이디</span></label>
						<div class="col-md-9" style="padding:0;">
							<input type="text" size="20" id="m_id" name="m_id" value="${member.getM_id()}" class="form-control" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label for="m_pw" class="col-md-3"><span class="labeltext">비밀번호</span></label>
						<div class="col-md-9" style="padding:0;">
							<input type="password" size="20" name="m_pw" id="m_pw" class="form-control" value="${member.getM_pw()}">
						</div>
					</div>
					<div class="form-group">
						<label for="checkpassword" class="col-md-3"><span class="labeltext">비밀번호 확인</span></label>
						<div class="col-md-9" style="padding:0;">
							<input type="password" size="20" name="checkpassword" id="checkpassword" class="form-control" value="${member.getM_pw()}">
						</div>
					</div>
					<div class="form-group">
						<label for="m_name" class="col-md-3"><span class="labeltext">이름</span></label>
						<div class="col-md-9" style="padding:0;">
							<input type="text" size="20" name="m_name" id="m_name" class="form-control" value="${member.getM_name()}">
						</div>
					</div>				
					<div class="form-group">
						<label for="m_email" class="col-md-3"><span class="labeltext">이메일</span></label>
						<div class="col-md-9" style="padding:0;">
							<input type="text" size="20" name="m_email" id="m_email" class="form-control" value="${member.getM_email()}">
						</div>
					</div>	
					<!-- DB로 들어가는 부분, 페이지에서 입력하는 부분 다름으로 DB추가 반영 고려(By 이기범) -->			
					<div class="form-group">
						<label for="m_phone1" class="col-md-3"><span class="labeltext">휴대폰 번호</span></label>
						<div class="col-md-3" style="padding:0;">
							<select class="form-control" name="m_phone1" id="m_phone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
						</div>
						<label class="col-md-1 text-center" for="m_phone2"><span class="labeltext">-</span></label>
						<div class="col-md-2" style="padding:0;">
							<input type="text" size="20" name="m_phone2" id="m_phone2" value="${member.getM_phone2()}" class="form-control">
						</div>
						<label class="col-md-1 text-center" for="m_phone3"><span class="labeltext">-</span></label>
						<div class="col-md-2" style="padding:0;">
							<input type="text" size="20" name="m_phone3" id="m_phone3" class="form-control">
						</div>
					</div>				
					<div class="form-group">
						<label for="m_addr1" class="col-md-3"><span class="labeltext">주소</span></label>
						<div class="col-md-9" style="padding:0;">
							<input type="text" size="20" name="m_addr1" id="m_addr1" class="form-control" value="${member.getM_addr1()}">
						</div>
					</div>				
					<div class="form-group">
						<label for="m_addr2" class="col-md-3"><span class="labeltext">상세주소</span></label>
						<div class="col-md-9" style="padding:0;">
							<input type="text" size="20" name="m_addr2" id="m_addr2" class="form-control" value="${member.getM_addr2()}">
						</div>
					</div>
					<!-- DB에 숫자로 반영되어 있어서 출력시 시간, 검색 필요 By 이기범-->				
					<div class="form-group">
						<label for="m_hobby1" class="col-md-3"><span class="labeltext">관심사1</span></label>
						<div class="col-md-9" style="padding:0;">
							<select class="form-control" name="m_hobby1" id="m_hobby1">
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
						<label for="m_hobby2" class="col-md-3"><span class="labeltext">관심사2</span></label>
						<div class="col-md-9" style="padding:0;">
							<select class="form-control" name="m_hobby2" id="m_hobby2">
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
				</div>
				<div class="col-md-12 sendframe">
					<div class="form-group">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-default">수정하기</button>
							<button type="button" class="btn btn-default" onclick="location.href='memberDeleteForm?m_id=${sessionid}'">회원탈퇴</button>
							<button type="button" class="btn btn-default" onclick="location.href='home'">메인으로</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
<!-- 정보수정 종료 -->
</body>
</html>