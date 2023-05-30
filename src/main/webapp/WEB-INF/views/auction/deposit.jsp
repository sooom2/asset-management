<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta name="format-detection" content="telephone=no" />
<meta name="referrer" content="always">
<meta property="og:title" content="네이버페이">
<meta property="og:url" content="https://m.pay.naver.com/mobile/about">
<meta property="og:image" content="https://img.pay.naver.net/static/images/customer/og/naverpay.png">
<meta property="og:description" content="네이버 ID로 간편구매, 네이버페이">
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
<title>네이버페이</title>
<link rel="shortcut icon" href="https://img.pay.naver.net/static/images/customer/favicon.ico" /><link type="text/css" rel="stylesheet" href="//img.pay.naver.net/z/mstatic/css/service/mobile/nsp/order_common.css?1684912932909">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/z/mstatic/css/service/mobile/nsp/order_layout.css?1684912932909">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/z/mstatic/css/service/mobile/nsp/dc_nsp_sheet.css?1684912932909">
</head>

<body>
<!-- u_skip -->
<div id="u_skip">
    <a href="#container">본문 바로가기</a>
</div>
<!-- //u_skip -->
<div class="wrap">
	<!-- header -->
	<div class="header">
		<h1 class="h1 recurrent_h1">결제</h1>
		<p class="sp_header gnb_logo"><span class="blind">nPay</span></p>
	</div>

	<!-- //header -->
	<!-- //u_skip -->


<form name="paymentSheetForm" id="paymentSheetForm" method="post" autocomplete="off">
<input type="hidden" name="donAgree" value="false" class="_donAgree _certificationForm">
<input type="hidden" name="paymentId">
<input type="hidden" name="fdsUuid" value="" class="_fdsUuid _certificationForm">
<input type="hidden" name="naverToken" value="" class="_naverToken _certificationForm">
<input type="hidden" name="naverInitToken" value="" class="_naverInitToken _certificationForm">
<input type="hidden" name="isNaverPayPasswordAvailable" value="false" class="_certificationForm">
<input type="hidden" name="authentificationToken" value="" class="_authentificationToken _certificationForm">

<div class="container" id="container">
    <div class="info_login">
		<div class="img_area">
			<img src="//img.pay.naver.net/z/mstatic/img/service/mobile/nsp/profile_default.png" alt="프로필 이미지" width="32" height="32" class="thumb">
		</div>
        <span class="name">홍길동</span>
        <span class="eng_name">(ho******)</span>
	</div>
	<div class="spot_section">
		<div class="spot_head">
			<span class="h_icon">테스트가맹점</span>
			<h3 class="spot_h3">
				<strong class="heading">유다의 별 2권</strong>
			</h3>
		</div>
		<div class="spot_detail">
			<span class="amount"><strong>38,400</strong>원</span>
		</div>
	</div>
			<input type="checkbox" class="hidden" checked>
			<div class="fold_wrap">
				<label class="fold_head sp_heading head_nppoint" for="c1">
					<h3 class="fold_h">네이버페이 포인트 사용</h3>
					<p class="summary number"><span class="_pointTitle">0</span><span class="unit">원</span></p>
				</label>
				<div class="fold_content verification">
					<ul class="form_area box_margin">
					<li class="full_area label_margin button_margin">
						<span class="label">보유 포인트</span>
						<span class="value number point_green align_left">50,000<span class="unit">원</span></span>
						<div class="button">
								<a href="#" class="size1 _click(checkout.mobile.nsp.paymentSheet.useAllMileage()) _stopDefault">전액사용</a>
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
				<span class="value number">38,400<span class="unit">원</span></span>
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


				<div class="pay_selected _payMethodTab" >

					<div class="pay_tab_area">
						<ul class="pay_tab _oPaymentMethodTab">
						<li class="pay_tab_menu _credit_card_tab on"><span class="blind">선택됨</span><a href="#" class="_click(checkout.mobile.nsp.paymentSheet.switchEasyPaymentMethodTab(CREDIT_CARD)) _stopDefault"><strong>카드 간편결제</strong></a></li>
						<li class="pay_tab_menu _bank_tab"><a href="#" class="_click(checkout.mobile.nsp.paymentSheet.switchEasyPaymentMethodTab(BANK)) _stopDefault"><strong>계좌 간편결제</strong></a></li>
						</ul>
					</div>
					<div class="payway_area">
						<table cellpadding="0" cellspacing="0" border="0" class="regway_select _credit_card_area _easyCardCodeList _card_simple_pay_area">
								<caption><span class="blind">결제 카드 선택</span></caption>
								<tr>
								<td class="_payMethod _C3">
									<a href="#" class="credit_C3 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(C3)) _stopDefault">
									<span>국민카드</span>
									</a>
								</td>
								<td class="_payMethod _C1">
									<a href="#" class="credit_C1 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(C1)) _stopDefault">
									<span>비씨카드</span>
									</a>
								</td>
								<td class="_payMethod _C0">
									<a href="#" class="credit_C0 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(C0)) _stopDefault">
									<span>신한카드</span>
									</a>
								</td>
								<td class="_payMethod _CH">
									<a href="#" class="credit_CH _click(checkout.mobile.nsp.paymentSheet.changePayMethod(CH)) _stopDefault">
									<span>현대카드</span>
									</a>
								</td>
								</tr>
								<tr>
								<td class="_payMethod _C7">
									<a href="#" class="credit_C7 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(C7)) _stopDefault">
									<span>삼성카드</span>
									</a>
								</td>
								<td class="_payMethod _C5">
									<a href="#" class="credit_C5 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(C5)) _stopDefault">
									<span>롯데카드</span>
									</a>
								</td>
								<td class="_payMethod _C4">
									<a href="#" class="credit_C4 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(C4)) _stopDefault">
									<span>NH카드</span>
									</a>
								</td>
								<td class="_payMethod _CF">
									<a href="#" class="credit_CF _click(checkout.mobile.nsp.paymentSheet.changePayMethod(CF)) _stopDefault">
									<span>하나카드</span>
									</a>
								</td>
								</tr>
								<tr>
								<td class="_payMethod _C9">
									<a href="#" class="credit_C9 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(C9)) _stopDefault">
									<span>씨티카드</span>
									</a>
								</td>

									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>

								</tr>
						</table>

						<table cellpadding="0" cellspacing="0" border="0" class="regway_select _easyBankCodeList _bank_simple_pay_area" style="display:none">
                                <caption><span class="blind">결제 계좌 선택</span></caption>
								<tr>
								<td class="_payMethod _011">
									<a href="#" class="bank_011 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(011)) _stopDefault">
									<span>NH농협</span>
									</a>
								</td>
								<td class="_payMethod _004">
									<a href="#" class="bank_004 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(004)) _stopDefault">
									<span>국민은행</span>
									</a>
								</td>
								<td class="_payMethod _088">
									<a href="#" class="bank_088 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(088)) _stopDefault">
									<span>신한은행</span>
									</a>
								</td>
								<td class="_payMethod _020">
									<a href="#" class="bank_020 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(020)) _stopDefault">
									<span>우리은행</span>
									</a>
								</td>
								</tr>
								<tr>
								<td class="_payMethod _003">
									<a href="#" class="bank_003 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(003)) _stopDefault">
									<span>기업은행</span>
									</a>
								</td>
								<td class="_payMethod _023">
									<a href="#" class="bank_023 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(023)) _stopDefault">
									<span>SC제일은행</span>
									</a>
								</td>
								<td class="_payMethod _032">
									<a href="#" class="bank_032 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(032)) _stopDefault">
									<span>부산은행</span>
									</a>
								</td>
								<td class="_payMethod _039">
									<a href="#" class="bank_039 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(039)) _stopDefault">
									<span>경남은행</span>
									</a>
								</td>
								</tr>
								<tr>
								<td class="_payMethod _007">
									<a href="#" class="bank_007 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(007)) _stopDefault">
									<span>수협</span>
									</a>
								</td>
								<td class="_payMethod _071">
									<a href="#" class="bank_071 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(071)) _stopDefault">
									<span>우체국</span>
									</a>
								</td>
								<td class="_payMethod _238">
									<a href="#" class="bank_238 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(238)) _stopDefault">
									<span>미래에셋</span>
									</a>
								</td>
								<td class="_payMethod _031">
									<a href="#" class="bank_031 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(031)) _stopDefault">
									<span>대구은행</span>
									</a>
								</td>
								</tr>
								<tr>
								<td class="_payMethod _034">
									<a href="#" class="bank_034 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(034)) _stopDefault">
									<span>광주은행</span>
									</a>
								</td>
								<td class="_payMethod _037">
									<a href="#" class="bank_037 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(037)) _stopDefault">
									<span>전북은행</span>
									</a>
								</td>
								<td class="_payMethod _045">
									<a href="#" class="bank_045 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(045)) _stopDefault">
									<span>새마을금고</span>
									</a>
								</td>
								<td class="_payMethod _035">
									<a href="#" class="bank_035 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(035)) _stopDefault">
									<span>제주은행</span>
									</a>
								</td>
								</tr>
								<tr>
								<td class="_payMethod _089">
									<a href="#" class="bank_089 _click(checkout.mobile.nsp.paymentSheet.changePayMethod(089)) _stopDefault">
									<span>케이뱅크</span>
									</a>
								</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
						</table>

						<div class="value_select _screditcardTemplate _payMethodForm _card_pay_area">
								<label for="s2" class="hidden">할부선택</label>
								<select title="할부선택" name="freeInterestInstallmentInfo.installmentMonth" class="sp_select_icon value2 _creditCardInstallment _cardInstallmentPeriodClassCode _payForm" id="s2">
								<option value="01">일시불</option>
									<option value="02" >2개월</option>
									<option value="03" >3개월</option>
									<option value="04" >4개월</option>
									<option value="05" >5개월</option>
									<option value="06" >6개월</option>
									<option value="07" >7개월</option>
									<option value="08" >8개월</option>
									<option value="09" >9개월</option>
									<option value="10" >10개월</option>
									<option value="11" >11개월</option>
									<option value="12" >12개월</option>
								</select>
						</div>
						<div class="benefit_area _benefitArea">
						</div>

						<input type="hidden" class="_freeInterestInstallmentSellerCommissionRate _payForm" name="freeInterestInstallmentInfo.freeInterestInstallmentSellerCommissionRate">

						<input type="hidden" class="_freeInterestInstallmentBrdnCoreTypeCode _payForm" name="freeInterestInstallmentInfo.freeInterestInstallmentBrdnCoreTypeCode">

						<input type="hidden" class="_freeInterestInstallmentApplyYn _payForm" name="freeInterestInstallmentInfo.freeInterestInstallmentApplyYn">

						<input type="hidden" class="_partFreeInterestBurdenMonths _payForm" name="freeInterestInstallmentInfo.partFreeInterestBurdenMonths">

						<input type="hidden" class="_freeInterestMiniminApplyAmount _payForm" name="freeInterestInstallmentInfo.freeInterestMiniminApplyAmount">

						<input type="hidden" class="_freeInterestInstallmentType _payForm" name="freeInterestInstallmentInfo.freeInterestInstallmentType" value="NON_INSTALLMENT">

						<input type="hidden" name="defaultEasyCardCode" value=C3>
						<input type="hidden" name="defaultEasyBankCode" value=011>
						<input type="hidden" name="totalReviewMileage" value=0>

					</div>
				</div>
			</div>


			<input type="checkbox" class="hidden _click(checkout.mobile.nsp.paymentSheet.switchCashReceipt())" id="cashReceiptApply" checked> <!-- default uncheck -->
			<div class="receipt_area _cash_receipt_area" style="display:none">
				<label class="fold_head" for="cashReceiptApply">
					<h4 class="fold_h">현금영수증 신청</h4>
					<span class="toggle"></span>
				</label>
				<div id="cashReceiptInputForm" class="receipt_cont">
					<ul class="radio_list">
						<li class="radio_list_item"><input type="radio" id="cashReceiptPrivate" name="rad1" class="hidden _click(checkout.mobile.nsp.paymentSheet.changeCashReceiptIssueType(PR_CELL_PHONE_NUMBER))" checked="checked">
							<label for="cashReceiptPrivate" class="sp_radio radio_left">개인소득공제용</label>
						</li>
						<li class="radio_list_item"><input type="radio" id="cashReceiptBusiness" name="rad1" class="hidden _click(checkout.mobile.nsp.paymentSheet.changeCashReceiptIssueType(BUSINESS_REGISTRATION_NUMBER))">
							<label for="cashReceiptBusiness" class="sp_radio radio_left">사업자증빙용</label>
						</li>
					</ul>
					<div class="receipt_input">
						<div class="value_select">
							<label for="receipt_slt1" class="hidden">개인소득공제용_현금영수증 정보입력</label>
							<select title="개인소득공제용_현금영수증 정보입력" class="sp_select_icon value2 _change(checkout.mobile.nsp.paymentSheet.changeCashReceiptIssueType())" id="sel-cashReceiptIssueClassType">
										<option value="PR_CELL_PHONE_NUMBER" selected>휴대폰번호</option>
										<option value="PR_SOCIAL_NUMBER" >주민등록번호</option>
										<option value="PR_CASH_RECEIPT_CARD_NUMBER" >현금영수증카드번호</option>
							</select>
							<input title="카드번호 입력" type="tel" class="value2" id="cashReceiptIssueNum" maxlength="13" pattern="[0-9]" placeholder="카드번호를 입력해주세요">
						</div>
					</div>
					<div class="agree_section">
						<input type="checkbox" class="hidden _click(checkout.mobile.nsp.paymentSheet.changeUpdateReceiptInfo())" id="updateReceiptAgree">
						<label for="updateReceiptAgree" class="check_agree sp_checkbox small">현재 현금영수증 신청정보를 저장합니다.</label>
					</div>
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
            <input type="checkbox" class="hidden _allAgreeBtn _click(checkout.mobile.nsp.paymentSheet.onToggleAllAgree()) _certificationForm" name="payAgreement" checked>
            <label for="agree_all" class="check_agree sp_checkbox large">전체 동의하기</label>
		</div>
		<div class="checklist">
			<ul>
			<li class="check_item">
                <input type="checkbox" class="hidden _agreeBtn _click(checkout.mobile.nsp.paymentSheet.checkAllAgreed()) " checked>
                <label for="agree_c1" class="check_agree sp_checkbox large">위 구매조건 확인 및 결제진행 동의</label>
			</li>
			<li class="check_item">
				<input type="checkbox" class="hidden _agreeBtn _click(checkout.mobile.nsp.paymentSheet.checkAllAgreed()) " checked>
				<label for="agree_c2" class="check_agree sp_checkbox large"> 테스트가맹점에 거래정보 제공 동의 </label>
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
                네이버페이 <em class="point_txt">포인트 정보 확인이 불가</em>하여<br>일시적으로 결제가 불가합니다.
            </dd>
        </dl>
    </div>
    <div class="cls_btn cls_btn_v2">
        <a href="#">확인</a>
    </div>
</div>
	<!-- footer -->
<div class="footer">
    <span class="corp">© NAVER FINANCIAL Corp.</span>
</div>
	<!-- //footer -->
</div>
<!-- javascript 영역 -->
<script type="text/javascript" src="https://ssl.pstatic.net/static.pay/z/static/js/jindo/core/jindo.mobile.all-2.3.0.js?1684912944341" charset="utf-8"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/uglify/common.mobile.min.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://ssl.pstatic.net/static.pay/z/static/js/legend/nclktag.js?1684912944341" charset="utf-8"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/uglify/lcslog.min.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nmp.component.Calculator.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nmp.component.UrlUtils.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nmp.component.Utility.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nmp.component.Box.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nsp.Event.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nsp.CardType.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nsp.CashReceiptIssueType.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/DeveloperPaymentSheetModel.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/nsp.SheetCommon.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/mstatic/js/service/checkout/mobile/nsp/developerPaymentSheet.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/mstatic/js/service/checkout/mobile/nsp/developerPaymentSheetUtils.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/mstatic/js/service/checkout/mobile/order/ui.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript" src="//img.pay.naver.net/z/cstatic/js/component/NextInputFocusModule.js?1684912944341" charset="utf-8" crossorigin="anonymous"></script>
<script type="text/javascript">
    var oAdditionalInfo = {};
    
        lcs_do(oAdditionalInfo);

   nclk_do();
pug.registerModule(checkout.mobile.nsp.paymentSheet,
{
"memberNickName" : "홍길동",
"memberMaskingNaverId" : "ho******",
"memberImgUrl" : "",

"merchantName" : "테스트가맹점",
"productName" : "유다의 별 2권",
"amount" : 38400,

"isAvailableNaverPoint" : true,
"isNaverPointLimitPolicy" : false,
"availableNaverPointForOneMonth" : 0,
"naverPoint" : 50000,
"naverPointAvailable" : true,

"reserveId" : "developerCenterReserveId",
"returnUrl" : "www.naver.com",
"easyCardCode" : $A(["C3","C1","C0","CH","C7","C5","C4","CF","C9"]),
"easyBankCode" : $A(["011","004","088","020","003","023","032","039","007","071","238","031","034","037","045","035","089"]),
"payMeansInfos": {},
"easyPayBankRegistrationDate" : "0",
"easyPayBankRegisteredCode" : "",
"easyPayBankRegisteredText" : "",

"isAvailableCard" : true,
"isAvailableBank" : true,

"lastPayMeans": {"corpCode":"","lastChargingPointPayment":false,"usingAlwaysAllPointChecked":false,"payMoneyUse":false,"payMoneyRegisteredUser":false},

"urls" : 	{
			"mobile.user.front.host" : "m.pay.naver.com",
			"pay.password.authentification.mobile.page.url" : "https://nid.naver.com/mobile/naverPay.nhn?m=viewCheckNaverPayPasswd",
			"pay.ars.authentification.mobile.page.url" : "https://nid.naver.com/iasystem/mobile_pop.nhn?todo=pers_popup_ars&target=persAuth_popup",
			"nsp.pay.authentification.return.url" : "https://pay.naver.com/payments/naverPayAuthResult?d=",
			"pay.password.init.mobile.page.url" : "https://nid.naver.com/mobile/naverPay.nhn?m=viewAuthNaverPayPasswd",
			"nsp.mobile.paymentsheet.url" : "https://m.pay.naver.com/payments/",
			"mobile.user.front.host" : "m.pay.naver.com",
			"pay.limit.conf.mobile.url" : "https://new-m.pay.naver.com/settings/payment-security/pay",
		"":""
	}
,
"purchaserInfo": {"memberName":""
					,"emailAddress":""
					,"memberTelNumber":""},
"naverPointReserveRate" : 1 ,
"creditCardInfos" : {},
"freeInterests" : {},
"defaultCashReceiptInfo" : {"selfCashReceiptApply":false},
"isCashReceiptPublish" : true,
"isRegisteredCashReceiptIssue" : false,
"isSupportGeneralPayMeans" : false,
"ispCreditCardCode" : $A(""),
"rurlPrefix" : "",
"rurlSuffix" : "",
"usimRequestMessage" : "",
"" : ""
});
</script>
<div class="_repurchase">&nbsp;</div>
<div class="_repurchaseDtl">
</div>
</body>
</html>
