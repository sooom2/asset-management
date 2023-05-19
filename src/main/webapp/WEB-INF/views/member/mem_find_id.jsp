<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/find.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../nav.jsp" />
<div class="member">
	<div class="list-tabs">
		<a href="findId" class="active">아이디 찾기</a>
		<a href="findPw">비밀번호 찾기</a>
	</div>
	<div class="tabs-cont">
		<div class="cont">
			<form action="findIdPro" id="findIdPro" name="findForm" method="post" autocomplete="off">
				<h3 class="h3-member">이름</h3>
				<div class="mb30"><input type="text" id="MemberNm" name="member_name" class="inp-member" placeholder="이름 입력"></div>
				<h3 class="h3-member">생년월일</h3>
				<div class="mb30"><input type="text" id="member_bday" name="member_bday" class="inp-member onlyNumber" placeholder="생년월일 8자리(19810101)" maxlength="8"></div>
				<h3 class="h3-member">휴대폰번호</h3>
				<div class="mb30"><input type="tel" id="member_tel" name="member_tel" class="inp-member onlyNumber" placeholder="-없이 휴대폰번호 입력" maxlength="11"></div>
				<div class="check-desc text-left">휴대폰번호가 변경된 경우 하단 <strong>휴대폰 인증 찾기</strong>를 통하여 <strong>아이디찾기</strong>를 진행해주시기 바랍니다.</div>

				<button type="submit" class="btn-type0 mb50">아이디 찾기</button>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>