<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>캘린더</title>
  	<title>How to add calendar using jQuery and fullCalendar</title>
		<content tag="local_script">
		<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
		<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
		<link rel='stylesheet' href='resources/calendar/lib/cupertino/jquery-ui.min.css' />
		<link href='resources/calendar/fullcalendar.css' rel='stylesheet' />
		<link href='resources/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
		<script src='resources/calendar/lib/moment.min.js'></script> 
		<script src='resources/calendar/lib/jquery.min.js'></script>
		<script src='resources/calendar/fullcalendar.min.js'></script> 
	    <script src="https://code.jquery.com/jquery.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.6.1/fullcalendar.min.js"></script>
	    <script src="resources/js/bootstrap.min.js"></script>
		<script type="text/javascript">

		$(document).ready(function()
		{	
			//캘린더 날짜 생성
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
			//캘린더 생성
			var myCalendar = $('#my-calendar-id'); 
			myCalendar.fullCalendar();
			//날짜 객체 담기
			var myEvent = {
			  allDay: true,
			  start: new Date(),
			  end: new Date()
			};
			//캘린더 생성 myEvent를 가져온다.
			myCalendar.fullCalendar( 'renderEvent', myEvent );
				var calendar = $('#calendar').fullCalendar(
				{
					//구글 API Key
					googleCalendarApiKey: 'AIzaSyCkqJjtX6BPPheay8M51tArChIydZUzd48',
					//상단 메뉴바 
					header:
					{
						left: 'prev,next today',
						center: 'title',
						right: 'month'
					},
					defaultView: 'month',
// 					selectable: true,
					selectHelper: true,
// 					editabzle: true,
					droppable: true,
					loading: function(bool) {
						if (bool) {
							$('#loading').show();
						}else{
							$('#loading').hide();
						}
					},
					events: [
						<c:forEach var="calendarlists" items='${calendarlists}'>
							{
									  title: '${calendarlists.c_name}',
									  start: '${calendarlists.c_date}',
									  spot1: '${calendarlists.c_spot1}',
									  spot2: '${calendarlists.c_spot2}',
									  date: '${calendarlists.c_date}',
									  content: '${calendarlists.c_content}'
							},
						</c:forEach>
					],
				//캘린더 클릭시 발생하는 이벤트 (나타내려는 객체 선언)
				  eventClick:  function(event, jsEvent, view) {
						$('#fullCalModal').modal();
			            $('#modal-header').html(event.title);
			            $('#panel-spot').html(event.spot1+" "+event.spot2);
			            $('#panel-date').html(event.date);
			            $('#panel-content').html(event.content);
			        }, 
				});
		});
	</script>
	<style type="text/css">
		body
		{
			margin-top: 40px;
			text-align: center;
			font-size: 14px;
			font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}
		#calendar
		{
			width: 900px;
			margin: 0 auto;
		}
	</style>
<!-- 일정 클릭시 보여주는 모달 -->	
<body onload="doReset();">
	<div id="fullCalModal" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
	   			<div class="modal-dialog">	    
					<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" id="modal-header">
							</div>
							<div class="modal-body">
								<div class="form-group" style="text-align: left;">
									<label for="s_tag"><span class="labeltext">모임장소</span></label>
									<div class="panel panel-default">
										 <div class="panel-body" id="panel-spot"></div>
									</div>
								</div>   
								<div class="form-group" style="text-align: left;">
									<label for="s_tag"><span class="labeltext">모임일정</span></label>
									<div class="panel panel-default">
										 <div class="panel-body" id="panel-date"></div>
									</div>
								</div>
								<div class="form-group" style="text-align: left;">
									<label for="s_tag"><span class="labeltext">모임내용</span></label>
									<div class="panel panel-default">
										 <div class="panel-body" id="panel-content"></div>
									</div>
								</div>
							</div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				            </div>
						</div>
				</div>
	</div>
</content>
</head>
<!--일정 등록시 모달-->
<div id="calendar"></div>

</body>
</html>
