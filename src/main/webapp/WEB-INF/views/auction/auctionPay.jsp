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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	// 다음 주소 API
	$('.addr_search').on("click", function() {
		new daum.Postcode({
            oncomplete: function(data) {
            	 $('input[name=receiverAddr1]').val(data.address);
            	 $('input[name=receiverAddr2]').focus(); //상세입력 포커싱
            }
        }).open();
	});
	
	// 전액 사용 버튼
	$('.coupon_btn').on("click", function() {
		let payPrice = "${payPrice}".replaceAll(",", "") + "원";
		if(${member.member_point} <= ${payPrice}) {
			$('#usePoint').html(${member.member_point});
		} else {
			$('#usePoint').html(payPrice);
		}
		
		
	});
	
	// 이용 약관 체크.
	$('.feature_option_checkbox_indicator').on("click", function() {
		if($(this).attr('class') != 'feature_option_checkbox_indicator checked') {
			$(this).addClass('checked');
    		$('.success_btn').removeClass('btn_disabled');
    		$('.success_btn').attr('disabled', false);
        } else {
    		$(this).removeClass('checked');
    		$('.success_btn').addClass('btn_disabled');
    		$('.success_btn').attr('disabled', true);
        }
		
	});
	
	
	
	// 결제 수단
	$('.wrapper_div').click(function() {
		$('.wrapper_div').removeClass('checked');
		$(this).addClass('checked');
	});
	
});
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="item_list_area">
		<div class="breadcrumbs">
			<ul>
				<li><a href="main">HOME</a></li>
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
																src="${auction.image_name}"
																alt="디올 어딕트 숄더백">
														</div>
													</div>
												</div>
												<div class="cont cont_main_col_1">
													<div class="item_title title_main_col_1">${auction.auction_item_name}</div>
													<div class="item_price pri_main_col_1">${lastLog.log_content }원</div>
													<div class="item_hasdeliveryfee">무료배송</div>
												</div>
												<div class="cont cont_main_col_1">
													<div class="item_hasdeliveryfee">&nbsp;</div>
													<div class="item_hasdeliveryfee">&nbsp;</div>
													<div class="item_title title_main_col_1">보증금</div>
													<div class="item_price pri_main_col_1">${deposit }원</div>
												</div>
											</div>
										</li>
									</ul>
								</div></li>
							<li class="order_card "><div class="title_box">배송지</div>
								<div class="parcel_wrapper">
									<div class="label adress_label">배송지선택</div>
								</div>
								<ul class="order_member_info">
									<li><dl>
											<dt>이름</dt>
											<dd class="order_member_name">
												<input type="text" class="w_10" name="receiverName"
													placeholder="이름 입력" value="${member.get('member_name') }">
											</dd>
										</dl></li>
									<li><dl>
											<dt>연락처</dt>
											<dd class="order_member_phone">
												<input type="number" class="w_10" placeholder="숫자만 입력"
													value="${member.get('member_tel') }">
											</dd>
										</dl></li>
									<li><dl>
											<dt>주소</dt>
											<dd>
												<div readonly="" name="receiverAddr1" class="div_input_st">주소</div>
												<input type="text" name="receiverAddr1"
													placeholder="주소 입력" class="w_10" value="${member.member_address }">
												<button class="addr_search">주소찾기</button>
											</dd>
										</dl></li>
									<li><dl>
											<dt></dt>
											<dd>
												<div readonly="" name="receiverAddr2" class="div_input_st">상세주소</div>
												<input type="text" name="receiverAddr2"
													placeholder="상세주소 입력" class="w_10" value="${member.member_address_detail }">
											</dd>
										</dl></li>
								</ul></li>
							<li class="order_card last_order_card"><div
									class="order_card_left">
									<div class="title_box">머니또 포인트</div>
									<div>
										<div class="wallet_wrapper wallet_items_wrapper">
											<div class="box_coupon">
												<div class="title order_sub_title">사용가능 머니또</div>
												<div class="box_coupon_right">
													<div>
														<div class="description">${member.member_point }원</div>
														<div class="coupon_btn">전액사용</div>
													</div>
												</div>
											</div>
											<div class="box_coupon">
												<div class="title order_sub_title">직접 입력</div>
												<div class="price">
													<input type="text" style="margin-left:60px">
													<span>원</span>
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
											<span class="other_wrapper_description other_wrapper_box">
											머니또 포인트 외 결제는 수수료 3.2% 부가됩니다.
											</span>
										</div>
									</div>
										<div>
											<div>
												<ul class="pay_method_list item_pay_method_list">
													<div class="other_wrapper_div">
														<ul>
															<li>
																<div class="wrapper_div other_wrapper_div_option checked">
																	<div class="info">
																		<label for="CreditCard" class="radio_desc">신용카드</label>
																	</div>
																	<div class="exp"></div>
																</div>
															</li>
															<li>
																<div class="wrapper_div other_wrapper_div_option">
																	<div class="info">
																		<label for="Kakaopay" class="radio_desc">카카오페이</label>
																	</div>
																	<div class="exp"></div>
																</div>
															</li>
															<li>
																<div class="wrapper_div other_wrapper_div_option">
																	<div class="info">
																		<label for="Toss" class="radio_desc">토스결제</label>
																	</div>
																	<div class="exp"></div>
																</div>
															</li>
														</ul>
													</div>
													<div class="other_wrapper_consignment"><span>수수료 : 3.2%</span>
													</div>
												</ul>
											</div>
											<div class="certified_box hide">
											<div class="title_txt"><span>핸드폰 인증</span></div>
											<div class="phone_number_box"><input type="number" placeholder="숫자만 입력">
											<button class="addr_search">인증요청</button></div><div class="auth_code_box">
											<input type="number" placeholder="인증번호 입력"><button class="addr_search">인증</button>
											</div>
											</div>
										</div>
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
												<dt>결제가격</dt>
												<dd>${payPrice }원</dd>
											</dl>
											<dl>
												<dt>포인트 사용</dt>
												<dd id="usePoint">0원</dd>
											</dl>
											<dl class="final_order_price_margin">
												<dt>배송비</dt>
												<dd style="color: rgb(114, 120, 127); font-size: 13px;">무료배송</dd>
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
											<form  method="post">
												<input type="hidden" name="PMid">
												<input type="hidden" name="PAmt">
												<input type="hidden" name="PGoods">
												<input class="success_btn btn_disabled" type="button" value="결제하기" disabled="disabled" style="width: 100%; border: none;">
											</form>
										</div>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>