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
<script src="https://kit.fontawesome.com/b2ab45b73f.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="header" data-loginstatus="0">
		<nav class="secondary">
			<ul>
			<c:choose>
				<c:when test="${empty sessionScope.sId }">
					<li><a href="chat">채팅</a></li>
					<li><a href="memLogin" data-reload="reload" class=""><i class="fa-regular fa-circle-user"></i>&nbsp;로그인</a></li>
					<li><a href="mypage" data-reload="" class="">마이페이지</a></li>
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
				<li style="width: 80px"><a href="auction" class="">경매</a></li>
				<li><a href="market_list" class="market_list">중고거래</a></li>
				<li><a href="" class="">커뮤니티</a></li>
				<li><a href="notice_board" class="">공지사항</a></li>
			</ul>
			<div class="searchIconWrapper">
				<img src="${path }/resources/images/main/ico_search.png" alt="돋보기 아이콘" class="searchIcon">
				<div class="searchSearch"><form><input class="goodsName" type="text" placeholder="어떤 상품을 찾으시나요?"></form></div>
			</div>
			
			<a href="" class="menu-item">
				<img src="${path }/resources/images/main/selling_btn.png" alt="판매하기 이미지" class="MiddleNavigation__SellImg-sc-1moccpq-3 dplbBo">
			</a>
		</nav>
	</div>
</div>

</body>
</html>