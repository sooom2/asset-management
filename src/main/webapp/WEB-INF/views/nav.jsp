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
					<li><a href="memAuth">회원가입</a></li>
<!-- 					<li><a href="guestRsv" class="">비회원예매내역</a></li> -->
<!-- 					<li><a href="admin" class="">관리자</a></li> -->
				</c:when>
				<c:otherwise>
					<li><a href="javascript:logout()" data-reload="reload" class="">로그아웃</a></li>
<!-- 					<li><a href="guestRsv" class="">비회원예매내역</a></li> -->
					<c:if test="${sessionScope.sId eq 'admin' }">
						<li><a href="admin" class="">관리자</a></li>
					</c:if>
				</c:otherwise>
			</c:choose>
			</ul>
		</nav>
	
	<div class="wrap-nav-primary">
		<nav class="primary">
			<a href="main"><h1 id="logo">로고</h1></a>		
			<ul class="nav_left">
				<li><a href="" class="">가계부</a></li>
				<li><a href="" class="">챌린지</a></li>
				<li><a href="notice_board" class="">공지사항</a></li>
				<li><a href="free_board" class="">자유게시판</a></li>
				<li><a href="" class="">마이페이지</a></li>
			
			
<!-- 				<li><a href="screening" class="" onmouseover=""> 영화 </a> -->
<!-- 					<div class="tertiary"> -->
<!-- 						<ul> -->
<!-- 							<li><a href="screening" class=""onmouseover="">박스오피스</a></li> -->
<!-- 							<li><a href="comming" class=""	onmouseover="">상영예정작</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</li> -->


			</ul>
<!-- 			<a href="" class="btn-simple-rsv simplereservepop">간편예매</a> -->
		</nav>
	</div>
</div>

</body>
</html>