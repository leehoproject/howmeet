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
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/parsley.js"></script>
	
<!-- 회원가입 페이지 제이쿼리 제어부 -->
	<script type="text/javascript">
		//페이지가 시작될때 input안에있는값들을 공백으로 바꿔줌
		function doReset(){
			document.insert_form.m_id.value = "";
			document.insert_form.m_pw.value = "";
			document.insert_form.checkpassword.value = "";	
		}
		
		$(document).ready(function(){
			//종복확인 전체 부분
			$('#confirm').click(function(event) {
				$.ajax({
					type : 'POST',
					data : "m_id=" + id,
					dataType : 'json',
					url : 'idconfirm',
					success : function(data){
						if(id==""){
							alert("아이디를 입력하세요.");
							return;
						}
						if(data==0){
							alert("사용가능한 아이디 입니다.");
							$('#check').attr('value','yes');
						} else {
							alert("중복된 아이디입니다.");
							return;
						}
						return false;
					}
				});
			});
			
			$('#save').click(function(event) {
				if($('#check').val()=='no'){
					alert("아이디 중복 체크를 하세요!")
					return;
				}
				$('#insert_form').submit();
			});
			
			$('#temp').click(function(){
				alert("clicked");
			});
			
		});
		
	</script>	
	<!-- 회원가입 창 디자인(차후 외부CSS로) -->
<style>
.mainframe{padding:0; margin-top:50px; background:#f7f7f7;}
.logoframe{height:100px; padding-top:30px; padding-bottom:20px; border-bottom:2px solid #e9e9e9;}
.memberframe,.sendframe{padding:30px; border-bottom:2px solid #e9e9e9;}
.slogan{font-size:20px;}
.parsleypart{margin-top:5px; height:30px; border-left:3px solid;}
.parsleytext{color:red;}
</style>	
</content>
<body>
<!-- 회원가입 시작 -->
<div id="page-content" class="index-page">
	<div class="container">
		<div class="row" style="padding-left:10px; padding-right:10px;">
			<form  id="insert_form" name="insert_form" class="form-horizontal" action="memberInsert" method="GET" role="form" data-parsley-validate="true">
				<div class="col-md-offset-3 col-md-6 mainframe">
					<div class="col-md-12 text-center logoframe">
						<span class="slogan">사람을 만나는 방법, HowMeet!</span>
					</div>
					<div class="col-md-12 memberframe">
						<div class="form-group">
								<label for="id" class="col-md-4">
									<i class="fa fa-user"></i>
									<span class="labeltext">아이디</span>
								</label>
								<div class="input-group col-md-8" style="padding-right:10px;">
									<input id="id" name="m_id" class="form-control" placeholder="아이디"
									required="" type="text"  data-parsley-type="text" data-parsley-error-message="아이디를 입력하세요."
									data-parsley-errors-container="div[id='m_id_error']"/>
									<span class="input-group-btn">
										<button id="confirm" type="button" class="btn btn-success">중복검사</button>
										<input type="hidden" id="check" value="no"/>
									</span>	
								</div>
								<div id="m_id_error" style="color:red;"></div>
						</div>
						<div class="form-group">
							<label for="pw" class="col-md-4">
								<i class="fa fa-unlock-alt"></i>
								<span class="labeltext">비밀번호</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="password" size="20" name="m_pw" id="pw" class="form-control" placeholder="비밀번호"
								required="" data-parsley-error-message="비밀번호를 입력하세요." data-parsley-errors-container="div[id='m_pw_error']">
							</div>
							<div id="m_pw_error" style="color:red;"></div>
						</div>
						<div class="form-group">
							<label for="checkpassword" class="col-md-4">
								<i class="fa fa-unlock-alt"></i>
								<span class="labeltext">비밀번호 확인</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="password" size="20" name="checkpassword" id="checkpassword" class="form-control" placeholder="비밀번호 확인"
								required="" data-parsley-error-message="비밀번호가 맞지 않습니다." data-parsley-errors-container="div[id='m_chkpw_error']">
							</div>
							<div id="m_chkpw_error" style="color:red;"></div>
						</div>
						<div class="form-group">
							<label for="m_name" class="col-md-4">
								<i class="fa fa-user"></i>
								<span class="labeltext">이름</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_name" id="m_name" class="form-control" placeholder="이름"
								required="" data-parsley-error-message="이름을 입력하세요." data-parsley-errors-container="div[id='m_name_error']">
							</div>
							<div id="m_name_error" style="color:red;"></div>
						</div>			
						<div class="form-group">
							<label for="m_email" class="col-md-4">
								<i class="fa fa-share" aria-hidden="true"></i>
								<span class="labeltext">이메일</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_email" id="m_email" class="form-control" placeholder="이메일"
								required="" data-parsley-error-message="이메일을 입력하세요." data-parsley-errors-container="div[id='m_email_error']">
							</div>
							<div id="m_email_error" style="color:red;"></div>
						</div>			
						<div class="form-group">
							<label for="phone1" class="col-md-4">
								<i class="fa fa-phone"></i>
								<span class="labeltext">휴대폰 번호</span>
							</label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<select class="form-control" name="phone1" id="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<label class="col-md-1 text-center" for="phone2"><span class="labeltext">-</span></label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="phone2" id="phone2" class="form-control">
							</div>
							<label class="col-md-1 text-center" for="phone3"><span class="labeltext">-</span></label>
							<div class="col-md-2" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="phone3" id="phone3" class="form-control">
							</div>
						</div>				
						<div class="form-group">
							<label for="m_addr1" class="col-md-4">
								<i class="fa fa-map-marker"></i>
								<span class="labeltext">주소</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_addr1" id="m_addr1" class="form-control" placeholder="주소"
								required="" data-parsley-error-message="정확한 주소를 입력하세요." data-parsley-errors-container="div[id='m_addr_error']">
							</div>
						</div>		
						<div class="form-group">
							<label for="m_addr2" class="col-md-4">
								<i class="fa fa-map-marker"></i>
								<span class="labeltext">상세주소</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<input type="text" size="20" name="m_addr2" id="m_addr2" class="form-control" placeholder="상세주소"
								required="" data-parsley-error-message="정확한 상세주소를 입력하세요." data-parsley-errors-container="div[id='m_addr_error']">
							</div>
							<div id="m_addr_error" style="color:red;"></div>
						</div>			
						<div class="form-group">
							<label for="m_hobby1" class="col-md-4">
								<i class="fa fa-users" aria-hidden="true"></i>
								<span class="labeltext">관심사1</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<select class="form-control" name="m_hobby1" id="m_hobby1">
									<option value="1">축구</option>
									<option value="2">맛집탐방</option>
									<option value="3">여행</option>
									<option value="4">스터디</option>
									<option value="5">영화</option>
									<option value="6">헬스</option>
									<option value="7">음악</option>
									<option value="8">그림</option>
								</select>
							</div>
						</div>		
						<div class="form-group">
							<label for="m_hobby2" class="col-md-4">
								<i class="fa fa-users" aria-hidden="true"></i>
								<span class="labeltext">관심사2</span>
							</label>
							<div class="col-md-8" style="padding:0; padding-right:10px;">
								<select class="form-control" name="m_hobby2" id="m_hobby2">
									<option value="1">축구</option>
									<option value="2">맛집탐방</option>
									<option value="3">여행</option>
									<option value="4">스터디</option>
									<option value="5">영화</option>
									<option value="6">헬스</option>
									<option value="7">음악</option>
									<option value="8">그림</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-12 sendframe">
						<div class="form-group">
							<div class="col-md-12 text-center">
								<button id="save" type="submit" class="btn btn-default">보내기</button>
								<button type="reset" class="btn btn-default">다시쓰기</button>
								<button type="button" id="temp" class="btn btn-default">확인용</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 회원가입 종료 -->
</body>
</html>