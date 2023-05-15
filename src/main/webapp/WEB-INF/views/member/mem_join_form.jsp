<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="resources/css/main.css" rel="stylesheet"> -->
<!-- <link href="resources/css/common.css" rel="stylesheet"> -->
<!-- <link href="resources/css/inc.css" rel="stylesheet"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// 다음 주소 API
window.onload = function(){
    document.getElementById("postSearch").addEventListener("click", function(){
       
        new daum.Postcode({
            oncomplete: function(data) { 
                document.getElementById("member_address1").value = data.address; // 주소 넣기
                document.querySelector("#member_address2").focus(); //상세입력 포커싱
            }
        }).open();
    });
}


// 입력 검증.
$(function() {
	let idStatus = false;
	let nameStatus = false;
	let passwdStatus = false;
	let passwd2Status = false;
	
	
	// 아이디 검증.
	$("#member_id").on("blur", function() {
		let id = $("#member_id").val();
		
		if(id == "") {
			idStatus = false;
			$("#checkIdResult").html("아이디는 필수 입력 항목입니다").css("color", "red");
			return; 
		} else {
			// 영문자, 숫자, 특수문자 조합 4 ~ 8글자
			let regex = /^[A-Za-z0-9!@#$%]{4,8}$/;
			
			if(!regex.exec(id)) { 
				$("#checkIdResult").html("영문자, 숫자, 특수문자 조합 4 ~ 8글자").css("color", "red");
				idStatus = false;
			} else { 
				$.ajax({
					url: "MemberCheckId", 
					data: {
						id: $("#member_id").val()
					},
					success: function(result) { 
						if(result) {
							$("#checkIdResult").html("이미 사용중인 아이디입니다.").css("color", "red");
							idStatus = false;
						} else {
							$("#checkIdResult").html("사용 가능한 아이디입니다.").css("color", "green");
							idStatus = true;
						}
					}
				}); // ajax
			}
		}
	});
	
	// 비밀번호 검증
	$("#member_pw").on("change", function() {
		let passwd = $("#member_pw").val(); 
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		
		if(!lengthRegex.exec(passwd)) {
			$("#checkPasswdResult").html("영문자, 숫자, 특수문자 8 ~ 16자 필수").css("color", "red");
			$("#member_pw").select();
			passwdStatus = false;
		} else {
			$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
			passwdStatus = true;
		}
		
	});
	
	
	// 비밀번호확인 검증
	$("#member_pw2").on("change", function() {
		if($("#member_pw").val() == $("#member_pw2").val()) {
			$("#checkPasswd2Result").html("비밀번호 일치").css("color", "green");
			passwd2Status = true;
		} else {
			$("#checkPasswd2Result").html("비밀번호 불일치").css("color", "red");
			passwd2Status = false;
		}
	});
	
	// 이름 검증
	$("#member_name").on("change", function() {
		let name = $("#member_name").val(); 
		// 한글 2 ~ 5글자
		let regex = /^[가-힣]{2,5}$/;
		
		if(!regex.exec(name)) {
			$("#checkNameResult").html("한글 2 ~ 5자를 입력하세요.").css("color", "red");
			$("#member_name").select(); 
			nameStatus = false;
		} else {
			$("#checkNameResult").html("사용 가능한 이름 입니다.").css("color", "green");
			nameStatus = true;
		}
	});
	
	
	
	$("form").submit(function() {
		if(!nameStatus) {
			alert("이름을 확인하세요");
			$("#member_name").focus();
			return false;
		} else if(!idStatus) {
			alert("아이디를 확인하세요");
			$("#member_id").focus();
			return false;
		} else if(!passwdStatus) {
			alert("비밀번호를 확인하세요");
			$("#memeber_pw").focus();
			return false;
		} else if(!passwd2Status) {
			alert("비밀번호확인을 확인하세요");
			$("#member_pw2").focus();
			return false;
		} else if($("#member_address1").val() == "") {
			alert("주소를 입력하세요");
			$("#member_address1").focus();
			return false;
		} else if($("#member_address2").val() == "") {
			alert("상세주소를 입력하세요");
			$("#member_address2").focus();
			return false;
		} else if($("#member_bday").val() == "") {
			alert("주소를 입력하세요");
			$("#member_bday").focus();
			return false;
		} else if($("#member_tel").val() == "") {
			alert("주소를 입력하세요");
			$("#member_tel").focus();
			return false;
		}
		
		return true;
		
	});
	
	
	
	
});
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<div id="content">
			<div class="section group section-member">

				<div class="title">회원가입</div>

				<div class="wrap-member-box wrap-join-box" id="join_confirm_section">
					<ul class="join-indicator">
						<li>이메일 입력(소셜 가입)</li>
						<li class="selected">회원정보 입력</li>
						<li>가입 완료</li>
					</ul>
					<form action="joinPro" name="form-join" id="form-join" method="post">
						<div class="wrap-inside">

							<div class="join-detail">
								<label class="label-input" for="id"> <span>아이디</span>
								<input type="text" id="member_id" name="member_id" class="input" placeholder="아이디 입력해주세요">
								</label>
							    <span id="checkIdResult" class="joinCheck"></span>
							</div>
							<div class="join-detail">
								<label class="label-input" for="pass"> <span>비밀번호</span>
									<input type="password" id="member_pw" name="member_pw" class="input" placeholder="영문, 숫자, 특수문자 중 2개 조합 8자 이상">
								</label>
									<span id="checkPasswdResult" class="joinCheck"></span>
							</div>
							<div class="join-detail">
								<label class="label-input" for="pass2"> 
								<span>비밀번호 확인</span> 
								<input type="password" id="member_pw2" name="member_pw2" class="input" placeholder="위에 입력한 비밀번호를 다시 입력해주세요">
								</label>
								<span id="checkPasswd2Result" class="joinCheck"></span>
							</div>
							<div class="join-detail">
								<label class="label-input" for="username"> <span>이름</span>
									<input type="text" id="member_name" name="member_name" class="input" value="" placeholder="실명을 입력해주세요">
								</label>
									 <span id="checkNameResult" class="joinCheck"></span>
							</div>
							<div class="join-detail">
			                    <label class="label-input" for="phone" style="width:342px;display:inline-block;">
			                        <span>주소</span>
			                        <input type="text" style="width:200px;display:inline-block;" id="member_address1" name="member_address1" class="input" placeholder="주소입력">
			                        <span class="joinCheck"></span>
			                    </label>
			                    <a href="#" class="btnsub btnsms" id="postSearch">주소 검색</a>
			                </div>
							<div class="join-detail" style="margin-top:4px">
								<label class="label-input" for="address"> <span>상세주소</span>
									<input type="text" id="member_address2" name="member_address2" class="input" value="" placeholder="상세주소입력">
									<span class="joinCheck"></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="email"> <span>이메일</span>
									<input type="text" id="member_email" name="member_email" class="input" value="${email }" placeholder="인증받은 이메일자동입력" readonly="readonly">
									<span class="joinCheck"></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="bday"> <span>생년월일</span>
									<input type="text" id="member_bday" name="member_bday"
									class="input input-numeric" placeholder="예) 20170101">
									<span class="joinCheck"></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="phone"> <span>휴대폰번호</span>
									<input type="text" id="member_tel" name="member_tel"
									class="input input-numeric" placeholder="휴대폰번호 입력"> <span class="joinCheck"></span>
								</label>
							</div>
							 <input type="hidden" id="socialId" name="socialId" value="">
							 <input type="hidden" id="userFrom" name="userFrom" value="4">
							 <input type="hidden" id="isPayment" name="isPayment" value="0">
							<input type="hidden" id="smsRequest" name="smsRequest" value="">
							<input type="hidden" id="token" name="token" value="">
						</div>	
						<input type="submit" value="회원가입" id="btn-join2" class="btn-join">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>