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
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
     
    CKEDITOR.replace( 'b_content', {//해당 이름으로 된 textarea에 에디터를 적용
    	filebrowserImageUploadUrl: 'imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다.
    });
     
     
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
      
        switch (dialogName) {
            case 'image': //Image Properties dialog
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
});
</script>
<style>
	.mainframe{margin-top:50px; padding:50px; border:2px solid #f7f7f7;}
	.title{font-size:20px;}
</style>
</content>
</head>
<body>
<form id="insert_form" name="insert_form" class="form-horizontal" action="society_board_insert" method="post" enctype="multipart/form-data" role="form" data-parsley-validate="true">
<div id="page-content" class="index-page">

<div class="container">
	<div class="row" style="padding-left:20px; padding-right:20px;">
		<div class="col-md-12 mainframe">
			<div class="form-group">
				<span class="title">게시판 작성</span>
				<input type="hidden" id="b_dept1" name="b_dept1" value="${s_hobby}">
				<input type="hidden" id="b_dept2" name="b_dept2" value="${s_dept}">
				<input type="text" class="form-control" id="b_email" name="b_email" value="${sessionemail}" placeholder="아이디" style="display:none" required>
				<input type="text" class="form-control" id="b_name" name="b_name" value="${sessionname}" placeholder="아이디" style="display:none" required>
			</div>
			<div class="form-group">
				<label for="title"><span class="labeltext">아이디 </span></label>
				<div class="col-md-12" style="padding:0;">
					<input type="text" class="form-control" id="b_id" name="b_id" value="${sessionid}" placeholder="아이디"  required>
				</div>
			</div>		
			<div class="form-group">
				<label for="title"><span class="labeltext" >제목</span></label>
				<div class="col-md-12" style="padding:0;">
					<input type="text" class="form-control" id="b_title" name="b_title" required>
				</div>
			</div>
			<div class="form-group">
				<label for="summernote"><span class="labeltext">내용</span></label>
				<textarea class="form-control" id="b_content" name="b_content" maxlength="140" rows="7"></textarea>
			</div>
			<input type="file" id="file" name="file"/>
			<div class="form-group">
				<div class="col-md-12 text-center" style="padding:0;">
					<button type="submit" id="submit" name="submit" class="btn btn-default col-md-12">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</form>
</body>
</html>