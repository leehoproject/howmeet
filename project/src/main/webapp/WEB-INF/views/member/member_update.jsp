<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사람을 만나는 방법, HowMeet</title>
</head>
<content tag="local_script"> <!-- 부트스트랩,font-awsome 부분 필요 CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- 페이지 구성 CSS -->
<link href="resources/css/style.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script> <script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <script
	type="text/javascript">
		$(document)
				.ready(
						function() {
							//주소찾기(다음 우편번호 API)
							$('#zipcode_search')
									.click(
											function() {
												new daum.Postcode(
														{
															oncomplete : function(
																	data) {
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
																if (data.userSelectedType === 'R') {
																	//법정동명이 있을 경우 추가한다.
																	if (data.bname !== '') {
																		extraAddr += data.bname;
																	}
																	// 건물명이 있을 경우 추가한다.
																	if (data.buildingName !== '') {
																		extraAddr += (extraAddr !== '' ? ', '
																				+ data.buildingName
																				: data.buildingName);
																	}
																	// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
																	fullAddr += (extraAddr !== '' ? ' ('
																			+ extraAddr
																			+ ')'
																			: '');
																}

																// 우편번호와 주소 정보를 해당 필드에 넣는다.
																document
																		.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
																document
																		.getElementById('m_addr1').value = fullAddr;

																// 커서를 상세주소 필드로 이동한다.
																document
																		.getElementById(
																				'm_addr2')
																		.focus();
															}
														}).open();
											});

							//submit 전 유효성검사 부분
							$('#save').click(
									function(event) {
										var password = $('#pw').val();
										var chkpassword = $('#checkpassword')
												.val();
										var hobby1 = $(
												'#m_hobby1 option:selected')
												.val();
										var hobby2 = $(
												'#m_hobby2 option:selected')
												.val();

										if ($('#id').val() == "") {
											alert("아이디를 입력하세요.");
											return false;
										}

										if ($('#pw').val() == "") {
											alert("비밀번호를 입력하세요.");
											return false;
										}

										if ($('#checkpassword').val() == "") {
											alert("비밀번호를 다시 한 번 입력하세요.");
											return false;
										}

										if ($('#m_name').val() == "") {
											alert("이름을 입력하세요.");
											return false;
										}

										if ($('#m_email').val() == "") {
											alert("이메일을 입력하세요.");
											return false;
										}

										if ($('#phone2').val() == "") {
											alert("휴대폰 가운데 번호를 입력하세요.");
											return false;
										}

										if ($('#phone3').val() == "") {
											alert("휴대폰 마지막 번호를 입력하세요.");
											return false;
										}

										if ($('#m_addr1').val() == "") {
											alert("주소를 입력하세요.");
											return false;
										}

										if ($('#m_zipcode').val() == "") {
											alert("우편번호를 입력하세요.");
											return false;
										}

										if ($('#check').val() == 'no') {
											alert("아이디 중복 체크를 하세요!");
											return false;
										}

										if (password != chkpassword) {
											alert("비밀번호를 확인하세요.");
											return false;
										}

										if (hobby1 == hobby2) {
											alert("서로 다른 관심사를 선택하세요.");
											return false;
										}

										return true;
									});
						});
	</script> <!-- 회원가입 창 디자인(차후 외부CSS로) -->
<style>
.mainframe {
	padding: 0;
	margin-top: 50px;
	background: #f7f7f7;
}

.logoframe {
	height: 100px;
	padding-top: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #e9e9e9;
}

.memberframe, .sendframe {
	padding: 30px;
	border-bottom: 2px solid #e9e9e9;
}

.slogan {
	font-size: 20px;
}

.parsleytext {
	color: red;
}

@media ( max-width :990px) {
	#dash1, #dash2 {
		visibility: hidden;
	}
}
</style>
</content>
<body>
	<!-- 정보수정 시작 -->
	<form class="form-horizontal" action="memberUpdate" method="POST"
		role="form">
		<div class="container">
			<div class="row" style="padding-left: 10px; padding-right: 10px;">
				<div class="col-md-offset-3 col-md-6 mainframe">
					<div class="col-md-12 text-center logoframe">
						<span class="slogan">사람을 만나는 방법, HowMeet!</span>
					</div>
					<div class="col-md-12 memberframe">
						<div class="form-group">
							<label for="id" class="col-md-4"> <i class="fa fa-user"></i>
								<span class="labeltext">아이디</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
								<input type="text" size="20" id="id" name="m_id"
									value="${member.getM_id()}" class="form-control"
									readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="pw" class="col-md-4"> <i
								class="fa fa-unlock-alt"></i> <span class="labeltext">비밀번호</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
								<input type="password" size="20" name="m_pw" id="pw"
									class="form-control" value="${member.getM_pw()}">
							</div>
						</div>
						<div class="form-group">
							<label for="checkpassword" class="col-md-4"> <i
								class="fa fa-unlock-alt"></i> <span class="labeltext">비밀번호
									확인</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
								<input type="password" size="20" name="checkpassword"
									id="checkpassword" class="form-control"
									value="${member.getM_pw()}">
							</div>
						</div>
						<div class="form-group">
							<label for="m_name" class="col-md-4"> <i
								class="fa fa-user"></i> <span class="labeltext">이름</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
								<input type="text" size="20" name="m_name" id="m_name"
									class="form-control" value="${member.getM_name()}">
							</div>
						</div>
						<div class="form-group">
							<label for="m_email" class="col-md-4"> <i
								class="fa fa-share" aria-hidden="true"></i> <span
								class="labeltext">이메일</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
								<input type="text" size="20" name="m_email" id="m_email"
									class="form-control" value="${member.getM_email()}">
							</div>
						</div>
						<div class="form-group">
							<label for="m_phone1" class="col-md-4"> <i
								class="fa fa-phone"></i> <span class="labeltext">휴대폰 번호</span>
							</label>
							<div class="col-md-2" style="padding: 0; padding-right: 10px;">
								<select class="form-control" name="m_phone1" id="m_phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<label class="col-md-1 text-center" for="m_phone2" id="dash1"><span
								class="labeltext">-</span></label>
							<div class="col-md-2" style="padding: 0; padding-right: 10px;">
								<input type="text" size="20" name="m_phone2" id="m_phone2"
									value="${member.getM_phone2()}" class="form-control">
							</div>
							<label class="col-md-1 text-center" for="m_phone3" id="dash2"><span
								class="labeltext">-</span></label>
							<div class="col-md-2" style="padding: 0; padding-right: 10px;">
								<input type="text" size="20" name="m_phone3" id="m_phone3"
									value="${member.getM_phone3()}" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="m_addr1" class="col-md-4"> <i
								class="fa fa-map-marker"></i> <span class="labeltext">주소</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
								<input type="text" size="20" name="m_addr1" id="m_addr1"
									class="form-control" value="${member.getM_addr1()}">
							</div>
						</div>
						<div class="form-group">
							<label for="m_addr2" class="col-md-4"> <i
								class="fa fa-map-marker"></i> <span class="labeltext">상세주소</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
								<input type="text" size="20" name="m_addr2" id="m_addr2"
									class="form-control" value="${member.getM_addr2()}">
							</div>
						</div>
						<div class="form-group">
							<label for="m_zipcode" class="col-md-4"> <i
								class="fa fa-map-marker"></i> <span class="labeltext">우편번호</span>
							</label>
							<div class="input-group col-md-8" style="padding-right: 10px;">
								<input id="m_zipcode" name="m_zipcode" class="form-control"
									value="${member.getM_zipcode()}" required="" type="text">
								<span class="input-group-btn">
									<button id="zipcode_search" type="button"
										class="btn btn-success">우편번호찾기</button> <input type="hidden"
									id="zipcodesearch" value="no" />
								</span>
							</div>
						</div>
						<div class="form-group">
							<label for="m_hobby1" class="col-md-4"> <i
								class="fa fa-users" aria-hidden="true"></i> <span
								class="labeltext">관심사1</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
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
							<label for="m_hobby2" class="col-md-4"> <i
								class="fa fa-users" aria-hidden="true"></i> <span
								class="labeltext">관심사2</span>
							</label>
							<div class="col-md-8" style="padding: 0; padding-right: 10px;">
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
								<button type="submit" id="save" class="btn btn-default">수정하기</button>
								<button type="button" class="btn btn-default"
									onclick="location.href='memberDeleteForm?m_id=${sessionid}'">회원탈퇴</button>
								<button type="button" class="btn btn-default"
									onclick="location.href='home'">메인으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 정보수정 종료 -->
</body>
</html>