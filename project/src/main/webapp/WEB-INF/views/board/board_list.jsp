<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<content tag="local_script">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#write').click(function(){
			    var url = "board_detail";
			    $(location).attr('href',url);	
		    });
		} );
	</script>
</content>
<body>
<form class="form-horizontal" action="boardPageList" method="POST" enctype="multipart/form-data" role="form">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <span class="col col-xs-6">
                 	<i class="fa fa-table" aria-hidden="true"></i>
                    	<h3 class="panel-title">Q & A</h3>
                  </span>
                  <div class="col col-xs-6 text-right">
                    <button type="button" class="btn btn-sm btn-primary btn-create" onclick="location.href='board_detail'">글쓰기</button>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <td class="hidden-xs" width="50">번호</td>
                        <td width="300" align="center">글제목</td>
                        <td width="100" align="center">UserID</td>
                        <td width="80" align="center">작성일</td>
                        <td width="80" align="center">조회수</td>
                        <td width="100" align="center"><em class="fa fa-cog"></em></th>
                    </tr> 
                  </thead>
                  <tbody>
                  		<c:forEach var="board" items="${boards}" >
                          <tr>
                            <td class="hidden-xs" width="50" align="center">1</td>
                            <td width="100" align="center"><a href="board_update_form?b_seq=${board.b_seq}">${board.b_title}</td></a>
                            <td width="80" align="center">${board.b_name}</td>
                            <td width="80" align="center">${board.b_date}</td>
                            <td width="80" align="center">${board.b_hit}</td>
                            <td align="center" width="100" align="center">
                            <a class="btn btn-default" ><em class="fa fa-pencil"></em></a>
                            <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
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
							<option value="b_name" <c:if test="${boardpaging.getSelectbox() =='b_name'}">selected</c:if>>글쓴이</option>
							<option value="b_content" <c:if test="${boardpaging.getSelectbox() =='b_content'}">selected</c:if>>내용</option>
						</select>
					</span>
					<span class="col-md-3">
						<input type="text" id="find" name="find" value="${boardpaging.getFind()}" />
					</span>
					<span class="col-md-3">
						<i class="fa fa-search" aria-hidden="true"></i>
						<button  type="submit" class="btn btn-success resultButton"> 검색</button>
					</span>
					
				</div>
                  <div class="col col-xs-8">
                    <ul class="pagination hidden-xs pull-right">
					<c:forEach var="page" items="${pages}">
					<span><a href="boardpageselect?page=${page}">[${page}]</a> </span>
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