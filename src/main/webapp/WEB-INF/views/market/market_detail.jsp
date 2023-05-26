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
		
		location.href="marketChat?item_code="+$(this).data("cd");
	});
	$(".SomeonesModifyButton").click(function() {
		
		alert("수정페이지 만들면 이동");
	});
});

//좋아요 
function toggleLike(element) {
  var imgSrc = element.getAttribute('src');
  if (imgSrc === 'https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png') {
    element.setAttribute('src', 'https://ccimage.hellomarket.com/img/web/item/detail/Ico_wish_on.png');
  } else {
    element.setAttribute('src', 'https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png');
  }
}


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
										<img src="http://c3d2212t3.itwillbs.com/images/${marketItem}" class="MainImgItemImg">
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
								<div class="ProfileInfoProfileName">이름이뭐예요</div>
								<div class="ProfileInfoItemCountBox">
									<div class="ProfileInfoProduct">${marketItem.item_subject}</div>
<%-- 									<div class="ProfileInfoProduct">${marketItem.get(0)}</div> --%>
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
<!-- 							<div class="SubTitleWishBox"> -->
<!-- 								<img -->
<!-- 									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_small.png" -->
<!-- 									alt="좋아요 아이콘" class="SubTitleIcon"> -->
<!-- 								<div class="SubTitleDetailText">0</div> -->
<!-- 							</div> -->
						</div>

					</div>
					
					<!-- 카테고리 -->
					<div class="CategoryWrapper">
						<div class="CategoryTitle">카테고리</div>
						<div class="CategoryCategoryBox">
							<div class="DivergedLinkTitle">패션/의류/잡화/뷰티</div>
<!-- 							<img -->
<!-- 								src="https://ccimage.hellomarket.com/img/web/item/detail/ico_arrow_right_category.png" -->
<!-- 								alt="오른쪽 화살표 아이콘" class="CategoryArrow"> -->
<!-- 							<div class="DivergedLinkTitle">기타 가방</div> -->
						</div>
					</div>
					<!-- 태그 -->
					<div class="Tag__Wrapper-td2hyd-0 jLVEzu">
						<div class="Tag__Title-td2hyd-1 irWNGN">태그</div>
						<div class="Tag__TagWrapper-td2hyd-2 TitNF">
							<div class="Tag__TagBox-td2hyd-3 jsrScO">
								<div class="Tag-td2hyd-4 fKGvTO">#태그목록</div>
							</div>
							<div class="Tag__TagBox-td2hyd-3 jsrScO">
								<div class="Tag-td2hyd-4 fKGvTO">#태그는</div>
							</div>
							<div class="Tag__TagBox-td2hyd-3 jsrScO">
								<div class="Tag-td2hyd-4 fKGvTO">#5개까지</div>
							</div>
							<div class="Tag__TagBox-td2hyd-3 jsrScO">
								<div class="Tag-td2hyd-4 fKGvTO">#쓸수있어용</div>
							</div>
							<div class="Tag__TagBox-td2hyd-3 jsrScO">
								<div class="Tag-td2hyd-4 fKGvTO">#길어지면내려간당!!!!!</div>
							</div>
						</div>
					</div>
					
					<!-- 가격 제안-->
					<div class="Delivery__Wrapper-sc-1og3un6-0 ddxgBm">
						<div class="Delivery__Title-sc-1og3un6-1 iijbrT">가격제안</div>
<!-- 						<div class="Delivery__DeliveryBox-sc-1og3un6-2 jOMSSb"> -->
<!-- 							<img -->
<!-- 								src="https://ccimage.hellomarket.com/img/web/item/detail/img_delivery_method.png" -->
<!-- 								alt="배송방법 이미지" class="Delivery__Img-sc-1og3un6-3 jfdQdb"> -->
<!-- 							<div width="63px" class="Delivery__Text-sc-1og3un6-4 bOvaxU">배송방법</div> -->
<!-- 							<div class="Delivery__Text-sc-1og3un6-4 fZGjYa">판매자가 알아서 배송</div> -->
<!-- 						</div> -->
						<div class="Delivery__DeliveryBox-sc-1og3un6-2 jOMSSb">
							<img
								src="https://ccimage.hellomarket.com/img/web/item/detail/img_delivery_fee.png"
								alt="배송비 이미지" class="Delivery__Img-sc-1og3un6-3 jfdQdb">
							<div width="63px" class="Delivery__Text-sc-1og3un6-4 bOvaxU">가능</div>
<!-- 							<div class="Delivery__Text-sc-1og3un6-4 fZGjYa">가능</div> -->
						</div>
					</div>

					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
<!-- 							<div class="WishWrapper"> -->
<!-- 								<img -->
<!-- 									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png" -->
<!-- 									alt="좋아요 아이콘" class="WishIcon"> -->
<!-- 								<div class="WishText">0</div> --> 
<!-- 							</div> -->
								<div class="WishWrapper">
								  <img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png" alt="좋아요 아이콘" class="WishIcon" onclick="toggleLike(this)">
								</div>
								
							<c:choose>
								<c:when test = "${sId } neq ${marketItem.member_id}">
									<div width="90%" class="SomeonesItemButton"data-cd="${marketItem.item_code }">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_hellotalk.png"
									alt="채팅 아이콘" class="SomeonesItemIcon">
								<div color="#FFFFFF" class="SomeonesItemText">채팅하기</div>
									</div>
								</c:when>
								<c:otherwise>
									<div width="90%" class="SomeonesModifyButton"data-cd="${marketItem.item_code }">
								<img
									src="https://ccimage.hellomarket.com/img/web/item/detail/ico_hellotalk.png"
									alt="채팅 아이콘" class="SomeonesItemIcon">
								<div color="#FFFFFF" class="SomeonesItemText">수정하기</div>
									</div>
								</c:otherwise>
							</c:choose>
							
							
						</div>
					</div>
					
					
					<!-- 안전거래 -->
					<div class="SafePayment__Wrapper-a27qmi-0 cmuUgc">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_safe_payment.svg"
							alt="안전결제 노티스 아이콘" class="SafePayment__Img-a27qmi-1 ctnThu">
						<div class="SafePayment__TextWrapper-a27qmi-2 gEcoNf">
							<div class="SafePayment__Text-a27qmi-3 fgLKso">안전결제</div>
							외 거래는 사기피해 보호를 받을 수 없습니다.
						</div>
					</div>
					
					<div></div>
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
