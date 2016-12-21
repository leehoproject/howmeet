<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	
	
	
<<!-- 모임 만들기 창 디자인(차후 외부CSS로) -->
<style>
.mainframe{margin-top:10px; padding:20px; border-top:2px solid #ccc;}
.listframe{height:80px; padding:0; margin-bottom:10px; border-bottom:1px solid #ccc;}
.contentframe{height:30px;}
.profileframe1,.profileframe2,.profileframe3,.profileframe4{height:50px;}
.paginationframe{padding:0; height:80px;}
.titlefont{font-size:20px;}
.subfont{font-size:15px;}
.searchframe{height:50px; margin-top:50px;}
.tomeet{color:#000;}
.tomeet:hover{color:#f15f5f; transition:1s ease;}

@media (max-width:768px){
.titlefont{font-size:15px;}
.subfont{font-size:12px;}
}
</style>

	<script type="text/javascript">
		$(document).ready(function() {
		    $('#find').click(function(){
		    	var namefind = $('#namefind').val();
			    var url = "findGroup?namefind="+namefind;
			    $(location).attr('href',url);	
		    });
		} );
	</script>
</content>
<body>
<!-- 모임 검색 시작 -->
<div id="page-content" class="index-page">
<div class="container">
	<div class="row">
		<div class="col-md-12 searchframe">
			<div class="input-group col-xs-12">
				<input id="namefind" type="text" size="20" class="form-control" placeholder="모임이름,관심사,지역,태그">
				<span class="input-group-btn">
					<button type="button" id="find" name="find" class="btn btn-default">검색</button>
				</span>
			</div>
		</div>
	
		<div class="col-md-12 mainframe">
			<c:forEach var="society" items="${societys}" >
				<div class="col-md-12 listframe">
					<!-- 제목단 -->
					<div class="col-md-12 contentframe">
						<span class="titlefont"><a href="societymain?check=1&societyname=${society.s_name}&sessionid=${sessionid}&s_hobby=${society.s_hobby}&s_dept=${society.s_dept}" class="tomeet">${society.s_name}</a></span>
					</div>
					<!-- 관심사,날짜,인원,지역 -->
					<div class="col-xs-3 profileframe1">
						<span class="subfont">관심사 : ${society.s_hobby}</span>
					</div>				
					<div class="col-xs-3 profileframe2">
						<span class="subfont">날짜 : ${society.s_createdate} </span>
					</div>				
					<div class="col-xs-3 profileframe3">
						<span class="subfont">인원 : ${society.s_joinpeople}/${society.s_peoplenum} </span>
					</div>				
					<div class="col-xs-3 profileframe4">
						<span class="subfont">지역 : ${society.s_area}</span>
					</div>
				</div>	
			</c:forEach>
		</div>
						
	<div class="row">
		<div class="col-md-12 text-center paginationframe">
			<ul class="pagination" style="padding:0;">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</div>
</div>
</div>
<!-- 모임검색 종료 -->
</body>
</html>
