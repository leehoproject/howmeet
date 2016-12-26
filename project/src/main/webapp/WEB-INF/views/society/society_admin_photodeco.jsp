<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
	
	<!-- sidebar CSS -->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">
    
    <!-- inputtags -->
	<link href="resources/inputtag/inputTags.css" rel="stylesheet">
	<script type="text/javascript" src="resources/inputtag/inputTags.jquery.js"></script>
	<script type="text/javascript" src="resources/inputtag/app.js"></script>

	<!-- 테이블리스트 -->
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/dataTables.uikit.min.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/uikit.min.css">
	<script src="resources/js/jquery-1.11.3.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/jquery.dataTables.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/dataTables.uikit.min.js"></script>
	
	<!-- 모임 만들기 창 디자인(차후 외부CSS로) -->
	<style>
	.mainframe{margin-top:30px;}
	</style>
	
	<script type="text/javascript">
	//이미지 삽입 후 바뀜
	$(document).ready(function(){
		$('#file').change(function(event){
			var tmppath=URL.createObjectURL(event.target.files[0]);
			$('#profile').attr('src',tmppath);
		});
	});
	</script>
	
</content>
<body>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <h5><i class="fa fa-users fa-fw"></i>기본정보</h5>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="societyadmin?societyname=${societyname}">모임 정보 수정</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <h5><i class="fa fa-table fa-fw"></i>게시판관리</h5>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="membermanage?societyname=${societyname}">멤버관리</a>
                                </li>
                                <li>
                                    <a href="photomanage?societyname=${societyname}">사진게시판</a>
                                </li>
                                <li>
                                    <a href="schedulemanage?societyname=${societyname}">일정관리</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <h5><i class="fa fa-picture-o fa-fw"></i>꾸미기</h5>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="photodeco?societyname=${societyname}">사진넣기</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
 					</ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->

        <div id="page-wrapper" style="margin-top: 60px;">
          	<h2>대문사진넣기(권장 1170x300)</h2>
	        <form method="POST" action="uploadFile" enctype="multipart/form-data">
	        	<input type="hidden" id="societyname" name="societyname" value="${societyname}">
	        	<img class="img-responsive" id="profile" name="profile" src="resources/images/profile.png">
				<input type="file" name="file" id="file">
				<input type="submit" value="Upload">
			</form>	       
        </div>
        <!-- /#page-wrapper -->           
</body>
</html>