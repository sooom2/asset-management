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
<link href="${path}/resources/css/member.css" rel="stylesheet" >
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
								<img
									src="${pageContext.request.contextPath }/resources/images/mypage/cute.png"
									alt="profileImg" class="userDataProfileImg-o7673g-2 Ikmjq">
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
			<div class="listWrapper">
				<div class="tabWrapper-sc-1arp19f-0 iKBbsw">
					<div class="tabTab-sc-1arp19f-1 eoXkMa"><a href="mypage">판매 상품</a></div>
					<div class="tabTab-sc-1arp19f-1 eoXkMa active"><a href="mypageFavorite">찜한 상품</a></div>
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
									<div class="WishTypeText-sc-19r94du-0 hJOSoO">찜한 상품순</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="WishTypeArrow">
								</div>
							</div>
							
						</div>
					</div>
					<div class="tagListWrapper-gkczkp-0 geRbir"></div>
				</div>
				<div class="listControlBox-sc-1sjhuej-1 ZnVII">
					<div class="listCount-sc-1sjhuej-2 ikbVGV">전체 1</div>
				</div>
				<div class="itemWrapper-sc-1e3j2mi-0 iyOWTU">
					<div class="itemItemWrapper-sc-1e3j2mi-1 bfyTKv">
						<div class="itemItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListTypeItemBox-g4b9lz-1 QZXDX">
								<div class="ListTypeImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/17/15/1935355_5543846_1.jpg?size=s4"
										alt="itemImg" class="ListTypeItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImgWrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImgStateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListTypeItemInfo-g4b9lz-5 evciSB">
									<div class="ListTypeTop-g4b9lz-6 gvoavX">
										<div class="ListTypeTitle-g4b9lz-7 kgIVuq">산리오 키링 등 3개</div>
										<div class="ListTypeTimeAgo-g4b9lz-8 jWxaCA">1분 전</div>
									</div>
									<div class="ListTypePrice-g4b9lz-9 cmwbwJ">5,000원</div>
									<div class="ListTypeWishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="itemItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListTypeItemBox-g4b9lz-1 QZXDX">
								<div class="ListTypeImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/04/10/3427376_70933_1.jpg?size=s4"
										alt="itemImg" class="ListTypeItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImgWrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImgStateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListTypeItemInfo-g4b9lz-5 evciSB">
									<div class="ListTypeTop-g4b9lz-6 gvoavX">
										<div class="ListTypeTitle-g4b9lz-7 kgIVuq"># 마이클코어스
											mk6468 남녀공용 메탈시계 급처</div>
										<div class="ListTypeTimeAgo-g4b9lz-8 jWxaCA">39초 전</div>
									</div>
									<div class="ListTypePrice-g4b9lz-9 cmwbwJ">49,000원</div>
									<div class="ListTypeWishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="itemItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListTypeItemBox-g4b9lz-1 QZXDX">
								<div class="ListTypeImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/04/20/14/0801552_70933_1.jpg?size=s4"
										alt="itemImg" class="ListTypeItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImgWrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImgStateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListTypeItemInfo-g4b9lz-5 evciSB">
									<div class="ListTypeTop-g4b9lz-6 gvoavX">
										<div class="ListTypeTitle-g4b9lz-7 kgIVuq"># 알마니 정품
											자동시계를 이가격에....</div>
										<div class="ListTypeTimeAgo-g4b9lz-8 jWxaCA">36초 전</div>
									</div>
									<div class="ListTypePrice-g4b9lz-9 cmwbwJ">199,000원</div>
									<div class="ListTypeWishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="itemItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListTypeItemBox-g4b9lz-1 QZXDX">
								<div class="ListTypeImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/17/15/1340179_5843292_1.png?size=s4"
										alt="itemImg" class="ListTypeItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImgWrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImgStateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListTypeItemInfo-g4b9lz-5 evciSB">
									<div class="ListTypeTop-g4b9lz-6 gvoavX">
										<div class="ListTypeTitle-g4b9lz-7 kgIVuq">[새상품] 아디다스
											운동가방 트레이닝 더플백 엑스스몰</div>
										<div class="ListTypeTimeAgo-g4b9lz-8 jWxaCA">7분 전</div>
									</div>
									<div class="ListTypePrice-g4b9lz-9 cmwbwJ">28,000원</div>
									<div class="ListTypeWishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="itemItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListTypeItemBox-g4b9lz-1 QZXDX">
								<div class="ListTypeImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/17/14/3605836_4991039_1.jpg?size=s4"
										alt="itemImg" class="ListTypeItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImgWrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImgStateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListTypeItemInfo-g4b9lz-5 evciSB">
									<div class="ListTypeTop-g4b9lz-6 gvoavX">
										<div class="ListTypeTitle-g4b9lz-7 kgIVuq">겔럭시 퀀텀1실버
											128GB 정상 공기계</div>
										<div class="ListTypeTimeAgo-g4b9lz-8 jWxaCA">44분 전</div>
									</div>
									<div class="ListTypePrice-g4b9lz-9 cmwbwJ">110,000원</div>
									<div class="ListTypeWishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
					</div>
				</div>
<!-- 				탭끝 -->

			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>