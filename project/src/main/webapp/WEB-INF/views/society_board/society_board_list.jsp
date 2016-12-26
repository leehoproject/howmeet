<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의게시판</title>
</head>
<content tag="local_script">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function() {
	$("#allchk").click(function(){
		if($(this).is(':checked')){
			$("input[name=unitchk]").prop("checked",true);
		}else{
			$("input[name=unitchk]").prop("checked",false);
		}
	});
   $('#selectdel').click(function(){
	   var checked = $("input[name=unitchk]:checked").length;
	   var saveseq = new Array();
	   if(checked ==0){
		   alert("삭제할 할목을 체크하세요!");
		   return;
	   }else{
		   var returnValue = confirm("삭제 하시겠습니까?");
		   if(returnValue){
		   $('#unitchk:checked').each(function(index){
			   saveseq[index] = $(this).val();
		   });
		   var url = "society_boardSelectDelete?saveseq="+saveseq+"&s_hobby="+$(s_hobby).val()+"&s_dept="+$(s_dept).val();
		   $(location).attr('href',url);
	       }else{
	    	   return;
	       }
	   }
   });
} );
</script>
</content>
<body>
<form class="form-horizontal" action="society_boardPageList" method="POST" enctype="multipart/form-data" role="form" style="margin-top: 80px;">
<div class="container">
    <div class="row">
     <input type="hidden" id="s_hobby" name="s_hobby" value="${s_hobby}">
	 <input type="hidden" id="s_dept" name="s_dept" value="${s_dept}">
	 <input type="hidden" id="b_dept1" name="b_dept1" value="${s_hobby}">
	 <input type="hidden" id="b_dept2" name="b_dept2" value="${s_dept}">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <span class="col col-xs-6">
                 <i class="fa fa-table" aria-hidden="true"></i>
                    <h3 class="panel-title">동호회 게시판</h3>
                  </span>
                  <div class="col col-xs-6 text-right">
                    <button type="button" onclick="location.href='society_board_detail?s_hobby=${s_hobby}&s_dept=${s_dept}'">글쓰기</button>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <td width="300" align="center">글제목</td>
                        <td width="100" align="center">UserID</td>
                        <td width="80" align="center">작성일</td>
                        <td width="80" align="center">조회수</td>
                        <th style="text-align:center !important"><input type="checkbox" id="allchk"/></th>
                    </tr> 
                  </thead>
                  <tbody>
                  <c:forEach var="board" items="${boards}" >
                          <tr>
                            <td width="100" align="center"><a href="societyboardreadform?b_seq=${board.b_seq}&s_hobby=${s_hobby}&s_dept=${s_dept}">${board.b_title}</td></a>
                            <td width="80" align="center">${board.b_id}</td>
                            <td width="80" align="center">${board.b_date}</td>
                            <td width="80" align="center">${board.b_hit}</td>
                            <td style="text-align:center !important" width="50" align="center"><input type="checkbox" name="unitchk" 
 							id="unitchk" value="${board.b_seq}"/></td>
                            </td>
                          </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <div class="panel-footer">
                <div class="row">
<div class="col-md-offset-4 col-md-8 resultMessage text-center" style="margin-top:10px">
	<span class="col-md-2">
		<select name="Selectbox">
		<option value="b_title" <c:if test="${boardpaging.getSelectbox() =='b_title'}">selected</c:if>>제목</option>
		<option value="b_name" <c:if test="${boardpaging.getSelectbox() =='board.b_id'}">selected</c:if>>글쓴이</option>
		<option value="b_content" <c:if test="${boardpaging.getSelectbox() =='b_content'}">selected</c:if>>내용</option>
		</select>
	</span>
	<span class="col-md-5">
		<input type="text" id="find" name="find" value="${boardpaging.getFind()}" />
	</span>
	<span class="col-md-2">
		<button  type="submit"> 검색</button>
	</span>
	<span class="col-md-2">
		<button  type="button" id="selectdel" name="selectdel" > 삭제</button>
	</span>
		</div>
          <div class="col col-xs-8">
                <ul class="pagination hidden-xs pull-right">
				<c:forEach var="page" items="${pages}">
					<span><a href="society_boardpageselect?page=${page}&s_hobby=${s_hobby}&s_dept=${s_dept}">[${page}]</a> </span>
				</c:forEach>
                </ul>
                <ul class="pagination visible-xs pull-right">
                    <li><a href="#">«</a></li>
                    <li><a href="#">»</a></li>
                </ul>
          </div>
            </div>
          </div>
      </div>
</div></div></div>
</form>
</body>
</html>