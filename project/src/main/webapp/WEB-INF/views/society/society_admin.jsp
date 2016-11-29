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
	
	<!-- sidebar CSS -->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">
    
    <!-- inputtags -->
	<link href="resources/inputtag/inputTags.css" rel="stylesheet">
	<script type="text/javascript" src="resources/inputtag/inputTags.jquery.js"></script>
	<script type="text/javascript" src="resources/inputtag/app.js"></script>

	<!-- 모임 만들기 창 디자인(차후 외부CSS로) -->
	<style>
	.mainframe{margin-top:30px;}
	</style>
	
</content>
<body>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <h5><i class="fa fa-users fa-fw"></i>기본정보</h5>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="societyupdate">모임 정보 수정</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <h5><i class="fa fa-table fa-fw"></i>게시판관리</h5>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="membermanage">멤버관리</a>
                                </li>
                                <li>
                                    <a href="photomanage">사진게시판</a>
                                </li>
                                <li>
                                    <a href="schedulemanage">일정관리</a>
                                </li>
                                <li>
                                    <a href="boardmanage">글게시판</a>
                                </li>
                                <li>
                                    <a href="noticemanage">공지</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <h5><i class="fa fa-picture-o fa-fw"></i>꾸미기</h5>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="photomanage">사진넣기</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <h5><i class="fa fa-bar-chart-o fa-fw"></i>기타</h5>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="invitemember">초대보내기</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
 					</ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->

        <div id="page-wrapper">		
			<!-- 모임생성 시작 -->
			<div id="page-content" class="index-page">
			<div class="container">
				<div class="row">
					<form class="form-horizontal" action="SocietyUpdate" method="POST" role="form" data-parsley-validate="true">
						<div class="col-md-12 mainframe">
							<div class="form-group">
								<label for="s_area"><span class="labeltext">지역</span></label>
								<input type="text" size="50" id="s_area" name="s_area" class="form-control" value="${society.getS_area()}" readonly>
							</div>	
							<div class="form-group">
								<label for="s_hobby"><span class="labeltext">관심사</span></label>
								<input type="text" size="50" id="s_hobby" name="s_hobby" class="form-control" value="${society.getS_hobby()}" readonly>
							</div>	
							
							<div class="form-group">
								<label for="s_tag"><span class="labeltext">태그</span></label>
								<input type="text" id="tags"/>
							</div>
							
							<div class="form-group">
								<label for="s_name"><span class="labeltext">모임 이름</span></label>
								<input type="text" size="50" id="s_name" name="s_name" class="form-control" value="${society.getS_name()}" readonly>
							</div>		
							<div class="form-group">
								<label for="s_content"><span class="labeltext">모임 설명</span></label>
								<textarea class="form-control" rows="5" id="s_content" name="s_content">${society.getS_content()}</textarea>
							</div>	
							<div class="form-group">
								<label for="s_peoplenum"><span class="labeltext">모임 인원</span></label>
								<div style="padding:0;">
										<select class="form-control" id="s_peoplenum" name="s_peoplenum">
											<c:forEach var="a" begin="1" end="20" step="1">
												<option  <c:if test="${society.getS_peoplenum()==a}">selected</c:if>>${a}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							<div class="form-group">
								<div class="col-md-12 text-center" style="padding:0;">
									<button type="submit" class="btn btn-default col-md-12">수정</button>
								</div>
							</div>				
						</div>
					</form>
				</div>
			</div>
			</div>
		<!-- 모임생성 종료 -->
        </div>
        <!-- /#page-wrapper -->           
</body>
</html>