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
<form class="form-horizontal" action="MemberPageList" method="post" enctype="multipart/form-data" role="form">
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">User List</h3>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th><em class="fa fa-cog"></em></th>
                        <th class="hidden-xs">User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>hobby1</th>
                        <th>hobby2</th>
                    </tr> 
                  </thead>
                  <tbody>
                  <c:forEach var="member" items="${members}" >
                          <tr>
                            <td align="center">
                              <a class="btn btn-default" onclick="location.href='memberUpdate?m_id=${member.m_id}'"><em class="fa fa-pencil"></em></a>
                              <a class="btn btn-danger" onclick="location.href='memberDelete?m_id=${member.m_id}'" ><em class="fa fa-trash"></em></a>
                            </td>
                            <td class="hidden-xs">${member.m_id}</td>
                            <td>${member.m_name}</td>
                            <td>${member.m_email}</td>
                            <td>${member.m_hobby1}</td>
                            <td>${member.m_hobby2}</td>
                          </tr>
                  </c:forEach>        
                        </tbody>
                </table>
            
              </div>
			<div class="row">
				<div class="col-md-offset-2 col-md-8 resultMessage text-center" style="margin-top:10px">
					<span class="col-md-2">
						<select name="Selectbox">
							<option value="m_id" <c:if test="${memberpaging.getSelectbox() =='m_id'}">selected</c:if>>user Id</option>
							<option value="m_name" <c:if test="${memberpaging.getSelectbox() =='m_name'}">selected</c:if>>user Name</option>
						</select>
					</span>
					<span class="col-md-3">
						<input type="text" id="find" name="find" value="${memberpaging.getFind()}" />
					</span>
					<span class="col-md-3">
						<i class="fa fa-search" aria-hidden="true"></i>
						<button  type="submit" class="btn btn-success resultButton"> 검색</button>
					</span>
				</div>
			</div>
            </div>
</div></div></div>
</form>
</body>

</html>