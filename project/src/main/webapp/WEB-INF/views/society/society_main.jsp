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
	
	<!-- 테이블리스트 -->
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/dataTables.uikit.min.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/uikit.min.css">
	<script src="resources/js/jquery-1.11.3.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/jquery.dataTables.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/dataTables.uikit.min.js"></script>

	<!-- 사진리스트 -->
	<link rel="stylesheet" href="resources/gallery/gallerymain.css">
	<script src="resources/gallery/gallerymain.js"></script>
	
	<!-- 모임 만들기 창 디자인(차후 외부CSS로) -->
	<style>
	.mainframe{margin-top:50px; padding:50px; border:2px solid #f7f7f7;}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable();
		$('#file').change(function(event){
			var tmppath=URL.createObjectURL(event.target.files[0]);
			$('#profile').attr('src',tmppath);
		});
	    $('#joinmember').click(function(){
	    	var joinpeople = ${society.getS_joinpeople()};
	    	var peoplenum = ${society.getS_peoplenum()};
			if(peoplenum==joinpeople){
				alert("FULL MEMBER!");
				return;
			}
			var sessionid = $('#sessionid').val();
			var societyname = $('#societyname').val();
			var s_hobby = $('#s_hobby').val();
			var s_dept = $('#s_dept').val();			
		    $(location).attr('href',"selectMember?sessionid="+sessionid+"&societyname="+societyname+"&s_hobby="+s_hobby+"&s_dept="+s_dept);	
		});
	});
	</script>
</content>
<body>
	<div class="container" style="margin-top: 80px;">
		<c:choose>
			<c:when test="${society.getS_photo()==null}">
			<div style="height: 300px; width: 1170px; background-image: url(resources/images/jelly.jpg);"></div>
			</c:when>
			<c:otherwise>
			<div style="height: 300px; width: 1170px; background-image: url(resources/uploadFolder/${society.getS_photo()}); background-repeat: repeat;"></div>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="page-content" class="index-page">
		<div class="container">
		  <ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
		    <li><a data-toggle="tab" href="#menu2">Member</a></li>
		    <c:if test="${sessionid!=null&&count!=0}">
		    <li><a data-toggle="tab" href="#menu3">Picture</a></li>
		    <li><a href="calendar?societyname=${societyname}">Schedule</a></li>
		    <li><a  href="society_board_list?s_hobby=${s_hobby}&s_dept=${s_dept}">Board</a></li>
		   		 <c:if test="${sessionid==masterid}">
		    		<li><a href="societyadmin?societyname=${societyname}">모임관리</a></li>
		    	</c:if>
		    </c:if>
		  </ul>
		
		  <div class="tab-content">
			<!-- HOME -->
		    <div id="home" class="tab-pane fade in active" style="margin-top: 50px">
		      <div class="container">
				  <div class="row">
				    <div class="col-sm-3 well">
				      <div class="well">
				         <p>Member<b class="badge" style="margin-left: 10PX">${society.getS_joinpeople()}</b></p>
				         <p style="margin-top: 10px;">Organizers:</p>
				         <img src="resources/images/2.jpg" class="img-circle" height="50" width="50" alt="Avatar"><b style="margin-left: 5px">${mastername}</b>
				      </div>
				      <div class="well">
				        <p>Interest tags</p>
				        <p>
				          <span class="label label-primary">game</span>
				          <span class="label label-primary">IT</span>
				          <span class="label label-primary">school</span>
				          <span class="label label-primary">Football</span>
				          <span class="label label-primary">play</span>
				          <span class="label label-primary">study</span>
				        </p>
				      </div>
				      <div class="well">
				      <p>with</p>
				      </div>
				    </div>
				    <div class="col-sm-6">
				    
				      <div class="row">
				        <div class="col-sm-12">
				          <div class="panel panel-default text-left">
				            <div class="panel-body">
				              <p>${societyname}</p>
				              <p>${society.getS_content()}</p>
				              <input type="hidden" id="sessionid" name="sessionid" value="${sessionid}">
				              <input type="hidden" id="societyname" name="societyname" value="${societyname}">
				              <input type="hidden" id=s_hobby name="s_hobby" value="${s_hobby}">
				              <input type="hidden" id="s_dept" name="s_dept" value="${s_dept}">
				              <c:if test="${sessionid!=null}">
					              <button id="joinmember" name="joinmember" type="button" class="btn btn-default">
					              <span class="glyphicon glyphicon-thumbs-up"></span> Join Member
				             	  </button>
								  <c:if test="${check==0}">
									  <div class="alert alert-warning alert-dismissable fade in" style="margin-top: 5px">
									    <a href="societymain?check=1&societyname=${societyname}&sessionid=${sessionid}&s_hobby=${s_hobby}&s_dept=${s_dept}" class="close" data-dismiss="alert" aria-label="close">&times;</a>
									    <strong>이미 가입하셨습니다</strong>
									  </div>
								  </c:if>
				              </c:if>
				            </div>
				          </div>
				        </div>
				      </div>
				      
				      <div class="row">
				        <div class="col-sm-3">
				          <div class="well">
				           <center>
				           <p>hoyoung</p>
				           <img src="resources/images/2.jpg" class="img-circle" height="100" width="100" alt="Avatar">
				           </center>
				          </div>
				        </div>
				        <div class="col-sm-9">
				          <div class="well">
				            <p>하이</p>
				          </div>
				        </div>
				      </div>
				    </div>
				     <c:forEach var="upcomming" items="${upcommings}">
					    <div class="col-sm-3 well">
					      <div class="well">
					           <p>Upcoming meets</p>
						        <img src="resources/schedulegallery/${upcomming.c_photo}" class="img-RoundedCorners" height="180" width="180">
						        <p><strong>${upcomming.c_name}</strong></p>
						        <p>${upcomming.c_date}</p>
						        <button class="btn btn-blue" onclick="location.href='GoogleMap?c_seq=${upcomming.c_seq}'">Info</button>
					      </div>
					    </div>
				   	</c:forEach>  
				  </div>
				</div>
		    </div>
			<!-- menu1 end -->
		    <div id="menu2" class="tab-pane fade">
		      <table id="example" class="uk-table uk-table-hover uk-table-striped" cellspacing="0">
			        <thead>
			            <tr>
			            	<th>Photo</th>
			                <th>Name</th>
			                <th>Member Level</th>     
			                <th>Date Joined</th>        
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
			            </tr>
			       	  </c:forEach>
			        </tbody>
			    </table>
		    </div>
		    <div id="menu3" class="tab-pane fade">
		       <button class="btn btn-blue" data-target="#myModal" data-toggle="modal">사진첨부</button>
			   <div class="carouselGallery-grid hidden-xs" >
			        <div class="row">
			            <div class="carouselGallery-col-60">
			            	<c:if test="${msg == '0'}"><h1>사진을 입력해주세요</h1></c:if>
				            <c:forEach var="photo" items="${photos}">
					                <div class="carouselGallery-col-1 carouselGallery-carousel" data-index="${photo.p_seq}" data-username="${photo.p_id}" 
					                data-imagetext="${photo.p_content}" data-location="" data-imagepath="resources/photogallery/${photo.p_photo}"
					                data-posturl="resources/photogallery/${photo.p_photo}" style="background-image:url(resources/photogallery/${photo.p_photo});">
						                <div class="carouselGallery-item">
						                    <div class="carouselGallery-item-meta">
						                        <span class="carouselGallery-item-meta-user">
						                            ${photo.p_id}
						                        </span>
						                    </div>
						              		<i class="fa fa-times-circle fa-2x" aria-hidden="true" onclick="location.href='photodelete?p_seq=${photo.p_seq}&sessionid=${sessionid}&societyname=${societyname}'"></i>
						                </div>
						            </div>
					        </c:forEach>
				        </div>
				    </div>
				</div>
		    </div>
		    
		    <div id="menu4" class="tab-pane fade">
		    	
		    </div>
		  </div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">	    
			<!-- Modal content-->
			<form class="popup-form" action="insertPhoto" enctype="multipart/form-data" method="POST">
				<div class="modal-content">
					<div class="modal-header">
						<center><h1>photoinsert</h1></center>
					</div>
					<div class="modal-body">
						<img class="img-responsive" id="profile" name="profile" src="resources/images/profile.png">
						<input type="file" name="file" id="file">
						<textarea class="form-control" rows="3" id="p_content" name="p_content" style="resize:none;"></textarea>
						<input type="hidden" id="p_id" name="p_id" value="${sessionid}">
						<input type="hidden" id="p_name" name="p_name" value="${societyname}">
				        <input type="hidden" id=s_hobby name="s_hobby" value="${s_hobby}">
				        <input type="hidden" id="s_dept" name="s_dept" value="${s_dept}">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">저장</button>
					</div>
				</div>
			</form>		      
		</div>
	</div>
</body>
</html>