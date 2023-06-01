<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/resources/css/member.css" rel="stylesheet" >
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path }/resources/js/member.js"></script>
<script>

// 다음 주소 API
window.onload = function(){
    document.getElementById("postSearch").addEventListener("click", function(){
       
        new daum.Postcode({
            oncomplete: function(data) { 
                document.getElementById("member_address").value = data.address; // 주소 넣기
                document.querySelector("#member_address_detail").focus(); //상세입력 포커싱
            }
        }).open();
    });
    
    $('input[type="file"]').change(function(){
    	var file = $(this)[0].files[0]
    	$(".previewImg").attr('src', URL.createObjectURL(file))
    })
}

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

</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<div id="content">
			<div class="section group section-member">
				<div class="title">회원가입</div>
				<div class="wrap-member-box wrap-join-box" id="join_confirm_section" >
					<ul class="join-indicator">
						<li>이메일 입력(소셜 가입)</li>
						<li class="selected">회원정보 입력</li>
						<li>가입 완료</li>
					</ul>
					<form action="joinPro" name="form-join" id="form-join" method="post" enctype="multipart/form-data">
						<div class="wrap-inside">
						
							<div class="profile_edit_image">
								<label class="profile_edit_image_box" id="upFile">
									<img src="http://c3d2212t3.itwillbs.com/images/member/profile_default.jpg" alt="프로필 이미지" class="previewImg">
									<img src="https://ccimage.hellomarket.com/img/web/member/edit_camera.svg" alt="프로필 사진 등록 이미지">
									<input type="file" class="pf_img" name="file" id="upFile" accept="image/jpeg, image/png">
								</label>
							</div>
							
							<div class="join-detail">
								<label class="label-input" for="id"> <span>아이디</span>
								<input type="text" id="member_id" name="member_id" class="input" placeholder="아이디 입력해주세요">
								</label>
							    <span id="checkIdResult" class="joinCheck"></span>
							</div>
							<div class="join-detail">
								<label class="label-input" for="nickname"> <span>닉네임</span>
								<input type="text" id="member_nickname" name="member_nickname" class="input" placeholder="닉네임을 입력해주세요">
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
			                        <input type="text" style="width:190px;display:inline-block;" id="member_address" name="member_address" class="input" placeholder="주소입력" readonly="readonly">
			                        <span class="joinCheck"></span>
			                    </label>
			                    <a href="#" class="btnsub btnsms" id="postSearch">주소 검색</a>
			                </div>
							<div class="join-detail" style="margin-top:4px">
								<label class="label-input" for="address"> <span>상세주소</span>
									<input type="text" id="member_address_detail" name="member_address_detail" class="input" value="" placeholder="상세주소입력">
									<span class="joinCheck"></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="email"> <span>이메일</span>
									<input type="text" id="member_email" name="member_email" class="input" value="${email }" 
									<c:if test="${not empty email }"> placeholder="인증받은 이메일자동입력" readonly="readonly" </c:if>>
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