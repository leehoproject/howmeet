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
	<link href="resources/css/bootstrap.css" rel="stylesheet">
	<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	<!-- 페이지 구성 CSS -->
	<link href="resources/css/style.css" rel="stylesheet">

	<!-- 모임 만들기 창 디자인(차후 외부CSS로) -->
	<style>
	.mainframe{margin-top:50px; padding:50px; border:2px solid #f7f7f7;}
	</style>
	
</content>
<body>
	<div class="container">
  		<img src="resources/images/jelly.jpg">
	</div>
	<div id="page-content" class="index-page">
		<div class="container">
		  <ul class="nav nav-tabs">
		    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
		    <li><a data-toggle="tab" href="#menu1">Member</a></li>
		    <li><a data-toggle="tab" href="#menu2">Picture</a></li>
		    <li><a data-toggle="tab" href="#menu3">Schedule</a></li>
		    <li><a data-toggle="tab" href="#menu3">Board</a></li>
		    <li><a data-toggle="tab" href="#menu3">adasd</a></li>
		  </ul>
		
		  <div class="tab-content">
			<!-- HOME -->
		    <div id="home" class="tab-pane fade in active" style="margin-top: 50px">
		      <div class="container">
				  <div class="row">
				    <div class="col-sm-3 well">
				      <div class="well">
				        <img src="resources/images/2.jpg" class="img-RoundedCorners" height="230" width="230" alt="Avatar">
				         <p style="margin-top: 20px;"><a href="#">Member<b class="badge" style="margin-left: 10PX">20</b></a></p>
				         <p style="margin-top: 10px;"><a href="#">Schedule<i class="fa fa-calendar" aria-hidden="true" style="margin-left: 5px"></i></a></p>
				         <p style="margin-top: 10px;"><a href="#">Organizers:</a></p>
				         <img src="resources/images/2.jpg" class="img-circle" height="50" width="50" alt="Avatar"><b style="margin-left: 5px">Hoyoung</b>
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
				              <p contenteditable="true">ITSCHOOL MEETS</p>
				              <button type="button" class="btn btn-default">
				                <span class="glyphicon glyphicon-thumbs-up"></span> Join Member
				              </button>
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
				    <div class="col-sm-3 well">
				      <div class="well">
				        <p>Upcoming meets</p>
				        <img src="resources/images/2.jpg" class="img-RoundedCorners" height="180" width="180">
				        <p><strong>Itschool 3rd</strong></p>
				        <p>Fri. 18 November 2016</p>
				        <button class="btn btn-blue">Info</button>
				      </div>
				      <div class="well">
				        <p>Recent meets</p>
				        <img src="resources/images/2.jpg" class="img-RoundedCorners" height="180" width="180">
				        <p><strong>Itschool 2st</strong></p>
				        <p>Fri. 11 November 2016</p>
				        <button class="btn btn-blue">Info</button>
				      </div>
				      <div class="well">
				        <p>Recent meets</p>
				        <img src="resources/images/2.jpg" class="img-RoundedCorners" height="180" width="180">
				        <p><strong>Itschool party</strong></p>
				        <p>Fri.4 November 2016</p>
				        <button class="btn btn-blue">Info</button>
				      </div>
				    </div>
				  </div>
				</div>
		    </div>
			<!-- menu1 end -->
		    <div id="menu2" class="tab-pane fade">
		      <h3>Menu 2</h3>
		      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
		    </div>
		    <div id="menu3" class="tab-pane fade">
		      <h3>Menu 3</h3>
		      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>