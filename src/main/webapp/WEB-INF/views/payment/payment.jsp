<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<!-- 기기 분기처리 스크립트 -->
<script type="text/javascript">
	var doc = document.documentElement;
	doc.setAttribute('data-useragent', navigator.userAgent);
	var sAgent =  navigator.userAgent;
	if (sAgent.indexOf("WebKit") < 0) {
		window.onerror = function(){
			return true;
		}
	}
	
	
</script>
<title>머니또페이</title>
<link rel="shortcut icon" href="https://img.pay.naver.net/static/images/customer/favicon.ico" />
<!-- TODO 밑에 css 따와서 파일로 저장하기 -->
<!-- TODO 창 로고 변경하기 -->
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/z/mstatic/css/service/mobile/nsp/order_common.css?1684912786775">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link href="${path }/resources/css/payment.css" rel ="stylesheet">
</head>

<body>
<div class="wrap">
	<!-- header -->
	<div class="header">
		<h1 class="h1 recurrent_h1">결제</h1>
		<p class="sp_header gnb_logo"><span class="blind">ttoPay</span></p>
	</div>

<form name="paymentSheetForm" id="paymentSheetForm" method="post" autocomplete="off">

<div class="container" id="container">
    <div class="info_login">
		<div class="img_area">
			<img src="${member.member_image}" alt="프로필 이미지" width="32" height="32" class="thumb">
		</div>
        <span class="name">${member.member_name }</span>
        <span class="eng_name">(${member.member_id })</span>
	</div>
	<div class="spot_section">
		<div class="spot_head">
			<h3 class="spot_h3">
				<strong class="heading">${item.item_subject }</strong>
			</h3>
		</div>
		<div class="spot_detail">
			<span class="amount"><strong>${item.item_price }</strong>원</span>
		</div>
	</div>
			<input type="checkbox" class="hidden" checked>
			<div class="fold_wrap">
				<label class="fold_head sp_heading head_nppoint" for="c1">
					<h3 class="fold_h">머니또페이 포인트 사용</h3>
					<p class="summary number"><span class="_pointTitle">0</span><span class="unit">원</span></p>
				</label>
				<div class="fold_content verification">
					<ul class="form_area box_margin">
					<li class="full_area label_margin button_margin">
						<span class="label">보유 포인트</span>
						<span class="value number point_green align_left">${member.member_point }<span class="unit">원</span></span>
						<div class="submit" id="withDraw">
								<!-- 사용하기 => 충전하기 -->
								<a href="#" class="size1 _click(checkout.mobile.nsp.paymentSheet.useAllMileage()) _stopDefault">충전하기</a>
						</div>
					</li>
					<li class="full_area label_margin button_margin2">
						<label for="point2" class="label">사용 포인트</label>
						<input title="사용포인트" id="point2" name="payAmounts.NAVER_CASH" type="tel" class="value number _onlyPriceTarget _naverMileage _payForm _blur(checkout.mobile.nsp.paymentSheet.checkInputTextAmountValue()) _focus(checkout.mobile.nsp.paymentSheet.beforeInputPrice()) _stopDefault" placeholder="0">
						<span class="text_won">원</span>
						<div class="button2">
							<a href="#" class="sp_ordersheet button_del _click(checkout.mobile.nsp.paymentSheet.clearUsedPoint()) _stopDefault">삭제</a>
						</div>
					</li>
					</ul>
				</div>
			</div>
<!-- 테스트 부분 -->
<script type="text/javascript">
$(function(){
	//css 아직 안빼서 클래스 이름 이상 
	
})
</script>
<!-- 테스트 부분 -->
	<input type="checkbox" class="hidden" id="c2">
	<div class="fold_wrap">
		<label class="fold_head sp_heading head_totamount head_arrow" for="c2">
			<h3 class="fold_h">최종 결제금액</h3>
			<p class="summary number"><span class="_totalPayAmt">38,400</span><span class="unit">원</span></p>
		</label>
		<div class="fold_content amount_section">
			<ul class="form_area">
			<li class="full_area label_margin">
				<span class="label">상품금액</span>
				<span class="value number">${item.item_price }<span class="unit">원</span></span>
			</li>
			<li class="full_area label_margin">
				<span class="label">포인트사용</span>
				<span class="value number "><span class="_mileageUsedAmount">0</span><span class="unit">원</span></span>
			</li>
			</ul>
			<div class="amount_total">
				<span class="label">총 결제금액</span>
				<span class="value number"><span class="_totalPayAmt">38,400</span><span class="unit">원</span></span>
			</div>
		</div>
	</div>
	
	
	<input type="checkbox" class="hidden" id="npay" checked disabled>
	
	<div class="fold_wrap _paymentInfoTitle">
		<div class="pay_selected _payMethodTab" >
			<label class="fold_head sp_heading head_simplepay" for="npay">
				<h3 class="fold_h">결제 정보</h3>
					</label>
					<div class="fold_content _paymentInfoArea">
						<div class="simplepay_cont _paymentMeansArea">
							<div class="pay_selected _recentPayMethodArea" style="display:none">
								<div id="previewFlick">
									<div class="flick-base _recentPaymentMethodRolling">
										<ul class="flick-container">
			
											<li class="flick-ct">
												<div class="flick-wrap">
													<div class="simplepay_select _flickPanel">
														<a href="#" class="card_select card_add _click(checkout.mobile.nsp.paymentSheet.hideRecentPayMethodArea()) _stopDefault">
															<p class="card_text sp_ordersheet icon_plus"><span class="point_green">네이버페이 간편결제</span><br>카드/계좌 추가</p>
														</a>
													</div>
												</div>
											</li>
										</ul>
										<input type="hidden" class="_rollingSize" value=0>
									</div>
								</div>
								<div class="payway_area">
									<div class="benefit_area _benefitArea" id="recentPaymentEachCardBenefitArea">
			
										<dl class="benefit_list">
										<dt class="benefit_title"><strong>결제/할인혜택 안내</strong>
										<a href="#" class="text_link sp_ordersheet link_arr _click(checkout.mobile.nsp.paymentSheet.openPayAndBenefitInfo()) _stopDefault">전체보기</a>
										</dt>
										</dl>
										<div class="button_section button_cont">
											<div class="button_area">
												<div class="button_bottom"><a href="#" class="button _click(checkout.mobile.nsp.paymentSheet.hideRecentPayMethodArea()) _stopDefault"><span class="sp_button_icon icon_edit">결제수단변경</span></a></div>
											</div>
										</div>
									</div>
			                    </div>
							</div>
						</div>
					<div class="pay_tab_area">
						<ul class="pay_tab _oPaymentMethodTab">
							<li class="pay_tab_menu _credit_card_tab on"><span class="blind">선택됨</span><a href="#" class="_click(checkout.mobile.nsp.paymentSheet.switchEasyPaymentMethodTab(CREDIT_CARD)) _stopDefault"><strong>또머니 간편결제</strong></a></li>
							<li class="pay_tab_menu _bank_tab"><a href="#" class="_click(checkout.mobile.nsp.paymentSheet.switchEasyPaymentMethodTab(BANK)) _stopDefault"><strong>계좌 간편결제</strong></a></li>
						</ul>
					</div>
				<div class="payway_area">
				
				
				</div>
			</div>
		</div>
	</div>
	
	
    <input type="checkbox" id="benefit2_1" class="hidden" title="포인트 적립 혜택">
    <div class="benefit_point">
        <label for="benefit2_1" class="fold_h sp_h h_point h_arrow">
            <h4 class="point_h">적립 혜택 : <span class="point_yellow">384원 적립 예정</span></h4>
        </label>
        <div class="point_content">
            <ul class="s_benefit_list">
                <li class="s_benefit_item">
                    <span>기본 <span class="point_yellow">1%</span> 적립 예정 (네이버페이 결제 시 제공)</span>
                </li>
            </ul>
        </div>
    </div>
	
	<div class="agree_section">
		<div class="checkall">
            <input type="checkbox" class="hidden _allAgreeBtn _click(checkout.mobile.nsp.paymentSheet.onToggleAllAgree()) _certificationForm" name="payAgreement">
            <label for="agree_all" class="check_agree sp_checkbox large">전체 동의하기</label>
		</div>
		<div class="checklist">
			<ul>
			<li class="check_item">
                <input type="checkbox" class="hidden _agreeBtn _click(checkout.mobile.nsp.paymentSheet.checkAllAgreed()) ">
                <label for="agree_c1" class="check_agree sp_checkbox large">위 구매조건 확인 및 결제진행 동의</label>
			</li>
			</ul>
		</div>
	</div>
	<div class="button_section">
		<div class="button_area">
			<div class="button_bottom"><a href="#" class="button _click(checkout.mobile.nsp.paymentSheet.create()) _stopDefault _doPayButton"><span class="sp_button_icon icon_check">결제하기</span></a></div>
		</div>
	</div>

</div>
<input type="hidden" name="firstSelectPayMethod" class="_firstPayMethod">
<input type="hidden" name="billingPgId" class="_pgId _payForm">
<input type="hidden" name="reserveSeq" value="" class="_payForm">

</form>

<div class="_tempLayer"></div>
<div class="ly_bx" id="pointAlert" style="top:200px;display:none;">
    <div class="error_cont sp_ordersheet icon_error_big">
        <dl class="error_tx">
            <dt>잠시 후 다시 시도해 주세요.</dt>
            <dd>
                머니또페이 <em class="point_txt">포인트 정보 확인이 불가</em>하여<br>일시적으로 결제가 불가합니다.
            </dd>
        </dl>
    </div>
    <div class="cls_btn cls_btn_v2">
        <a href="#">확인</a>
    </div>
</div>
	<!-- footer -->
<div class="footer">
    <span class="corp">© MONNYTTO FINANCIAL Corp.</span>
</div>
	<!-- //footer -->
</div>
<script type="text/javascript">
//     var oAdditionalInfo = {};
    
//         lcs_do(oAdditionalInfo);

//    nclk_do();
// pug.registerModule(checkout.mobile.nsp.paymentSheet,
// {
// "memberNickName" : "홍길동",
// "memberMaskingNaverId" : "ho******",
// "memberImgUrl" : "",

// "merchantName" : "테스트가맹점",
// "productName" : "유다의 별 2권",
// "amount" : 38400,

// "isAvailableNaverPoint" : true,
// "isNaverPointLimitPolicy" : false,
// "availableNaverPointForOneMonth" : 0,
// "naverPoint" : 50000,
// "naverPointAvailable" : true,

// "reserveId" : "developerCenterReserveId",
// "returnUrl" : "www.naver.com",
// "easyCardCode" : $A(["C3","C1","C0","CH","C7","C5","C4","CF","C9"]),
// "easyBankCode" : $A(["011","004","088","020","003","023","032","039","007","071","238","031","034","037","045","035","089"]),
// "payMeansInfos": {},
// "easyPayBankRegistrationDate" : "0",
// "easyPayBankRegisteredCode" : "",
// "easyPayBankRegisteredText" : "",

// "isAvailableCard" : true,
// "isAvailableBank" : true,

// "lastPayMeans": {"corpCode":"","lastChargingPointPayment":false,"usingAlwaysAllPointChecked":false,"payMoneyUse":false,"payMoneyRegisteredUser":false},

// "urls" : 	{
// 			"mobile.user.front.host" : "m.pay.naver.com",
// 			"pay.password.authentification.mobile.page.url" : "https://nid.naver.com/mobile/naverPay.nhn?m=viewCheckNaverPayPasswd",
// 			"pay.ars.authentification.mobile.page.url" : "https://nid.naver.com/iasystem/mobile_pop.nhn?todo=pers_popup_ars&target=persAuth_popup",
// 			"nsp.pay.authentification.return.url" : "https://pay.naver.com/payments/naverPayAuthResult?d=",
// 			"pay.password.init.mobile.page.url" : "https://nid.naver.com/mobile/naverPay.nhn?m=viewAuthNaverPayPasswd",
// 			"nsp.mobile.paymentsheet.url" : "https://m.pay.naver.com/payments/",
// 			"mobile.user.front.host" : "m.pay.naver.com",
// 			"pay.limit.conf.mobile.url" : "https://new-m.pay.naver.com/settings/payment-security/pay",
// 		"":""
// 	}
// ,
// "purchaserInfo": {"memberName":""
// 					,"emailAddress":""
// 					,"memberTelNumber":""},
// "naverPointReserveRate" : 1 ,
// "creditCardInfos" : {},
// "freeInterests" : {},
// "defaultCashReceiptInfo" : {"selfCashReceiptApply":false},
// "isCashReceiptPublish" : true,
// "isRegisteredCashReceiptIssue" : false,
// "isSupportGeneralPayMeans" : false,
// "ispCreditCardCode" : $A(""),
// "rurlPrefix" : "",
// "rurlSuffix" : "",
// "usimRequestMessage" : "",
// "" : ""
// });
</script>
<div class="_repurchase">&nbsp;</div>
<div class="_repurchaseDtl">
</div>
</body>
</html>
