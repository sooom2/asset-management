<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/member.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/find.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function() {
	let passwdStatus = false;
	let passwd2Status = false;
	
	$("#member_pw").on("change", function() {
		let pw = $("#member_pw").val();
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		
		if(!lengthRegex.exec(pw)) {
			$("#pw-check").html("영문자, 숫자, 특수문자 8자 이상").css("color", "red");
			$("#member_pw").select(); 
		} else {
			$("#pw-check").html("사용가능한 패스워드").css("color", "green"); 
			passwdStatus = true;
		}
	});
	
	
	$('#member_pw2').on("change", function() {
		const pw = $('#member_pw').val()
		const pw2 = $(this).val()
		
		if(pw == pw2) {
			$("#pw-check2").html('비밀번호가 일치합니다.');
			$("#pw-check2").css('color','green');
			passwd2Status = true;
		} else {
			$("#pw-check2").html('비밀번호가 일치하지 않습니다.');
			$("#pw-check2").css('color','red');
		}
	});
	
	
	$("form").submit(function() {
		if(!passwdStatus) {
			swal("비밀번호를 확인하세요");
			$("#member_pw").focus();
			return false;
		} else if(!passwd2Status) {
			swal("비밀번호를 확인하세요");
			$("#member_pw2").focus();
			return false;
		}
		return true;
	});
	
	
	
});

</script>
</head>
<body>
<jsp:include page="../nav.jsp" />
<div class="member">
	<div class="list-tabs">
		<a href="renewPw" class="active">비밀번호 재설정</a>
	</div>
	<div class="tabs-cont">
		<div class="cont">
			<form action="renewPwPro" id="renewPwPro" name="findForm" method="post" autocomplete="off">
				<input type="hidden" name="member_id" value="${member_id }">
				<h3 class="h3-member">새 비밀번호</h3>
				<div class="mb30"><input type="password" id="member_pw" name="member_pw" class="inp-member" placeholder="영문자, 숫자, 특수문자 8자 이상"><span id="pw-check"></span></div>
				<h3 class="h3-member">새 비밀번호 확인</h3>
				<div class="mb30 member_pw2"><input type="password" id="member_pw2" name="member_pw2" class="inp-member onlyNumber" placeholder="위에 입력한 비밀번호를 다시 입력해주세요" ><span id="pw-check2"></span></div>
				
				<button type="submit" class="btn-type0 mb50">비밀번호 설정</button>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>