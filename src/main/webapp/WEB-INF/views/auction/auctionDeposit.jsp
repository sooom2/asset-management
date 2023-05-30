<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path }/resources/css/market_detail.css" rel="stylesheet">
<link href="resources/css/swiper.min.css" rel="stylesheet" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<style type="text/css">
.MainImgItemImg {
	width: 80%;
    height: 80%;
    margin: auto;
}
.TitleText1 {
	margin: auto;
    text-align: center;
}
.TitleText2 {
	text-align: center;
	margin-top: 10px;
}
.SomeonesModifyButton {
    margin: auto;
    background: #BB2649;
    padding: 14px 0px 9px 0px;
    width: 80%;
}
.SubTitleDetailText {
	margin-bottom: 25px;
}
.iijbrT {
    font-size: 24px;
    margin: auto;
    text-align: center;
}
.bOvaxU {
	margin: auto;
	font-size: 20px;
	width: 80%;
	text-align: center;
}
.jOMSSb {
    margin-top: 5px;
    padding: 10px;
}
</style>
<script type="text/javascript">

$(function() {
	
	
});


</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="next">

		<div class="layoutChildren"></div>

		<div class="newDetailWrapper">
			<div class="newDetailMain">
				
				<!--왼쪽섹션 -->
				<div class="leftSectionWrapper">
					<div class="MainImgWrapper">
						<div class="swiper-container"
							modules="[object Object],[object Object]">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-pagination"></div>
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="swiper-wrapper">
										<img src="http://c3d2212t3.itwillbs.com/images/${auction.get('image_name')}" class="MainImgItemImg">
									</div>
								</div>
							</div>
						</div>
						<div class="SellStateImgWrapper"></div>
					</div>
					<div class="PreviewImgListWrapper">
						<div class="PreviewImgListPreviewImgContainer">
							<div class="swiper-container" modules="[object Object]">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="TitleWrapper">
											<div class="TitleText1">&nbsp;&nbsp;${auction.get('auction_item_name')}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="DescriptionWrapper"></div>
					<div class="PreviewImgListWrapper">
						<div class="PreviewImgListPreviewImgContainer">
							<div class="swiper-container" modules="[object Object]">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="TitleWrapper">
											<div class="TitleText1">&nbsp;&nbsp;즉시 구매가</div>
											<div class="TitleText1" style="color:#BB2649">&nbsp;&nbsp;${auction.get('auction_immediate_price')}원</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!--오른쪽섹션 -->
				<div id="rightSection"
					class="rightSectionWrapper">
					<div class="TopNavigationWrapper">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_report.png"
							alt="신고하기" class="TopNavigationIcon report">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_share.png"
							alt="공유하기" class="TopNavigationIcon">
					</div>
					<div class="TitleWrapper">
						<div class="TitleText1">경매 입찰 보증금 금액</div>
						<div class="TitleText2">${deposit}원</div>
					</div>
					<div class="SubTitleWrapper">
						<div class="SubTitleDetailBox">
							<div class="SubTitleDetailText">${auction.get('auction_item_name')}</div>
						</div>

					</div>
					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
							<div width="90%" class="SomeonesModifyButton"data-cd="${marketItem.item_code }">
								<div color="#FFFFFF" class="SomeonesItemText">경매 참여</div>
							</div>
						</div>
					</div>
					<div class="DescriptionWrapper"></div>
					
					<!-- 카테고리 -->
					<div class="CategoryWrapper">
						<div class="CategoryTitle">카테고리</div>
						<div class="CategoryCategoryBox">
							<div class="DivergedLinkTitle">${auction.get('auction_category')}</div>
<!-- 							<img -->
<!-- 								src="https://ccimage.hellomarket.com/img/web/item/detail/ico_arrow_right_category.png" -->
<!-- 								alt="오른쪽 화살표 아이콘" class="CategoryArrow"> -->
<!-- 							<div class="DivergedLinkTitle">기타 가방</div> -->
						</div>
					</div>
					<!-- 태그 -->
					<div class="Tag__Wrapper-td2hyd-0 jLVEzu">
						<div class="Tag__Title-td2hyd-1 irWNGN">상품설명</div>
						<div class="Tag__TagWrapper-td2hyd-2 TitNF">
								<div class="Tag__TagBox-td2hyd-3 jsrScO">
								<div class="Tag-td2hyd-4 fKGvTO">${auction.get("auction_content")}</div>
							</div>
						</div>
					</div>
					
					<!-- 가격 제안-->
					<div class="Delivery__Wrapper-sc-1og3un6-0 ddxgBm">
						<div class="Delivery__Title-sc-1og3un6-1 iijbrT" >현재 머니또 포인트</div>
						<div class="Delivery__DeliveryBox-sc-1og3un6-2 jOMSSb">
								<div width="63px" class="Delivery__Text-sc-1og3un6-4 bOvaxU" style="color:#268BF">${member.get("member_point")}원</div>
						</div>
					</div>

					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
							<div width="90%" class="SomeonesModifyButton"data-cd="${marketItem.item_code }" style="background:#268BFF">
								<div color="#FFFFFF" class="SomeonesItemText" >충전하기</div>
							</div>
						</div>
					</div>
					
					
					<!-- 안전거래 -->
					<div class="SafePayment__Wrapper-a27qmi-0 cmuUgc">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_safe_payment.svg"
							alt="안전결제 노티스 아이콘" class="SafePayment__Img-a27qmi-1 ctnThu">
						<div class="SafePayment__TextWrapper-a27qmi-2 gEcoNf">
							<div class="SafePayment__Text-a27qmi-3 fgLKso">경매 유찰 시 보증금은 바로 돌려받습니다.</div>
						</div>
					</div>
					
					
					<div></div>
					<div></div>
					<div class="DescriptionWrapper"></div>

					<div style="margin: -19px 20px 10px"
						class="AdSenseWrapper">
						<ins class="adsbygoogle responsive" style="display: block"
							data-ad-format="auto" data-ad-layout-key="+1h+s8-4-62+b3"
							data-ad-slot="5474011742"
							data-ad-client="ca-pub-9169594828612333"
							data-full-width-responsive="false"></ins>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 신고 모달창 -->
		<div class="ReactModalPortal" style="display: none;">
			<div
				class="ReactModal__Overlay ReactModal__Overlay--after-open detail_report">
				<div
					class="ReactModal__Content ReactModal__Content--after-open modal_main"
					tabindex="-1" role="dialog">
					<div class="modal_parent">
						<div class="modal_container">
							<div class="ReportWrapper">
								<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_close_modal.png" alt="닫기 아이콘" class="ReportCloseIcon close">
								<div class="Report__Title-sc-140fn8w-2 fwaQok">신고 사유를 선택해 주세요.</div>
								<div class="Report__ListWrapper-sc-140fn8w-3 gGZdRJ">
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">안전결제 거부</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">주류, 담배</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img
											src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">전문 의약품, 의료기기</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">개인정보 거래(신분증, 대포폰 등)</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">음란물/성인용품(중고속옷 포함)</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">위조상품</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">총포 도검류</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">화장품 견본품</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">게임계정</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">도배행위</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" alt="체크박스 아이콘" class="Report__CheckBoxIcon-sc-140fn8w-5 hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">동물 분양/입양글</div>
									</div>
								</div>
								<div class="Report__Button-sc-140fn8w-7 IZaFu">신고하기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
<script type="text/javascript">

	$(function () {
		// 신고하기
		$(".report").on("click", function(e) {
			$(".ReactModalPortal").show();
		});
		
		// 모달창 닫기
		$(".close").on("click", function(e) {
			$(".ReactModalPortal").remove();
		});
		
		

	
	});

</script>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
