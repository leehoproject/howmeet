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
</script>
<style>
	.mainframe{margin-top:50px; padding:50px; border:2px solid #f7f7f7;}
	.title{font-size:20px;}
</style>
</content>
</head>
<body>
<input type="file" id="file" name="file" style="display:none"/>
<form id="insert_form" name="insert_form" class="form-horizontal" action="replyInsert" method="GET" enctype="multipart/form-data" role="form" data-parsley-validate="true">
<div id="page-content" class="index-page">
<div class="container">
	<div class="row" style="padding-left:20px; padding-right:20px;">
		<div class="col-md-12 mainframe">
			<div class="form-group">
				<input Type="hidden" id="b_seq" name="b_seq" value="${board.getB_seq()}"/>
				<span class="title">Q&A 게시판</span>
				<input type="text" class="form-control" id="b_email" name="b_email" value="${sessionemail}" placeholder="아이디" style="display:none" required>
				<input type="text" class="form-control" id="b_name" name="b_name" value="${sessionname}" placeholder="아이디" style="display:none" required>
			</div>
			<div class="form-group">
				<label for="writrlabel"><div class="labeltext">제목  </div></label>
				<label for="writr"><span class="labeltext">${board.b_title} </span></label>
			</div>	
			<div class="form-group">
				<label for="writrlabel"><div class="labeltext">아이디  </div></label>
				<label for="writr"><span class="labeltext">${board.b_id} </span></label>
				<label for="hitlabel"><div class="labeltext">조회수  </div></label>
				<label for="hit"><span class="labeltext">${board.b_hit} </span></label>
				<label for="hitlabel"><div class="labeltext">문의종류</div></label>
				<label for="hit"><span class="labeltext">${board.b_QAtype} </span></label>
			</div>	
			<div class="form-group">
				<label for="summernote"><span class="labeltext">내용</span></label>
				<textarea class="form-control" id="summernote1" disabled="disabled" name="b_content"  maxlength="140"  rows="30" >${board.getB_content()}</textarea>
			</div>
			<div class="form-group">
				<label for="writrlabel"><div class="labeltext">아이디  </div></label>
				<label for="writr"><span class="labeltext">${board.b_id} </span></label>
			</div>				
			<div class="form-group">
				<label for="summernote"><span class="labeltext">댓글</span></label>
				<textarea class="form-control" id="r_content"  name="r_content"  maxlength="140"  rows="5" ></textarea>
			</div>	
			<div class="row">
				<div class="col-sm-5"></div>
				<div class="col-sm-4" style="margin-top: 5px; margin-bottom: 3px">
					<c:if test="${sessionid==board.getB_id() || sessionid == 'admin'}">
					<div class="col-sm-4" >
						<button Type="button" id="update"  class="btn btn-default" style="width:100%;">수정</button>
					</div>
					<div class="col-sm-4">
						<button Type="button" id="cancel" onclick="location.href='boarddeleteyn?b_seq='+${board.getB_seq()}" class="btn btn-default" style="width:100%;">삭제</button>
					</div>
					</c:if>
					<div class="col-sm-4">	
						<button Type="submit" id="reply" onclick="location.href='replyInsert?b_seq='+${board.getB_seq()}" class="btn btn-default" style="width:100%;">댓글</button>
					</div>
				</div>	
			</div>		
	
	
                <table class="table table-striped table-bordered table-list">
                  <thead>
                  </thead>
                  <tbody>
                  <c:forEach var="replys" items="${replys}" >
                          <tr>
                          	 <td class="hidden-xs" width="50" align="left">${sessionname}                            ${replys.r_content}</td>
                            </td>
                          </tr>
                  </c:forEach>
                        </tbody>
                </table>	
			
		</div>
	</div>
</div>
</div>
</form>
</body>
</html>