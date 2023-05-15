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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript">
// function NotReload(){
//     if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
//         event.keyCode = 0;
//         event.cancelBubble = true;
//         event.returnValue = false;
//        	alert("이미 회원가입이 완료되었습니다.");
//     } 
// }
// document.onkeydown = NotReload;
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
						<li>회원정보 입력</li>
						<li class="selected">가입 완료</li>
					</ul>
					<div class="member join-success">
						<div class="end">
							<div class="t1">
							<%String name=request.getParameter("member_name"); %>
								<strong><%=name %></strong> 님<br>회원가입이 완료되었습니다.
							</div>
							<div class="t2">
								가입완료오오오오
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