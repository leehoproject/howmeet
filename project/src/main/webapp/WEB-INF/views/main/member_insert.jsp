<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginFail</title>
<style>
	.img-thumbnail {
		border-radius: 60px;
 		-moz-border-radius: 60px;
  		-webkit-border-radius: 60px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#photo').change(function(event){
			var tmppath = URL.createObjectURL(event.target.files[0]);
			$('#image').attr('src',tmppath);
		});
	});
	
	$('#confirm').click(function(){
		var id = $('#id').val();
		if( id == "") {
			alert("ID를 입력하세요!");
			return;
		}
			
		$.ajax({
			type : 'POST',
			data : "id="+ id,
			dataType : 'json',
			url : 'idconfirm',
			success : function(data) {
				if(data==0){
					alert("사용 가능한 ID입니다");
					$('#confirm_chk').attr('value','yes');
				} else {
					alert("중복된 ID입니다");
				}
				return false;
			}
		});
	});
	
</script>
</content>

</head>
<body>
<section class="content-2 col-4" id="features1-108" style="background-color: #fff">
<form id="insert_form" name="insert_form" enctype="multipart/form-data" class="form-horizontal" action="memberInsert" method="POST" role="form" data-parsley-validate="true">
	<div class="container">
	  	<span class="text-success text-center"><h1>회 원 가 입</h1></span>
	 	<br><br>
	  	<div class="text-center">
			<img id="image" name="image" src="resources/images/noimage.jpg" class="img-thumbnail" width="120px" height="120px">
			<br>
			<div align="center">
			<input type="file" id="photo" name="imgfile">
			</div>
		</div>
		<br/><br/>
		<div>
			<div class="text-center">
				<div class="input-group col-md-offset-3 col-md-6">
					<span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
					<input id="email" name="email" class="form-control" type="text" size="16" placeholder="E-mail"  autocomplete="off" 
					required="" data-parsley-error-message="E-mail을 입력 하세요!" />
					<span class="input-group-btn">
						<button id="confirm" type="button" class="btn btn-primary" >중복검사</button>
						<input id="confirm_chk" type="hidden" value="no" />
					</span>
				</div>
			</div>
			<br>
			<div class="text-center">
				<div class="input-group col-md-offset-3 col-md-6">
					<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
					<input id="name" name="name" class="form-control" type="text" size="16" placeholder="이름"  autocomplete="off" 
					required="" data-parsley-error-message="이름을 입력 하세요!" />
				</div>
			</div>
			<br>
			
			<div class="text-center">
				<div class="input-group col-md-offset-3 col-md-6">
					<span class="input-group-addon"><i class="fa fa-phone-square" aria-hidden="true"></i></span>
					<span >
						<select class="form-control">
						    <option value="010" selected="selected">010</option>
						    <option value="011">011</option>
						    <option value="016">016</option>
						    <option value="017">017</option>
						    <option value="018">018</option>
						    <option value="019">019</option>
						</select>
					</span>
					<span class="input-group-addon"><i class="fa fa-minus" aria-hidden="true"></i></span>
					<input id="name" name="phone2" class="form-control" type="text" size="4" maxlength="4"  placeholder="전화번호 앞"  autocomplete="off" 
					required=""   />
					<span class="input-group-addon"><i class="fa fa-minus" aria-hidden="true"></i></span>
					<input id="name" name="phone3" class="form-control" type="text" size="4" maxlength="4" placeholder="전화번호 뒤"  autocomplete="off" 
					required=""   />
				</div>
			</div>
			<br>
			 
			
		</div>
	</div>
</form>
</section>
</body>
</html>