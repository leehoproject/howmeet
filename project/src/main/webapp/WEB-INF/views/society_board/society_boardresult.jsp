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
.messageframe{padding:0; margin-top:50px; background:#f7f7f7;}
.logoframe{height:100px; padding-top:30px; padding-bottom:20px; border-bottom:2px solid #e9e9e9;} 
.memberframe,.sendframe{padding:30px; border-bottom:2px solid #e9e9e9;}
.message{font-size:20px; font-weight:600; color:#555555}
.slogan{font-size:20px;}
</style>	
</content>
<body>
<!-- 정보수정 시작 -->
<div id="page-content" class="index-page">
<div class="container">
	<div class="row" style="padding-left:15px; padding-right:15px;">
		<form class="form-horizontal" action="society_board_list" method="GET" role="form">
		 <input type="hidden" id="s_hobby" name="s_hobby" value="${s_hobby}">
		 <input type="hidden" id="s_dept" name="s_dept" value="${s_dept}">		
			<div class="col-sm-12 messageframe">
				<div class="col-md-12 text-center logoframe">
					<span class="slogan">사람을 만나는 방법, HowMeet!</span>
				</div>
				<div class="col-sm-12" style="height:150px; text-align:center; ">
					<div style="margin-top: 50px;">
						<span class="message">
							게시글 입력완료
						</span>
					</div>
				</div>
				<div class="col-sm-12 text-center" style="margin-bottom:30px;">
					<button Type="submit" class="btn btn-default">확인</button>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
<!-- 정보수정 종료 -->
</body>
</html>