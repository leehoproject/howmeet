<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
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
						right: 'month,agendaWeek,agendaDay'
					},
					defaultView: 'month',
					selectable: true,
					selectHelper: true,
					editable: true,
					droppable: true,
					loading: function(bool) {
						if (bool) {
							$('#loading').show();
						}else{
							$('#loading').hide();
						}
					},
					events: [
					{
		                title:  "Title "+ $('#eventtitle').val(),
		                host :  "모임장 "+ $('#host').val(),
		                eventcontent :"내용 "+ $('#eventcontent').val(),
						start: new Date(y, m, d+1, 19, 0),
						end: new Date(y, m, d+1, 22, 30),
						description : host,
						allDay: false,
					}
				],				
				//캘린더 클릭시 발생하는 이벤트 (나타내려는 객체 선언)
				  eventClick:  function(event, jsEvent, view) {
						$('#fullCalModal').modal();
			            $('#modalTitle').html(event.title);
			            $('#modalBody').html(event.host + "<br>" + event.eventcontent);
			            $('#eventUrl').attr('href',event.url);
			        },
			    //캘린더 일정클릭시 모달에 뿌려주는 부분
					select: function(start, end, allDay) {
						$('#createEventModal').modal('show');
					    	calendar.fullCalendar('renderEvent',
					            {
					                title:  "Title "+ $('#eventtitle').val(),
					                host :  "모임장 "+ $('#host').val(),
					                eventcontent :"내용 "+ $('#eventcontent').val(),
					                start: start,
					                end: end,
					                allDay: allDay
					            },
 
					            true // make the event "stick"
					        );
					        /**
					         * ajax call to store event in DB
					         */
					    calendar.fullCalendar('unselect');
					} ,  
				// Home 컨트롤러이동,
// 			    eventSources: [
// 			                   {
// 			                       url: '홈컨트롤러명',
// 			                       type: 'POST',
// 			                       data: {
// 			                           custom_param1: 'something',
// 			                           custom_param2: 'somethingelse'
// 			                       },
// 			                       error: function() {
// 			                           alert('there was an error while fetching events!');
// 			                       },
// 			                       color: 'yellow',   // a non-ajax option
// 			                       textColor: 'black' // a non-ajax option
// 			                   }
// 			               ]
				});
				$("#Send").click(function(){
					
					alert("haha");
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
<div id="fullCalModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                	<span aria-hidden="true">×</span> 
                	<span class="sr-only">close</span>
                </button>
                <h4 id="modalTitle" class="modal-title"></h4>
            </div>
            <div id="modalBody" class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button class="btn btn-primary"><a id="eventUrl" target="_blank">Event Page</a></button>
            </div>
        </div>
    </div>
</div>
</content>
</head>
<!--일정 등록시 모달-->
<div id="calendar"></div>
<div id="createEventModal"class="modal fade" id="layerpop" >
  <div class="modal-dialog modal-lg">
        <div class="modal-content">
         <input type="text" name="patientName" id="patientName" tyle="margin: 0 auto;" data-provide="typeahead" data-items="4" data-source="[&quot;Value 1&quot;,&quot;Value 2&quot;,&quot;Value 3&quot;]">
             <input type="hidden" id="apptStartTime"/>
             <input type="hidden" id="apptEndTime"/>
             <input type="hidden" id="apptAllDay" />
            <form action="calendarDB" class="form-horizontal">
                <input type="hidden" id="check" value="no"/>
                <input type="hidden" id="check" value="no"/>
                <div class="modal-header">
                    <h4>모임날짜지정</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="event-title" class="col-lg-2 control-label">행사타이틀</label>
                        <div class="col-lg-10">
                            <input id="eventtitle" name="eventtitle" type="text" class="form-control" id="kontakt-name" placeholder="제목">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="event-host" class="col-lg-2 control-label">모임장</label>
                        <div class="col-lg-10">
                            <input id="host" name="host" type="text" class="form-control" id="kontakt-email" placeholder="이름">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="event-content" class="col-lg-2 control-label">내용</label>
                        <div class="col-lg-10">
                            <textarea id="eventcontent" name="eventcontent" class="form-control" id="kontakt-nachricht" rows="8"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <button class="btn btn-primary" id="Send" name="Send" type="submit">Send</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
