<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<content tag="local_script">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/itschool.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
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
    function sendFile(file, el) {
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
    }
</script>
</content>
</head>
	<body>
	<form id="insert_form" name="insert_form" class="form-horizontal" action="boardinsert" method="post" enctype="multipart/form-data" role="form" data-parsley-validate="true">
	<div class="col-sm-1"></div>
	<div class="col-sm-8" style="border:1px solid #dddddd;">
		
		<div class="row" style="border-bottom:1px solid #eeeeee;  background-color:#cccccc ">
			<div class="col-sm-4" ></div>
			<div class="col-sm-4" style="text-align:center;" >
				<font face="Arial Black" color="#ffffff" size="6">게시판</font>
			</div>
			<div class="col-sm-4" ></div>
		</div>
	  <div class="form-group">
	    <input type="text" class="form-control" id="subject" name="subject" placeholder="subject" required>
	  </div>
	  <div class="form-group">
	    <textarea class="form-control" id="summernote" name="content" placeholder="content" maxlength="140" rows="7"></textarea>
	  </div>
	  <button type="button" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button>
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