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
				<textarea class="form-control" id="b_content" disabled="disabled" name="b_content"  maxlength="140"  rows="80" >${board.getB_content()}</textarea>
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
                  <tbody>
	                  <c:forEach var="replys" items="${replys}" >
	                          <tr>
	                          	 <td style="border:1x; border-style:solid; border-color:#000000; padding: 2em;" class="hidden-xs" width="50" align="left" >
	                          	 ${sessionid} <br><br> ${replys.r_content} <br><br>  ${replys.r_date}
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