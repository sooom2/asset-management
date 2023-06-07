<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="${path }/resources/css/market_detail.css" rel="stylesheet">
<link href="resources/css/swiper.min.css" rel="stylesheet" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	border-radius: 10px;
	background-color: rgb(245, 249, 254);
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
    color: #268BFF;
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
	$("#payment").on("click", function() {
		alert("payment 클릭 1 :" + "${auction.auction_code }" + " 2 : " + ${lastLog.log_content });
	});
	
	$("#auctionEnroll").on("click", function() {
		event.preventDefault()
		 swal({
			    title: "경매에 참여 하시겠습니까?",
			    text: "1. 낙찰 후 경매 포기 시 보증금은 되돌려 받을 수 없습니다.\n2. 유찰 시 보증금은 즉시 되돌려 받습니다.",
			    icon: "success",
			    buttons: {
			      confirm: {
			        text: "참여",
			        value: true,
			        visible: true,
			        className: "",
			        closeModal: true,
			      },
			      cancel: {
			        text: "취소",
			        value: false,
			        visible: true,
			        className: "",
			        closeModal: true,
			      },
			    },
			  }).then((confirmResult) => {
			    if (confirmResult) {
			    	location.href="auctionEnroll?auction_code=${auction.get('auction_code')}";
			    }
		  	});
		
	});// onclick
	
});

window.history.forward(); function noBack(){ 
	window.history.forward();
	}

</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

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
										<img src="${auction.image_name}" class="MainImgItemImg">
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
										<div class="TitleWrapper" >
											<div class="TitleText1">&nbsp;&nbsp;${auction.auction_item_name}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="DescriptionWrapper"></div>
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
						<div class="TitleText1" style="color:#BB2649">경매 낙찰 결제 금액</div>
						<div class="TitleText2">${lastLog.log_content }원</div>
					</div>
					<div class="SubTitleWrapper">
						<div class="SubTitleDetailBox">
							<div class="SubTitleDetailText">${auction.auction_item_name}</div>
						</div>
					</div>
					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
							<div width="90%" id="payment" class="SomeonesModifyButton" data-cd="${marketItem.item_code }">
								<div color="#FFFFFF" class="SomeonesItemText">결제하기</div>
							</div>
						</div>
					</div>
					<div class="DescriptionWrapper"></div>
					
					<!-- 가격 제안-->
					<div class="Delivery__Wrapper-sc-1og3un6-0 ddxgBm">
						<div class="Delivery__Title-sc-1og3un6-1 iijbrT" >현재 머니또 포인트</div>
						<div class="Delivery__DeliveryBox-sc-1og3un6-2 jOMSSb">
							<div width="63px" class="Delivery__Text-sc-1og3un6-4 bOvaxU" style="color:#268BF">${member.member_point}원</div>
						</div>
					</div>

					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
							<div width="90%" class="SomeonesModifyButton"data-cd="${marketItem.item_code }" style="background:#268BFF">
								<div color="#FFFFFF" class="SomeonesItemText" >충전하기</div>
							</div>
						</div>
					</div>
					
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
