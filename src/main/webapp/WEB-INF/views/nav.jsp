<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<script type="text/javascript" src="${path }/resources/js/main.js"></script>
</head>
<body>
<div id="header" data-loginstatus="0">
		<nav class="secondary">
			<ul>
			<c:choose>
				<c:when test="${empty sessionScope.sId }">
					<li><a href="memLogin" data-reload="reload" class="">로그인</a></li>
					<li><a href="" data-reload="" class="">마이페이지</a></li>
					<li><a href="memAuth">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:logout()" data-reload="reload" class="">로그아웃</a></li>
					<%-- 관리자페이지 접근 서비스시 주석 해지할것  --%>
<%-- 					<c:if test="${sessionScope.sId eq 'admin' }"> --%>
<!-- 						<li><a href="admin" class="">관리자</a></li> -->
<%-- 					</c:if> --%>
				</c:otherwise>
			</c:choose>
					<%-- 실제 서비스시 없앨것 --%>
					<li><a href="admin" class="">관리자</a></li>
			</ul>
		</nav>
	
	<div class="wrap-nav-primary">
		<nav class="primary">
			<a href="main"><h1 id="logo">로고</h1></a>		
			<ul class="nav_left">
				<li><a href="accountBook" class="">가계부</a></li>
				<li><a href="" class="">소셜가계부</a></li>
				<li><a href="" class="">머니또PICK</a></li>
				<li><a href="notice_board" class="">공지사항</a></li>
				<li><a href="free_board" class="">커뮤니티</a></li>
			</ul>
		</nav>
	</div>
</div>

</body>
</html>