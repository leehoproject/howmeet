<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<form id="insert_form" name="insert_form" class="form-horizontal" action="boardinsert" method="post" enctype="multipart/form-data" role="form" data-parsley-validate="true">
<div id="page-content" class="index-page">
<div class="container">
	<div class="row" style="padding-left:20px; padding-right:20px;">
		<div class="col-md-12 mainframe">
			<div class="form-group">
				<span class="title">게시판</span>
			</div>
			<div class="form-group">
				<label for="title"><span class="labeltext">제목</span></label>
				<div class="col-md-12" style="padding:0;">
					<input type="text" class="form-control" id="title" name="title" required>
				</div>
			</div>
			<div class="form-group">
				<label for="summernote"><span class="labeltext">모임 설명</span></label>
				<textarea class="form-control" id="summernote" name="content" maxlength="140" rows="7"></textarea>
			</div>
			<div class="form-group">
				<div class="col-md-12 text-center" style="padding:0;">
					<button type="button" id="submit" name="submit" class="btn btn-default col-md-12">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 	<div class="row"> -->
<!-- 		<div class="col-sm-4"></div> -->
<!-- 		<div class="col-sm-6" style="margin-top: 5px; margin-bottom: 3px"> -->
<!-- 			<div class="col-sm-4" > -->
<!-- 			<input Type="file" name="file"/> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-3" > -->
<!-- 				<button Type="submit" id="save" class="btn btn-default" style="width:100%;">저장</button> -->
<!-- 			</div> -->
<!-- 			<div class="col-sm-3">	 -->
<!-- 				<button Type="button" id="cancel" class="btn btn-default" style="width:100%;">취소</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
<!-- 	<div class="col-sm-3"></div> -->
<!-- 	</form> -->
</form>
</body>
</html>