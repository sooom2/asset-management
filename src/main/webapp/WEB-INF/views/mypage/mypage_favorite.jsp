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
			<div class="list__Wrapper-sc-1sjhuej-0 dxQuDY">
				<div class="tab__Wrapper-sc-1arp19f-0 iKBbsw">
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa"><a href="mypage">판매 상품</a></div>
					<div class="tab__Tab-sc-1arp19f-1 eoXkMa active"><a href="mypageFavorite">찜한 상품</a></div>
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
									<div class="WishType__Text-sc-19r94du-0 hJOSoO">찜한 상품순</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="WishType__Arrow-sc-19r94du-1 edWYrb">
								</div>
							</div>
						</div>
					</div>
					<div class="tagList__Wrapper-gkczkp-0 geRbir"></div>
				</div>
				<div class="list__ControlBox-sc-1sjhuej-1 ZnVII">
					<div class="list__Count-sc-1sjhuej-2 ikbVGV">전체 1</div>
				</div>
				<div class="item__Wrapper-sc-1e3j2mi-0 iyOWTU">
					<div class="item__ItemWrapper-sc-1e3j2mi-1 bfyTKv">
						<div class="item__ItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListType__ItemBox-g4b9lz-1 QZXDX">
								<div class="ListType__ImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/17/15/1935355_5543846_1.jpg?size=s4"
										alt="itemImg" class="ListType__ItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImg__Wrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImg__StateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListType__ItemInfo-g4b9lz-5 evciSB">
									<div class="ListType__Top-g4b9lz-6 gvoavX">
										<div class="ListType__Title-g4b9lz-7 kgIVuq">산리오 키링 등 3개</div>
										<div class="ListType__TimeAgo-g4b9lz-8 jWxaCA">1분 전</div>
									</div>
									<div class="ListType__Price-g4b9lz-9 cmwbwJ">5,000원</div>
									<div class="ListType__WishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="item__ItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListType__ItemBox-g4b9lz-1 QZXDX">
								<div class="ListType__ImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/04/10/3427376_70933_1.jpg?size=s4"
										alt="itemImg" class="ListType__ItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImg__Wrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImg__StateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListType__ItemInfo-g4b9lz-5 evciSB">
									<div class="ListType__Top-g4b9lz-6 gvoavX">
										<div class="ListType__Title-g4b9lz-7 kgIVuq"># 마이클코어스
											mk6468 남녀공용 메탈시계 급처</div>
										<div class="ListType__TimeAgo-g4b9lz-8 jWxaCA">39초 전</div>
									</div>
									<div class="ListType__Price-g4b9lz-9 cmwbwJ">49,000원</div>
									<div class="ListType__WishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="item__ItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListType__ItemBox-g4b9lz-1 QZXDX">
								<div class="ListType__ImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/04/20/14/0801552_70933_1.jpg?size=s4"
										alt="itemImg" class="ListType__ItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImg__Wrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImg__StateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListType__ItemInfo-g4b9lz-5 evciSB">
									<div class="ListType__Top-g4b9lz-6 gvoavX">
										<div class="ListType__Title-g4b9lz-7 kgIVuq"># 알마니 정품
											자동시계를 이가격에....</div>
										<div class="ListType__TimeAgo-g4b9lz-8 jWxaCA">36초 전</div>
									</div>
									<div class="ListType__Price-g4b9lz-9 cmwbwJ">199,000원</div>
									<div class="ListType__WishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="item__ItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListType__ItemBox-g4b9lz-1 QZXDX">
								<div class="ListType__ImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/17/15/1340179_5843292_1.png?size=s4"
										alt="itemImg" class="ListType__ItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImg__Wrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImg__StateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListType__ItemInfo-g4b9lz-5 evciSB">
									<div class="ListType__Top-g4b9lz-6 gvoavX">
										<div class="ListType__Title-g4b9lz-7 kgIVuq">[새상품] 아디다스
											운동가방 트레이닝 더플백 엑스스몰</div>
										<div class="ListType__TimeAgo-g4b9lz-8 jWxaCA">7분 전</div>
									</div>
									<div class="ListType__Price-g4b9lz-9 cmwbwJ">28,000원</div>
									<div class="ListType__WishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
						<div class="item__ItemBox-sc-1e3j2mi-2 fWersI">
							<div class="ListType__ItemBox-g4b9lz-1 QZXDX">
								<div class="ListType__ImgBox-g4b9lz-2 krVQOH">
									<img
										src="https://ccimg.hellomarket.com/images/2023/item/05/17/14/3605836_4991039_1.jpg?size=s4"
										alt="itemImg" class="ListType__ItemImg-g4b9lz-4 eaTPEQ">
									<div class="SellStateImg__Wrapper-sc-15fv3xr-0 iRhXcK">
										<div class="SellStateImg__StateBox-sc-15fv3xr-1 ildnCD"></div>
									</div>
								</div>
								<div class="ListType__ItemInfo-g4b9lz-5 evciSB">
									<div class="ListType__Top-g4b9lz-6 gvoavX">
										<div class="ListType__Title-g4b9lz-7 kgIVuq">겔럭시 퀀텀1실버
											128GB 정상 공기계</div>
										<div class="ListType__TimeAgo-g4b9lz-8 jWxaCA">44분 전</div>
									</div>
									<div class="ListType__Price-g4b9lz-9 cmwbwJ">110,000원</div>
									<div class="ListType__WishCount-g4b9lz-10 bFCrnB">찜 1</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>