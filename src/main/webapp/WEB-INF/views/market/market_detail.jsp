<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link href="resources/css/trade_detail.css" rel="stylesheet" />
<link href="resources/css/swiper.min.css" rel="stylesheet" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
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
										alt="rating" class="ProfileInfoStarImg"><img
										src="https://ccimage.hellomarket.com/img/web/common/full_star.png"
										alt="rating" class="ProfileInfoStarImg"><img
										src="https://ccimage.hellomarket.com/img/web/common/full_star.png"
										alt="rating" class="ProfileInfoStarImg"><img
										src="https://ccimage.hellomarket.com/img/web/common/full_star.png"
										alt="rating" class="ProfileInfoStarImg"><img
										src="https://ccimage.hellomarket.com/img/web/common/full_star.png"
										alt="rating" class="ProfileInfoStarImg">
									<div class="ProfileInfoRatingScore">(10)</div>
								</div>
							</div>
						</div>
						<img
							src="https://ccimage.hellomarket.com/img/web/common/not_following.png"
							class="FollowFollowingImg">
					</div>
				</div>
				
				<!--오른쪽섹션 -->
				<div id="rightSection"
					class="rightSectionWrapper">
					<div class="TopNavigationWrapper">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_report.png"
							alt="신고하기" class="TopNavigationIcon">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_share.png"
							alt="공유하기" class="TopNavigationIcon">
					</div>
					<div class="TitleWrapper">
						<div class="TitleBrandText">NO BRAND</div>
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
						<div class="SubTitleTagBox">
							<div class="SubTitleTagText">새 상품(미개봉)</div>
						</div>
					</div>
					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
							<div class="WishWrapper">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png"
									alt="좋아요 아이콘" class="WishIcon">
								<div class="WishText">0</div>
							</div>
							<div width="42%" class="SomeonesItemButton">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_hellotalk.png"
									alt="채팅 아이콘" class="SomeonesItemIcon">
								<div color="#FFFFFF" class="SomeonesItemText">채팅하기</div>
							</div>
							<div width="58%" class="SomeonesItemButton">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_purchase_default.png"
									alt="안전결제 아이콘" class="SomeonesItemIcon">
								<div color="#FFFFFF" class="SomeonesItemText">안전결제
								</div>
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
					<div class="DeliveryWrapper">
						<div class="DeliveryTitle">배송정보</div>
						<div class="DeliveryDeliveryBox">
							<img
								src="https://ccimage.hellomarket.com/img/web/item/detail/img_delivery_method.png"
								alt="배송방법 이미지" class="DeliveryImg">
							<div width="63px" class="DeliveryText1">배송방법</div>
							<div class="DeliveryText">판매자가 알아서 배송</div>
						</div>
						<div class="DeliveryDeliveryBox">
							<img
								src="https://ccimage.hellomarket.com/img/web/item/detail/img_delivery_fee.png"
								alt="배송비 이미지" class="DeliveryImg">
							<div width="63px" class="DeliveryText1">배송비</div>
							<div class="DeliveryText2">무료배송</div>
						</div>
					</div>
					<div class="SafePaymentWrapper">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_safe_payment.svg"
							alt="안전결제 노티스 아이콘" class="SafePaymentImg">
						<div class="SafePaymentTextWrapper">
							<div class="SafePaymentText">안전결제</div>
							외 거래는 사기피해 보호를 받을 수 없습니다.
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

	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
