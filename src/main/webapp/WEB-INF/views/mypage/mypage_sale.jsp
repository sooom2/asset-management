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
						</div>
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
					<div class="memberInfo__ReviewBox-edrwkz-5 diZgaK">
						<div class="memberInfo__Text-edrwkz-3 ObPLl">남은머니</div>
						<div class="memberInfo__Rating-edrwkz-6 bDPsFn">
							<div class="memberInfo__Count-edrwkz-4 bxkBQf">10,000원</div> &nbsp;&nbsp;
							<div class="payCharge"><Input type="button" value="충전"></div> &nbsp;&nbsp;
							<div class="payReturn"><Input type="button" value="환급"></div>
						</div>
					</div>
					<div class="memberInfo__MyDataBox-edrwkz-7 hKIUbJ">
						<div class="memberInfo__SettingMyData-edrwkz-8 krMsxi"><a href="mypageInfo">내정보 설정</a></div>
					</div>
				</div>
			</div>
<!-- 			탭 -->
			<div class="list__Wrapper-sc-1sjhuej-0 dxQuDY">
				<div class="tab__Wrapper-sc-1arp19f-0 iKBbsw">
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa active"><a href="mypage">판매 상품</a></div>
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa"><a href="mypageFavorite">찜한 상품</a></div>
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa"><a href="#">구매 상품</a></div>
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa"><a href="#">참여 중인 경매</a></div>
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa"><a href="#">거래 후기</a></div>
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa"><a href="#">추천 상품</a></div>
				</div>
				
				<div class="filterBar__Wrapper-sc-10b47vv-0 fAXhwJ">
					<div class="tab__PcBox-sc-1f5uogr-0 FOhDV">
						<div class="tab__FilterTab-sc-1f5uogr-2 kKhNjD">
							<div width="180" class="DropBox__Wrapper-lz7d36-0 PkGWZ">
								<div class="DropBox__Box-lz7d36-1 ippamR">
									<div class="Category__Text-h8wzmi-0 iMjfZL">카테고리 전체</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="Category__Arrow-h8wzmi-1 gKBrvR">
								</div>
							</div>
							<div width="130" class="DropBox__Wrapper-lz7d36-0 haDSxX">
								<div class="DropBox__Box-lz7d36-1 ippamR">
									<div class="SellStatus__Text-sc-1nh094f-0 eGrrgd">판매상태</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="SellStatus__Arrow-sc-1nh094f-1 hwmrrw">
								</div>
							</div>
							<div width="140" class="DropBox__Wrapper-lz7d36-0 fGlYoT">
								<div class="DropBox__Box-lz7d36-1 ippamR">
									<div class="Price__Text-sc-1hhtkvo-0 fKusCW">가격</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="Price__Arrow-sc-1hhtkvo-1 kxhSTv">
								</div>
							</div>
							<form class="Search__Wrapper-ukztbj-0 iiLiGM">
								<input type="text" placeholder="상품명 검색"
									class="Search__Input-ukztbj-1 inqgpT" value=""><img
									src="https://ccimage.hellomarket.com/img/web/common/black_glass.svg"
									alt="카테고리 검색 아이콘" class="Search__SearchImg-ukztbj-2 gSfjHN">
							</form>
						</div>
					</div>
					<div class="tagList__Wrapper-gkczkp-0 geRbir"></div>
				</div>
				<div class="list__ControlBox-sc-1sjhuej-1 ZnVII">
					<div class="list__Count-sc-1sjhuej-2 ikbVGV">전체 0</div>
					<div class="BulkEditBar__Wrapper-sc-1qgk0ra-0 dRZslQ">
						<div class="BulkEditBar__Contents-sc-1qgk0ra-1 kEbDVd">
							<div class="BulkEditBar__Text-sc-1qgk0ra-2 kBXJCm">일괄편집</div>
							<img
								src="https://ccimage.hellomarket.com/img/web/member/edit_arrow.svg"
								alt="일괄편집" class="BulkEditBar__ArrowImg-sc-1qgk0ra-3 gmqVpv">
						</div>
					</div>
				</div>
				<div class="item__Wrapper-sc-1e3j2mi-0 iyOWTU">
					<div class="Empty__EmptyBox-xvqyzf-0 FnzNS">
						<div class="Empty__Title-xvqyzf-1 JxliI">아쉽게도, 현재 검색된 상품이
							없어요</div>
						<div class="Empty__Guide-xvqyzf-5 ekpKDQ">필터를 재설정하거나 전체 상품
							보기를 선택해주세요</div>
						<div class="Empty__BtnBox-xvqyzf-2 gkrTC">
							<img
								src="https://ccimage.hellomarket.com/img/web/common/refresh_mark.svg"
								alt="초기화 마크" class="Empty__ResetMark-xvqyzf-4 YrGaN">
							<div class="Empty__ShowAllText-xvqyzf-3 iUdVkN">전체 상품 보기</div>
						</div>
					</div>
					<div class="Empty__NoticeBox-xvqyzf-6 gLROrj"></div>
				</div>
				</div>
<!-- 				탭 end -->
			</div>
		</div>
	<script type="text/javascript">
	</script>
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
	$(function() {
		
	});
	
	</script>
</body>
</html>