<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/find.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	//휴대폰 번호 인증
	var code2 = "";
	$("#btnSend").click(function(){
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		var phone = $("#member_tel").val();
		$.ajax({
	        type:"GET",
	        url:"phoneCheck?phone=" + phone,
	        cache : false,
	        success:function(data){
	        	if(data == "error"){
	        		alert("휴대폰 번호가 올바르지 않습니다.")
					$("#phoneCheck").text("유효한 번호를 입력해주세요.");
					$("#phoneCheck").css("color","red");
					$("#member_tel").attr("autofocus",true);
	        	}else{	        		
	        		$("#member_tel2").attr("disabled",false);
	        		$("#btnAuth").css("display","inline-block");
	        		$("#phoneCheck2").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
	        		$("#phoneCheck2").css("color","green");
	        		$("#member_tel").attr("readonly",true);
	        		code2 = data;
	        	}
	        }
	    });
	});
	
	//휴대폰 인증번호 대조
	$("#btnAuth").click(function(){
		if($("#member_tel2").val() == code2){
			$("#phoneCheck2").text("인증번호가 일치합니다.");
			$("#phoneCheck2").css("color","green");
			$("#phoneDoubleChk").val("true");
			$("#member_tel2").attr("disabled",true);
		}else{
			$("#phoneCheck2").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$("#phoneCheck2").css("color","red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
		}
	});
	
	
	// 입력 확인.
	$("form").submit(function() {
		if($("#member_id").val() == "") {
			alert("아이디를 입력하세요.");
			$("#member_id").focus();
			return false;
		} else if($("#member_name").val() == "") {
			alert("이름을 입력하세요.");
			$("#member_name").focus();
			return false;
		} else if($("#member_bday").val() == "") {
			alert("생년월일을 입력하세요.");
			$("#member_bday").focus();
			return false;
		} else if($("#member_tel").val() == "") {
			alert("휴대폰번호를 입력하세요.");
			$("#member_tel").focus();
			return false;
		} else if(!$("#phoneDoubleChk").val()) {
			alert("인증번호를 확인하세요.");
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
			<a href="findId">아이디 찾기</a>
			<a href="findPw" class="active">비밀번호 찾기</a>
		</div>
		<div class="tabs-cont">
			<div class="cont">
				<form action="renewPw" id="findForm" name="findForm" method="post" autocomplete="off">
						
					<h3 class="h3-member">아이디</h3>
					<div class="mb30"><input type="text" id="member_id" name="member_id" class="inp-member" placeholder="아이디 입력" maxlength="12"></div>
					<h3 class="h3-member">이름</h3>
					<div class="mb30"><input type="text" id="member_name" name="member_name" class="inp-member" placeholder="이름 입력"></div>
					<h3 class="h3-member">생년월일</h3>
					<div class="mb30"><input type="text" id="member_bday" name="member_bday" class="inp-member onlyNumber" placeholder="생년월일 8자리(19810101)" maxlength="8"></div>
					<h3 class="h3-member">휴대폰번호</h3>
					<div class="mb30">
						<div class="inp-box1">
							<input type="tel" id="member_tel" name="member_tel" class="inp-member onlyNumber" placeholder="-없이 휴대폰번호 입력" maxlength="11">
							<button type="button" id="btnSend" class="btn-type1">인증요청</button>
							<span id="phoneCheck"></span>
						</div>
					</div>
					<div id="auth-cont" style="display:block">
						<h3 class="h3-member">인증번호</h3>
						<div class="mb30">
							<div class="inp-box1">
								<input type="text" id="member_tel2" name="member_tel2" class="inp-member" placeholder="인증번호 입력" maxlength="4" disabled="disabled">
								<button type="button" id="btnAuth" class="btn-type1">인증완료</button>
								<span id="phoneCheck2"></span>
								<input type="hidden" id="phoneDoubleChk"/>
							</div>
						</div>
					</div>
					<div class="check-desc text-left">휴대폰번호가 변경된 경우 하단 <strong>휴대폰 인증 찾기</strong>를 통하여 <strong>아이디찾기</strong>를 진행해주시기 바랍니다.</div>
	
					<button type="submit" class="btn-type0 mb50">비밀번호 재설정</button>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>