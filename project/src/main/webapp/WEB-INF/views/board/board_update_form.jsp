<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<content tag="local_script">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
	height: 300,
	minHeight: null,
	maxHeight: null,
	focus: true,
	callbacks: {
		onImageUpload: function(files, editor, welEditable) {
			for (var i = files.length - 1; i >= 0; i--) {
			sendFile(files[i], this);
			}
		}
	}
	});
});

//이미지 미적용으로 주석처리
/* function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$('#submit').click(function(event) {
		$.ajax({
		data: "board" +  insert_form,
		type: "POST",
		url: '/boardinsert',
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(url) {
			$(el).summernote('editor.insertImage', url);
			$('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
		}
		});
	});
} */
</script>
<style>
	.mainframe{margin-top:50px; padding:50px; border:2px solid #f7f7f7;}
	.title{font-size:20px;}
</style>
</content>
</head>
<body>
<input type="file" id="file" name="file" style="display:none"/>
<form id="insert_form" name="insert_form" class="form-horizontal" action="boardinsert" method="post" enctype="multipart/form-data" role="form" data-parsley-validate="true">
<div id="page-content" class="index-page">
<div class="container">
	<div class="row" style="padding-left:20px; padding-right:20px;">
		<div class="col-md-12 mainframe">
			<div class="form-group">
				<span class="title">Q&A 게시판</span>
				<input type="text" class="form-control" id="b_email" name="b_email" value="${sessionemail}" placeholder="아이디" style="display:none" required>
				<input type="text" class="form-control" id="b_name" name="b_name" value="${sessionname}" placeholder="아이디" style="display:none" required>
			</div>
			<div class="form-group">
				<label for="title"><span class="labeltext">아이디 </span></label>
				<div class="col-md-12" style="padding:0;">
					<input type="text" class="form-control" id="b_id" name="b_id" disabled="disabled" value="${sessionid}" placeholder="아이디"  required>
				</div>
			</div>
			<div class="form-group">
				<label for="QAtype"><span class="QAtype">문의종류 </span></label>
				<div class="col-md-12" style="padding:0;">
				<select class="form-control" name="b_QAtype" id="b_QAtype" value="${board.getB_QAtype()}">
					<option value="에러">에러</option>
					<option value="기타">기타</option>
				</select>
				</div>
			</div>			
			<div class="col-md-2" style="padding:0; padding-top:20px; padding-bottom:20px;">

			</div>	
			<div class="form-group">
				<label for="title"><span class="labeltext">제목</span></label>
				<div class="col-md-12" style="padding:0;">
					<input type="text" class="form-control" disabled="disabled" id="b_title" name="b_title" value="${board.getB_title()}" required>
				</div>
			</div>
			<div class="form-group">
				<label for="summernote"><span class="labeltext">내용</span></label>
				<textarea class="form-control" id="summernote1"  name="b_content"  disabled="disabled" maxlength="140"  rows="7" >${board.getB_content()}</textarea>
			</div>
			<div class="row">
				<div class="col-sm-5"></div>
				<div class="col-sm-4" style="margin-top: 5px; margin-bottom: 3px">
					<c:if test="${sessionid==board.getB_id() || sessionid == 'admin'}">
					<div class="col-sm-4" >
						<button Type="submit" id="save"  class="btn btn-default" style="width:100%;">수정</button>
					</div>
					<div class="col-sm-4">
						<button Type="button" id="cancel" onclick="location.href='boarddeleteyn?b_seq='+${board.getB_seq()}" class="btn btn-default" style="width:100%;">삭제</button>
					</div>
					</c:if>
					<div class="col-sm-4">	
						<button Type="button" id="reply" onclick="location.href='boardreply?b_seq='+${board.getB_seq()}" class="btn btn-default" style="width:100%;">답글</button>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
</div>
</form>
</body>
</html>