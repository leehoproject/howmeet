<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 리스트</title>
</head>
<content tag="local_script">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
	<script type="text/javascript">
	
	$(document).ready(function() {
		$('#example').DataTable();
		
		$("#allchk").click(function(){
			if($(this).is(':checked')){
				$("input[name=unitchk]").prop("checked",true);
			}else{
				$("input[name=unitchk]").prop("checked",false);
			}
		});
		
		   $('#selectdel').click(function(){
			   var checked = $("input[name=unitchk]:checked").length;
			   var saveids = new Array();
			   if(checked ==0){
				   alert("삭제할 할목을 체크하세요!");
				   return;
			   }else{
				   var returnValue = confirm("삭제 하시겠습니까?");
				   if(returnValue){
				   $('#unitchk:checked').each(function(index){
					   saveids[index] = $(this).val();
				   });
				   var url = "memberSelectDelete?saveids="+saveids;
				   $(location).attr('href',url);
			       }else{
			    	   return;
			       }
			   }
		   });
		});
	
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
                        <th style="text-align:center !important"><input type="checkbox" name="allchk" id="allchk"/></th>
                        <th style="text-align:center !important">User ID</th>
                        <th style="text-align:center !important">Name</th>
                        <th style="text-align:center !important">Email</th>
                        <th style="text-align:center !important">hobby1</th>
                        <th style="text-align:center !important">hobby2</th>
                    </tr> 
                  </thead>
                  <tbody>
                  <c:forEach var="member" items="${members}" >
                          <tr>
							<td style="text-align:center !important"><input type="checkbox" name="unitchk" id="unitchk"/></td>    
                            <td class="hidden-xs" align="center"><a href="memberUpdateForm?m_id=${member.m_id}">${member.m_id}</td></a>
                            <td align="center">${member.m_name}</td>
                            <td align="center">${member.m_email}</td>
                            <td align="center">${member.m_hobby1}</td>
                            <td align="center">${member.m_hobby2}</td>
                          </tr>
                  </c:forEach>      
	    	 <tr>
				<div class="col-md-offset-2 col-md-8 resultMessage text-center" style="margin-top:10px">
				<c:forEach var="page" items="${pages}">
					<span><a href="boardpageselect?page=${page}">[${page}]</a> </span>
				</c:forEach>
			</tr>
				</div>                    
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
					<span class="col-md-5">
						<input type="text" id="find" name="find" value="${memberpaging.getFind()}" />
					</span>
					<span class="col-md-2">
						<button  type="submit"> 검색</button>
					</span>
					<span class="col-md-2">
						<button  type="button" id="selectdel" name="selectdel" > 삭제</button>
					</span>
				</div>
			</div>
            </div>
</div></div></div>
</form>
</body>

</html>