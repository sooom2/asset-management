<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<link href="resources/css/inc.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<div id="content">
			<div class="section group section-member">

				<div class="title">아이무비</div>

				<div class="wrap-member-box wrap-join-box" id="join_confirm_section">
					<ul class="join-indicator">
						<li>로그인</li>
						<li>아이디/비밀번호 찾기</li>
						<li>아이디 찾기 완료</li>
					</ul>
					<div class="member join-success">
						<div class="end">
							<div class="t1">
								회원님의 아이디는<br>
								<strong>${member_id}</strong>입니다.
							</div>
							<div class="t2">
								<a href="findPw">비밀번호 찾으러 가기.</a>
							</div>
							<div class="btns">
								<a href="main" class="btn-type-main">메인화면</a>
								<a href="memLogin" class="btn-typep-login">로그인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
</body>
</html>