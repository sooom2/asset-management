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
<script type="text/javascript">
$(function() {
	$(".SomeonesItemButton").click(function() {
		//아이템코드
		item_code="market_0001";
		location.href="marketChat?item_code="+item_code;
	});
});
</script>
<script type="text/javascript" src="${path }/resources/js/jquery-3.6.4.js"></script>
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
										<img
											src="https://ccimg.hellomarket.com/images/2022/item/07/09/21/4656318_2647700_1.jpg?size=s6"
											class="MainImgItemImg">
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
										<img
											src="https://ccimg.hellomarket.com/images/2022/item/07/09/21/4656318_2647700_1.jpg?size=s6"
											alt="preview" class="PreviewImgListItemImg">
									</div>

								</div>
							</div>
						</div>
						<div
							class="NavigationCustomNavigationContainer">
							<div style="margin-left: -10.4px"
								class="NavigationCustomImgBox">
								<img
									src="https://ccimage.hellomarket.com/img/common/arrow/left_black.png"
									class="NavigationCustomArrowImg">
							</div>
							<div style="margin-right: -10.4px"
								class="NavigationCustomImgBox">
								<img
									src="https://ccimage.hellomarket.com/img/common/arrow/right_black.png"
									class="NavigationCustomArrowImg">
							</div>
						</div>
					</div>
					
					<!--판매자정보 -->
					<div class="profileWrapper">
						<div class="profileProfileData">
							<img
								src="https://ccimg.hellomarket.com/images/2017/member_profile/s4/10/11/19/0206_2647700_1.jpg?size=s4"
								alt="profileImg" class="profileProfileImg">
							<div class="ProfileInfoWrapper">
								<div class="ProfileInfoProfileName">유이아빠</div>
								<div class="ProfileInfoItemCountBox">
									<div class="ProfileInfoProduct">판매상품</div>
									<div class="ProfileInfoItemQuantity">62</div>
								</div>
								<div class="ProfileInfoRating">
									<img
										src="https://ccimage.hellomarket.com/img/web/common/full_star.png"
										alt="rating" class="ProfileInfoStarImg">
									<div class="ProfileInfoRatingScore">세계수</div>
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
						<div class="TitleText1">플라워 에코백(새상품)</div>
						<div class="TitleText2">10,800원</div>
					</div>
					<div class="SubTitleWrapper">
						<div class="SubTitleDetailBox">
							<div class="SubTitleDetailText">3시간 전</div>
							<div class="SubTitleWishBox">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_small.png"
									alt="좋아요 아이콘" class="SubTitleIcon">
								<div class="SubTitleDetailText">0</div>
							</div>
						</div>
					<div class="CategoryWrapper">
						<div class="CategoryTitle">카테고리</div>
						<div class="CategoryCategoryBox">
							<div class="DivergedLinkTitle">가방</div>
							<img
								src="https://ccimage.hellomarket.com/img/web/item/detail/ico_arrow_right_category.png"
								alt="오른쪽 화살표 아이콘" class="CategoryArrow">
							<div class="DivergedLinkTitle">기타 가방</div>
						</div>
					</div>
					</div>
					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
							<div class="WishWrapper">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png"
									alt="좋아요 아이콘" class="WishIcon">
<!-- 								<div class="WishText">0</div> -->
							</div>
							<div width="90%" class="SomeonesItemButton">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_hellotalk.png"
									alt="채팅 아이콘" class="SomeonesItemIcon">
								<div color="#FFFFFF" class="SomeonesItemText">채팅하기</div>
							</div>
						</div>
					</div>
					<div></div>
					<div class="DescriptionWrapper">
						<div class="DescriptionText">
							새상품 판매합니다 <br>색상 블랙 화이트 <br>사이즈 사진 참고하세요<br>안주머니에
							지퍼 있습니다 <br>에코백은 똑딱이 단추 있습니다 <br>직거래 종암동주민센터 버스정류장 <br>한진택배
							발송입니다 <br>반값 택배 가능 반값시 택포 8600원
						</div>
					</div>

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
		<div class="ReactModalPortal">
			<div class="detail_report">
				<div class="modal_main" tabindex="-1" role="dialog">
					<div class="modal_parent">
						<div class="modal_container">
							<div class="ReportWrapper">
								<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_close_modal.png" alt="닫기 아이콘" class="ReportCloseIcon">
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
