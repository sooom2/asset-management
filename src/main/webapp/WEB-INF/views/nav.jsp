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
<script>
function logout() {
	// 카카오 로그인 아닐시 session "token" = true
// 	if(${sessionScope.token == true}){
// 		let isLogout = confirm("로그아웃 하시겠습니까?");
		
// 		if(isLogout) {
// 			location.href = "logout";
// 		}
// 	} else {
// 		location.href="https://kauth.kakao.com/oauth/logout?client_id=bf0c05681627cc5d65f40192f843de1b&logout_redirect_uri=http://192.168.3.126:8080/movie/logout";
// 	}
}
function payment(){
	window.open("payment", "_blank","width=500,height=830");
}
</script>
</head>
<body>
<input type="hidden" id="navSearchInput" name="navSearchInput" value="">
<div id="header" data-loginstatus="0">
		<nav class="secondary">
			<ul>
			<c:choose>
				<c:when test="${empty sessionScope.sId }">
					<li><a href="memLogin" data-reload="reload" class=""><i class="fa-regular fa-circle-user"></i>&nbsp;로그인</a></li>
					<li><a href="memAuth">회원가입</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="myAlarm"><i class="fa-regular fa-bell"></i> 나의알림</a></li>
					<li><a href="marketChat"><i class="fa-regular fa-comment-dots fa-flip-horizontal"></i> 채팅</a></li>
					<li><a href="logout" data-reload="reload" class="">로그아웃</a></li>
					<%-- 관리자페이지 접근 서비스시 주석 해지할것  --%>
<%-- 					<c:if test="${sessionScope.sId eq 'admin' }"> --%>
<!-- 						<li><a href="admin" class="">관리자</a></li> -->
<%-- 					</c:if> --%>
				</c:otherwise>
			</c:choose>
					<%-- 실제 서비스시 없앨것 --%>
					<li><a href="#" onclick="payment()"> 결제페이지(샘플)</a>
					<li><a href="admin"  class="">관리자</a></li>
			</ul>
		</nav>
	
	<div class="wrap-nav-primary">
		<nav class="primary">
			<a href="main"><h1 id="logo">로고</h1></a>		
			<ul class="nav_left">
				<li style="width: 80px"><a href="auctionMain" class="">경매</a></li>
				<li><a href="market_list" class="market_list">중고거래</a></li>
				<li><a href="commBoard" class="">커뮤니티</a></li>
				<li><a href="notice_board" class="">공지사항</a></li>
			</ul>
			<div class="searchIconWrapper">
				<img src="${path }/resources/images/main/ico_search.png" alt="돋보기 아이콘" class="searchIcon">
				<div class="searchSearch"><form id="navSearchForm"><input class="goodsName" id="navSearch" type="text" placeholder="어떤 상품을 찾으시나요?"></form></div>
			</div>
			<c:if test="${not empty sessionScope.sId }">
				<div class="mem_profile">
					<img src="${sessionScope.member_image }" alt="프로필 이미지" class="profileImg">
					<div class="mem_nickName" >${sessionScope.nickname }</div>
				</div>	
			</c:if>
			<a href="itemRegist" class="menu-item">
				<img src="${path }/resources/images/main/selling_btn.png" alt="판매하기 이미지" class="MiddleNavigation__SellImg-sc-1moccpq-3 dplbBo">
			</a>
		</nav>
	</div>
</div>

<script type="text/javascript">
	$(function () {
		// 검색 하는중 -- 하다가 태그 검색 꼬여서 주석
// 		$(document).on("submit", "#navSearchForm", function(e) {
// 			e.preventDefault(); // 폼 제출 기본 동작 막기
// 			var input = $("#navSearch").val();
// 			alert(input);
// 			$("#navSearchInput").val(input);
// 			location.href = "market_list?navSearch=" + input;
// 			return false;
// 		});
		
// 		$(".searchSearch input").keydown(function(e) {
//             if(e.which === 13) {
// 				e.preventDefault(); // 엔터 키 기본 동작 막기
// 				$("#navSearchForm").submit(); // 폼 제출
//             }
//         });
		
		// 프로필 이미지 눌렀을때도 마이페이지 이동하게 할려고 하는데
		// 더 괜찮은 방법 있으면 이거 지우고 그걸로 바꿔주세요 !
		$('.mem_profile').children().click(function(){
			location.href='mypage?member_id=${sessionScope.sId }';
		})
	});
</script>
</body>
</html>