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
<!-- 	다음주소찾기 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
	
	<!-- 모임 만들기 창 디자인(차후 외부CSS로) -->
	<style>
	.mainframe{margin-top:30px;}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable();
		$('#file').change(function(event){
			var tmppath=URL.createObjectURL(event.target.files[0]);
			$('#profile').attr('src',tmppath);
		});
	    button = "<div style='margin-left:20px'><button Type='button' id='selectdel' class='btn btn-danger''><i class='fa fa-trash' aria-hidden='true'></i></button>";
	    button += "<button Type='button' data-target='#scheduleModal' data-toggle='modal' class='btn btn-success' style='margin-left:10px'><i class='fa fa-plus-square' aria-hidden='true'></i></button></div>";
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
	    			var societyname = $('#societyname').val();
		    		var url = "scheduleselectdelete?saveids="+saveids+"&societyname="+societyname;
		    		$(location).attr('href',url);	
	    		} else {
	    			return;
	    		}
	    	}
	    });
	  	
	  //주소찾기(다음 우편번호 API)
		$('#zipcode_search').click(function(){
			alert();
			new daum.Postcode({
	        	oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수

	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;

	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('c_zipcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('c_spot1').value = fullAddr;

	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('c_spot2').focus();
	        }
	    	}).open();
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
			            	<th>Date</th>
			                <th>Name</th>
			                <th>Peoplenum</th>     
			                <th>spot</th>  
			                <th style="text-align: center !important"><input Type="checkbox" id="allchk"></th>      
			            </tr>
			        </thead>
			        <tfoot>
			            <tr>
			            	<th>Date</th>
			                <th>Name</th>
			                <th>Peoplenum</th>     
			                <th>spot</th>      
			            </tr>
			        </tfoot>
			        <tbody>
			          <c:forEach var="calendarlist" items="${calendarlists}">
			            <tr>
			                <td>${calendarlist.c_date}</td>
			                <td>${calendarlist.c_name}</td>
			                <td>${calendarlist.c_peoplenum}</td>
			                <td>${calendarlist.c_spot1} ${calendarlist.c_spot2}</td>
			                <th style="text-align: center !important"><input Type="checkbox" id="unitchk" name="unitchk" value="${calendarlist.c_name}"></th>
			            </tr>
			       	  </c:forEach>
			        </tbody>
			    </table>
			 </div>
        </div>
        <!-- /#page-wrapper -->  
        <!-- Modal -->
		<div class="modal fade" id="scheduleModal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">	    
				<!-- Modal content-->
				<form class="popup-form" action="insertschedule" enctype="multipart/form-data" method="POST">
					<input type="hidden" id="c_societyname" name="c_societyname" value="${societyname}">
					<div class="modal-content">
						<div class="modal-body">
							<img class="img-responsive" id="profile" name="profile" src="resources/images/profile.png" style="height: 150px; width: 150px">
							<input type="file" name="file" id="file">
							<div class="input-group" style="margin: 10px 0;">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" name="c_name" id="c_name" class="form-control">
							</div>
							<textarea class="form-control" rows="3" id="c_content" name="c_content" style="resize:none;"></textarea>
							<div class="input-group" style="margin: 10px 0;">
									<span class="input-group-addon">년</span>
									<select id="year" name="c_date1" class="form-control">
										<c:forEach var="a" begin="2016" end="2017" step="1">
											<option>${a}</option>
										</c:forEach>
									</select>
									<span class="input-group-addon">월</span>
									<select id="month" name="c_date2" class="form-control">
										<c:forEach var="a" begin="1" end="12" step="1">
											<option>${a}</option>
										</c:forEach>	
									</select>
									<span class="input-group-addon">일</span>
									<select id="day" name="c_date3" class="form-control">
										<c:forEach var="a" begin="1" end="31" step="1">
											<option>${a}</option>
										</c:forEach>
									</select>
							</div>
							
							<div class="form-group">
								<div class="input-group" style="padding-right: 10px;">
									<input id="c_zipcode" name="c_zipcode" class="form-control"required="" type="text"> 
									<span class="input-group-btn">
										<button id="zipcode_search" type="button"
											class="btn btn-success">우편번호찾기</button> <input type="hidden" id="zipcodesearch" value="no" />
									</span>
								</div>
							</div>
							<input type="text" name="c_spot1" id="c_spot1" class="form-control" style="margin-bottom: 5px;">
							<input type="text" name="c_spot2" id="c_spot2" class="form-control">
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