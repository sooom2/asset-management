<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="${path}/js/main.js"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />

	<div class="profile__Wrapper-sc-12nw6v6-0 hLjdoo">
<!-- 		<div class="navigateBar__Wrapper-sc-7j8qon-0 cCRgus"> -->
<!-- 			<div class="navigateBar__HomeTab-sc-7j8qon-2 ONeuG">HOME</div> -->
<!-- 			<div class="navigateBar__Divider-sc-7j8qon-1 jkbuHI">&gt;</div> -->
<!-- 			<div class="navigateBar__MyMenuTab-sc-7j8qon-3 flUCRQ">나의메뉴</div> -->
<!-- 		</div> -->
		<div class="profile__Container-sc-12nw6v6-1 cMqFPK">
			<div class="memberInfo__Wrapper-edrwkz-0 hHYktI">
				<div class="memberInfo__InfoArea-edrwkz-1 fNqBxy">
					<div class="userData__Wrapper-o7673g-0 eifOUF">
						<div>
							<div class="userData__ImgBox-o7673g-1 fihCFR">
								<img
									src="${pageContext.request.contextPath }/resources/images/mypage/cute.png"
									alt="profileImg" class="userData__ProfileImg-o7673g-2 Ikmjq">
							</div>
							<div class="userData__NickName-o7673g-5 kjfrAo">꾸꾸 님</div>
<!-- 							<div class="userData__MiddleContent-o7673g-4 eeEzfV"> -->
<!-- 								<div class="userData__CreateShopName-o7673g-6 jUHHvp">상점주소생성</div> -->
<!-- 								<div class="userData__CreateDate-o7673g-7 iEcBrk">2023년 -->
<!-- 									05월 시작</div> -->
<!-- 							</div> -->
						</div>
<!-- 						<div class="MyFollowData__Wrapper-s0jo3j-0 dKAPRm"> -->
<!-- 							<div class="MyFollowData__FollowBox-s0jo3j-1 gjOQKR"> -->
<!-- 								<div class="MyFollowData__Text-s0jo3j-2 hbGzhQ">팔로워</div> -->
<!-- 								<div class="MyFollowData__Count-s0jo3j-3 pjBai">0</div> -->
<!-- 							</div> -->
<!-- 							<div class="MyFollowData__FollowBox-s0jo3j-1 gjOQKR"> -->
<!-- 								<div class="MyFollowData__Text-s0jo3j-2 hbGzhQ">팔로잉</div> -->
<!-- 								<div class="MyFollowData__Count-s0jo3j-3 pjBai">0</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
					<div class="memberInfo__ProductCountBox-edrwkz-2 jZihcs">
						<div class="memberInfo__Text-edrwkz-3 ObPLl">상품</div>
						<div class="memberInfo__Count-edrwkz-4 bxkBQf">0</div>
					</div>
					<div class="memberInfo__ReviewBox-edrwkz-5 diZgaK">
						<div class="memberInfo__Text-edrwkz-3 ObPLl">매너온도</div>
						<div class="memberInfo__Rating-edrwkz-6 bDPsFn">
							<div class="memberInfo__Count-edrwkz-4 bxkBQf">55.6</div>
						</div>
					</div>
					<div class="memberInfo__MyDataBox-edrwkz-7 hKIUbJ">
						<div class="memberInfo__SettingMyData-edrwkz-8 krMsxi">내정보
							설정</div>
					</div>
				</div>
			</div>
			<div class="list__Wrapper-sc-1sjhuej-0 dxQuDY">
				<div class="tab__Wrapper-sc-1arp19f-0 iKBbsw">
					<div class="tab__Tab-sc-1arp19f-1 sale hIFDnf">판매 상품</div>
					<div class="tab__Tab-sc-1arp19f-1 favorite eoXkMa">찜한 상품</div>
				</div>
				<div id="selectedTab">
				<!-- 				<div class="tab__Wrapper-sc-1arp19f-0 iKBbsw"> -->
<!-- 					<div class="tab__Tab-sc-1arp19f-1 eoXkMa">판매 상품</div> -->
<!-- 					<div class="tab__Tab-sc-1arp19f-1 hIFDnf">찜한 상품</div> -->
<!-- 				</div> -->
				
				<!-- 판매상품 include-->
<%-- 					<jsp:include page="mypage_sale.jsp"/> --%>
				<!-- 찜한상품 include-->
					<jsp:include page="mypage_favorite.jsp"/>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".sale").on("click", function(e) {
			$("#selectedTab").remove();
// 			$("#selectedTab").append('<jsp:include page="mypage_sale.jsp"/>');
		});
	</script>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>