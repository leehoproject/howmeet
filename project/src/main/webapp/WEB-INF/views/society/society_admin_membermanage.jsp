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
	$(document).ready(function() {
	    $('#example').DataTable();
	    button = "<div style='margin-left:20px'><button Type='button' id='selectdel' class='btn btn-danger''><i class='fa fa-trash' aria-hidden='true'></i></button>";
	    button += "<button Type='button' id='memberlevelup' class='btn btn-default' style='margin-left:10px'><i class='fa fa-caret-square-o-up' aria-hidden='true'></i></button>";
	    button += "<button Type='button' id='memberleveldown' class='btn btn-default' style='margin-left:10px'><i class='fa fa-caret-square-o-down' aria-hidden='true'></i></button></div>";
	    $("#example_filter").append(button); 
	    $('#allchk').click(function(){
	    	if($(this).is(':checked')){
	    		$("input[name=unitchk]").prop("checked",true);
	    	} else {
	    		$("input[name=unitchk]").prop("checked",false);
	    	}
	    });
	    $('#selectdel').click(function(){
	    	var checked = $("input[name=unitchk]:checked").length;
	    	var saveids = new Array();
	    	if(checked==0){
	    		alert("삭제 항목을 선택해주세요.");
	    		return;
	    	} else {
	    		var returnValue = confirm("삭제하시겠습니까?");
	    		if(returnValue){
	    			$('#unitchk:checked').each(function(index){
		    			saveids[index] = $(this).val(); 
		    		});
	    			alert(saveids);
	    			var societyname = $('#societyname').val();
		    		var url = "memberselectdelete?saveids="+saveids+"&societyname="+societyname;
		    		$(location).attr('href',url);	
	    		} else {
	    			return;
	    		}
	    	}
	    });
	    $('#memberlevelup').click(function(){
	    	var checked = $("input[name=unitchk]:checked").length;
	    	var saveids = new Array();
	    	if(checked==0){
	    		alert("수정 항목을 선택해주세요.");
	    		return;
	    	} else {
	    		var returnValue = confirm("수정하시겠습니까? [1단계 up]");
	    		if(returnValue){
	    			$('#unitchk:checked').each(function(index){
		    			saveids[index] = $(this).val(); 
		    		});
	    			var societyname = $('#societyname').val();
		    		var url = "memberlevelup?saveids="+saveids+"&societyname="+societyname;
		    		$(location).attr('href',url);	
	    		} else {
	    			return;
	    		}
	    	}
	    });
	    $('#memberleveldown').click(function(){
	    	var checked = $("input[name=unitchk]:checked").length;
	    	var saveids = new Array();
	    	if(checked==0){
	    		alert("수정 항목을 선택해주세요.");
	    		return;
	    	} else {
	    		var returnValue = confirm("수정하시겠습니까? [1단계 down]");
	    		if(returnValue){
	    			$('#unitchk:checked').each(function(index){
		    			saveids[index] = $(this).val(); 
		    		});
	    			var societyname = $('#societyname').val();
		    		var url = "memberleveldown?saveids="+saveids+"&societyname="+societyname;
		    		$(location).attr('href',url);	
	    		} else {
	    			return;
	    		}
	    	}
	    });
	});
	</script>
	
</content>
<body>
	<input type="hidden" id="societyname" name="societyname" value="${societyname}">
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

        <div id="page-wrapper">
        	<div class="container" style="margin-top:80px">		
		      <table id="example" class="uk-table uk-table-hover uk-table-striped" cellspacing="0">
			        <thead>
			            <tr>
			            	<th>Photo</th>
			                <th>Name</th>
			                <th>Member Level</th>     
			                <th>Date Joined</th>  
			                <th style="text-align: center !important"><input Type="checkbox" id="allchk"></th>      
			            </tr>
			        </thead>
			        <tfoot>
			            <tr>
			            	<th>Photo</th>
			                <th>Name</th>
			                <th>Member Level</th>     
			                <th>Date Joined</th>       
			            </tr>
			        </tfoot>
			        <tbody>
			          <c:forEach var="memberlist" items="${memberlists}">
			            <tr>
			                <td><img src="resources/images/1.jpg" width="100" height="100"></td>
			                <td>${memberlist.m_name}</td>
			                <td>${memberlist.m_level}</td>
			                <td>${memberlist.m_joindate}</td>
			                <th style="text-align: center !important"><input Type="checkbox" id="unitchk" name="unitchk" value="${memberlist.m_id}"></th>
			            </tr>
			       	  </c:forEach>
			        </tbody>
			    </table>
			 </div>
        </div>
        <!-- /#page-wrapper -->           
</body>
</html>