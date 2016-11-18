<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>캘린더</title>
  <title>How to add calendar using jQuery and fullCalendar</title>
		<content tag="local_script">
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
			
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
				var calendar = $('#calendar').fullCalendar(
				{
				header:
				{
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				  eventClick:  function(event, jsEvent, view) {
			            $('#modalTitle').html(event.title);
			            $('#modalBody').html(event.description);
			            $('#eventUrl').attr('href',event.url);
			            $('#fullCalModal').modal();
			        },

				defaultView: 'month',

				selectable: true,
				selectHelper: true,

				select: function(start, end, allDay)
				{
// 			         endtime = $.fullCalendar.formatDate(end,'h:mm tt');
// 			          starttime = $.fullCalendar.formatDate(start,'ddd, MMM d, h:mm tt');
// 			          var mywhen = starttime + ' - ' + endtime;
// 				      $('#createEventModal #apptStartTime').val(start);
// 			          $('#createEventModal #apptEndTime').val(end);
// 			          $('#createEventModal #apptAllDay').val(allDay);
// 			          $('#createEventModal #when').text(mywhen);
			          $('#createEventModal').modal();
				},
				
				editable: true,
				//
				events: [
					{
						title: 'example Party',
						start: new Date(y, m, d+1, 19, 0),
						end: new Date(y, m, d+1, 22, 30),
						description : '서울서울',
						allDay: false,
					},
					{
						title: 'example hoho',
						start: new Date(y, m, 28),
						end: new Date(y, m, 29),
						url: 'http://google.com/'
					}
				],
				// Home 컨트롤러이동,,,,,,,,,,
			    eventSources: [
			                   {
			                       url: '홈컨트롤러명',
			                       type: 'POST',
			                       data: {
			                           custom_param1: 'something',
			                           custom_param2: 'somethingelse'
			                       },
			                       error: function() {
			                           alert('there was an error while fetching events!');
			                       },
			                       color: 'yellow',   // a non-ajax option
			                       textColor: 'black' // a non-ajax option
			                   }
			               ]
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
<body>
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
	<!--FullCalendar container div-->
<div id="calendar"></div>
<div id="createEventModal"class="modal fade" id="layerpop" >
  <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form action="" class="form-horizontal">
                <div class="modal-header">
                    <h4>모임날짜지정</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="event-title" class="col-lg-2 control-label">행사타이틀</label>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" id="kontakt-name" placeholder="제목">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="event-host" class="col-lg-2 control-label">모임장</label>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" id="kontakt-email" placeholder="이름">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="event-content" class="col-lg-2 control-label">내용</label>
                        <div class="col-lg-10">
                            <textarea class="form-control" id="kontakt-nachricht" rows="8"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <button class="btn btn-primary" type="submit">Send</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
