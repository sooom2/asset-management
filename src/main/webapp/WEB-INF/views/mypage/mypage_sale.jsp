<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />

	<div class="profileWrapper">
		<div class="profileContainer">
			<div class="memberInfoWrapper">
				<div class="memberInfoInfoArea">
					<div class="userDataWrapper">
						<div>
							<div class="userDataImgBox">
								<img src="${pageContext.request.contextPath }/resources/images/mypage/cute.png"
									alt="profileImg" class="userDataProfileImg ">
							</div>
							<div class="userDataNickName">꾸꾸 님</div>
						</div>
					</div>
					<div class="memberInfoProductCountBox">
						<div class="memberInfoText">상품</div>
						<div class="memberInfoCount">0</div>
					</div>
					<div class="memberInfoReviewBox">
						<div class="memberInfoText">매너온도</div>
						<div class="memberInfoRating">
							<img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png" alt="프로필 별점 없는 이미지 1">
							<img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png" alt="프로필 별점 없는 이미지 2">
							<img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png" alt="프로필 별점 없는 이미지 3">
							<img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png" alt="프로필 별점 없는 이미지 4">
							<img src="https://ccimage.hellomarket.com/web/2019/member/img_review_star_blank_16x16_x2.png" alt="프로필 별점 없는 이미지 5">
							<div class="memberInfoCount">55.6</div>
						</div>
					</div>
					<div class="memberInfoReviewBox-edrwkz-5 diZgaK">
						<div class="memberInfoText-edrwkz-3 ObPLl">남은머니</div>
						<div class="memberInfoRating-edrwkz-6 bDPsFn">
							<div class="memberInfoCount-edrwkz-4 bxkBQf">10,000원</div> &nbsp;&nbsp;
							<div class="payCharge"><Input type="button" value="충전"></div> &nbsp;&nbsp;
							<div class="payReturn"><Input type="button" value="환급"></div>
						</div>
					</div>
					<div class="memberInfoMyDataBox" onclick='location.href="mypageInfo"'>
						<div class="memberInfoSettingMyData">내정보 설정</div>
					</div>
				</div>
			</div>
<!-- 			탭 -->
			<div class="listWrapper">
				<div class="tabWrapper-sc-1arp19f-0 iKBbsw">
					<div class="tabTab-sc-1arp19f-1 eoXkMa active"><a href="mypage">판매 상품</a></div>
					<div class="tabTab-sc-1arp19f-1 eoXkMa"><a href="mypageFavorite">찜한 상품</a></div>
					<div class="tabTab-sc-1arp19f-1 eoXkMa"><a href="#">구매 상품</a></div>
					<div class="tabTab-sc-1arp19f-1 eoXkMa"><a href="#">참여 중인 경매</a></div>
					<div class="tabTab-sc-1arp19f-1 eoXkMa"><a href="#">거래 후기</a></div>
					<div class="tabTab-sc-1arp19f-1 eoXkMa"><a href="#">추천 상품</a></div>
				</div>
				
				<div class="filterBarWrapper">
					<div class="tabPcBox">
						<div class="tabFilterTab">
							<div width="180px" class="DropBoxWrapper">
								<div class="DropBoxBox">
									<div class="CategoryText">카테고리 전체</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="CategoryArrow">
								</div>
							</div>
							
							<div width="130px" class="DropBoxWrapper">
								<div class="DropBoxBox">
									<div class="SellStatusText">판매상태</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="SellStatusArrow">
								</div>
							</div>
							
							<div width="140px" class="DropBoxWrapper">
								<div class="DropBoxBox">
									<div class="PriceText">가격</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="PriceArrow">
								</div>
							</div>
							<form class="SearchWrapper">
								<input type="text" placeholder="상품명 검색"
									class="SearchInput-ukztbj-1 inqgpT" value=""><img
									src="https://ccimage.hellomarket.com/img/web/common/black_glass.svg"
									alt="카테고리 검색 아이콘" class="SearchSearchImg-ukztbj-2 gSfjHN">
							</form>
						</div>
					</div>
					<div class="tagListWrapper-gkczkp-0 geRbir"></div>
				</div>
				
				
				<div class="listControlBox-sc-1sjhuej-1 ZnVII">
					<div class="listCount-sc-1sjhuej-2 ikbVGV">전체 0</div>
					<div class="BulkEditBarWrapper-sc-1qgk0ra-0 dRZslQ">
						<div class="BulkEditBarContents-sc-1qgk0ra-1 kEbDVd">
							<div class="BulkEditBarText-sc-1qgk0ra-2 kBXJCm">일괄편집</div>
							<img
								src="https://ccimage.hellomarket.com/img/web/member/edit_arrow.svg"
								alt="일괄편집" class="BulkEditBarArrowImg-sc-1qgk0ra-3 gmqVpv">
						</div>
					</div>
				</div>
				<div class="itemWrapper-sc-1e3j2mi-0 iyOWTU">
					<div class="EmptyEmptyBox-xvqyzf-0 FnzNS">
						<div class="EmptyTitle-xvqyzf-1 JxliI">아쉽게도, 현재 검색된 상품이
							없어요</div>
						<div class="EmptyGuide-xvqyzf-5 ekpKDQ">필터를 재설정하거나 전체 상품
							보기를 선택해주세요</div>
						<div class="EmptyBtnBox-xvqyzf-2 gkrTC">
							<img
								src="https://ccimage.hellomarket.com/img/web/common/refresh_mark.svg"
								alt="초기화 마크" class="EmptyResetMark-xvqyzf-4 YrGaN">
							<div class="EmptyShowAllText-xvqyzf-3 iUdVkN">전체 상품 보기</div>
						</div>
					</div>
					<div class="EmptyNoticeBox-xvqyzf-6 gLROrj"></div>
				</div>
				</div>
<!-- 				탭 end -->
			</div>
		</div>
<jsp:include page="../footer.jsp" />
</body>
</html>