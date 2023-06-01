<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<link href="${path }/resources/css/main.css" rel="stylesheet">
<link href="${path }/resources/css/market_payment.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="item_list_area">
		<div class="breadcrumbs">
			<ul>
				<li><a href="/">HOME</a></li>
			</ul>
		</div>
		<div class="main_area">
			<div class="main_area_center">
				<div class="main">
					<div class="order_title_wrapper">
						<div class="title">주문서</div>
					</div>
					<div class="order_content_wrapper">
						<ul>
							<li class="order_card"><div class="card_cont deal_card_cont">
									<ul class="item_list">
										<li><div class="card_box card_box_list">
												<div
													class="image_wrapper image_wrapper_main_col_1 deal_image_wrapper">
													<div class="image_outside">
														<div class="image_centerbox">
															<img class="thumbnail_img"
																src="https://ccimg.hellomarket.com/images/2023/item/05/04/16/3014274_4045984_1.jpg?size=s4"
																alt="디올 어딕트 숄더백">
														</div>
													</div>
												</div>
												<div class="cont cont_main_col_1">
													<div class="item_title title_main_col_1">디올 어딕트 숄더백</div>
													<div class="item_price pri_main_col_1">1,599,000원</div>
													<div class="item_hasdeliveryfee">무료배송</div>
												</div>
											</div></li>
									</ul>
								</div></li>
							<li class="order_card "><div class="title_box">배송지</div>
								<div class="parcel_wrapper">
									<div class="label adress_label">배송지선택</div>
									<div class="selectbox_order se_order_adress">
										<label for="adressList">배송지를 선택해주세요.</label><select
											disabled=""><option hidden="">배송지를 선택해주세요.</option>0
										</select>
									</div>
									<div class="adress_btn_wrapper">
										<button type="button">주소 초기화</button>
									</div>
								</div>
								<ul class="order_member_info">
									<li><dl>
											<dt>이름</dt>
											<dd class="order_member_name">
												<input type="text" class="w_10" name="receiverName"
													placeholder="이름 입력" value="">
											</dd>
										</dl></li>
									<li><dl>
											<dt>연락처</dt>
											<dd class="order_member_phone">
												<input type="number" class="w_10" placeholder="숫자만 입력"
													value="">
											</dd>
										</dl></li>
									<li><dl>
											<dt>주소</dt>
											<dd>
												<div readonly="" name="senderHide" class="div_input_st">우편번호
													입력</div>
												<button class="addr_search">주소찾기</button>
											</dd>
										</dl></li>
									<li><dl>
											<dt></dt>
											<dd>
												<div readonly="" name="receiverAddr1" class="div_input_st">기본주소
													입력</div>
												<input type="text" name="receiverAddr2"
													placeholder="상세주소 입력" class="w_10" value="">
											</dd>
										</dl></li>
								</ul></li>
							<li class="order_card last_order_card"><div
									class="order_card_left">
									<div class="title_box">쿠폰/포인트 할인</div>
									<div>
										<div class="wallet_wrapper wallet_items_wrapper">
											<div class="box_coupon">
												<div class="title order_sub_title">쿠폰</div>
												<div class="box_coupon_right">
													<div>
														<div class="description">적용 0장 | 보유 3장</div>
														<div class="coupon_btn">쿠폰선택</div>
													</div>
													<div class="price">
														0<span>원</span>
													</div>
												</div>
											</div>
											<div class="certified_box hide">
												<div class="title_txt">
													<span>핸드폰 인증</span>
												</div>
												<div class="phone_number_box">
													<input type="number" placeholder="숫자만 입력">
													<button class="addr_search">인증요청</button>
												</div>
												<div class="auth_code_box">
													<input type="number" placeholder="인증번호 입력">
													<button class="addr_search">인증</button>
												</div>
											</div>
										</div>
									</div>
									<div class="title_box sub_title_box">
										<span class="payment_method"> 결제수단</span>
										<div class="etc_other_wrapper_form">
											<span class="other_wrapper_description other_wrapper_box">택배나
												등기 이외 방법으로 거래하시나요? <span>&gt;</span>
											</span>
										</div>
									</div>
									
									<div><div><ul class="pay_method_list item_pay_method_list"><div class="other_wrapper_div"><ul><li><div class="wrapper_div other_wrapper_div_option checked"><div class="info"><label for="Kakaopay" class="radio_desc">카카오페이</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="EasyBank" class="radio_desc">간편 계좌이체</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="CreditCard" class="radio_desc">신용카드</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="Toss" class="radio_desc">토스결제</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="MobilePhone" class="radio_desc">휴대폰</label></div><div class="exp"></div></div></li><li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="VirtualBank" class="radio_desc">무통장(가상계좌)</label></div><div class="exp"></div></div></li></ul></div><div class="other_wrapper_consignment"><span>카카오페이 수수료 : 3.2%</span></div></ul></div><div class="certified_box hide"><div class="title_txt"><span>핸드폰 인증</span></div><div class="phone_number_box"><input type="number" placeholder="숫자만 입력"><button class="addr_search">인증요청</button></div><div class="auth_code_box"><input type="number" placeholder="인증번호 입력"><button class="addr_search">인증</button></div></div></div>
									
									
									
									
									
									
									
									
									
									
									
									
									<div>
										<div class="certified_box hide">
											<div class="title_txt">
												<span>핸드폰 인증</span>
											</div>
											<div class="phone_number_box">
												<input type="number" placeholder="숫자만 입력">
												<button class="addr_search">인증요청</button>
											</div>
											<div class="auth_code_box">
												<input type="number" placeholder="인증번호 입력">
												<button class="addr_search">인증</button>
											</div>
										</div>
									</div>
								</div>
								<div class="order_card_right">
									<div class="title_box sub_last_title_box">최종결제금액</div>
									<div class="final_order_wrapper">
										<div class="final_order_price">
											<dl
												class="final_order_price_border_bottom final_order_price_padding">
												<dt>상품가격</dt>
												<dd>1,599,000원</dd>
											</dl>
											<dl>
												<dt>쿠폰 사용</dt>
												<dd>0원</dd>
											</dl>
											<dl class="final_order_price_margin">
												<dt>배송비</dt>
												<dd style="color: rgb(114, 120, 127); font-size: 13px;">무료배송</dd>
											</dl>
											<dl>
												<dt>
													결제수수료<span class="payment_method_credit">간편 계좌이체
														1.9%적용</span>
												</dt>
												<dd>30,381원</dd>
											</dl>
											<dl
												class="final_order_price_border_bottom final_order_price_padding">
												<dt>안전거래수수료</dt>
												<dd>1,000원</dd>
											</dl>
										</div>
										<div class="order_total_price">
											<div class="title">최종결제금액</div>
											<div class="price" id="orderTotalPrice">1,630,381원</div>
										</div>
										<div class="policy_area">
											<div class="info">
												<label class="feature_option feature_option_checkbox">&nbsp;
													<div class="feature_option_checkbox_indicator"></div>
												</label>
											</div>
											<div class="description">
												결제하기 클릭시 <span class="txt-bl-12 txt_un">결제시 유의사항</span> 및 <span
													class="txt-bl-12 txt_un">반품환불정책</span>을 모두 이해하고 이에 동의함을
												의미합니다.
											</div>
										</div>
										<div class="success_btn_box">
											<div class="success_btn btn_disabled">결제하기</div>
										</div>
									</div>
								</div></li>
							<form method="post" id="SETTLEBANK_PAYINFO"
								target="orderServiceForm">
								<input type="hidden" name="PMid"><input type="hidden"
									name="PAmt"><input type="hidden" name="PGoods"><input
									type="hidden" name="POid"><input type="hidden"
									name="PMname"><input type="hidden" name="PEname"
									value="HELLOMARKET"><input type="hidden" name="PUname"><input
									type="hidden" name="PNoti" value=""><input
									type="hidden" name="PNoteUrl"><input type="hidden"
									name="PNextPUrl"><input type="hidden" name="PCancPUrl"><input
									type="hidden" name="PUserid"><input type="hidden"
									name="PVtransDt"><input type="hidden" name="PBnkCd"><input
									type="hidden" name="PUiFlag" value="Y"><input
									type="hidden" name="PAppScheme" value="hellomarket://"><input
									type="hidden" name="PCardType" value="6"><input
									type="hidden" name="PChainUserId">
							</form>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>