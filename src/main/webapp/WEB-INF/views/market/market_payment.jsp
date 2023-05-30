<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<link href="${path }/resources/css/main.css" rel="stylesheet">
<link href="${path }/resources/css/market_payment.css" rel="stylesheet">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	
	// 아임포트 결제
	var IMP = window.IMP; 
	IMP.init("imp03276613"); 
	
	function requestPay() {
		
		// 포인트 전액 사용시
		if($("#lstPayAmtView").text() == "0") {
			if(confirm("포인트 전액 구매시, 환불이 불가합니다. 결제 하시겠습니까?")) {
				location.href = "store_paySuccess?pay_code=code" + new Date().getTime() + "&pay_type=point" 
				+ "&pay_price=0"
				+ "&pay_status=paid" + "&item_code=" + ${item.get('item_code')} 
				+ "&point=" + $("#totDcAmtView").text();
			} else {
				return;
			}
			
		} else {
			// 결제 수단 선택
			
			console.log($(".checked").find('label').attr('for'))
			if($(".checked").find('label').attr('for') == null) {
				alert("결제수단을 선택하세요.");

				// 이용약관 동의
// 			} else if(!$("#chk01").prop("checked") || !$("#chk02").prop("checked")) {
// 				alert("이용약관에 모두 동의하셔야 합니다.");
				
				// 아임포트 결제
			} else {
				IMP.request_pay({
			        pg : $('input[name="radio_choice"]:checked').val(),
			        pay_method : 'card',
			        merchant_uid: "code" + new Date().getTime(), 
			        name : '${item.get('item_name') }',
			        amount : $("#lstPayAmtView").text(),
			        buyer_email : '${member.get('member_email')}',
			        buyer_name : '${member.get('member_name')}',
			        buyer_tel : '${member.get('member_tel')}',
			        
			    }, function (rsp) { // callback
			        if (rsp.success) {
					    alert("결제가 완료되었습니다.");
					    location.href = "store_paySuccess?pay_code=" + rsp.merchant_uid + "&pay_type=" 
					    				+ rsp.pay_method + "&pay_price=" + rsp.paid_amount
					    				+ "&pay_status=" + rsp.status + "&item_code=" + ${item.get('item_code')} 
					    				+ "&point=" + $("#totDcAmtView").text();
			        } else {
			            alert("실패 : 코드" + rep.error_code + ") / 메세지()"
			            	  + rsp.error_msg + ")");
			        }
			    });
			}
		}
		
	    
	};
	
// 항상 전액 사용하기
$(function() {
	$('.info').click(function(){
		
		$(".checked").removeClass("checked");
		$(this).parent().addClass("checked");
		
	})
// 	var userInputPoint = getCookie("userInputPoint");// 쿠기값 가져오기
    
// 	// 쿠키 있을 시, 저장하기 체크 상태
//     if(userInputPoint != ""){ 
//         $("#savePoint").attr("checked", true);
//         if(${item_price} < ${point}) {
//     		$("#pointNumber").val(${item_price});
//     		$("#totDcAmtView").text($("#pointNumber").val());
//     		$("#lstPayAmtView").text(${item_price } - $("#pointNumber").val());
//     	} else {
//     		$("#pointNumber").val(${point});
//     		$("#totDcAmtView").text($("#pointNumber").val());
//     		$("#lstPayAmtView").text(${item_price } - $("#pointNumber").val());
//     	}
//     }
	
// 	// 항상 저장하기 클릭 시.
// 	$("#savePoint").on("click", function() {
// 		if($(this).is(":checked")) {
// 			var userInputPoint = ${point};
//             setCookie("userInputPoint", userInputPoint, 7); // 7일 보관
//             if(${item_price} < ${point}) {
// 				$("#pointNumber").val(${item_price});
// 				$("#totDcAmtView").text($("#pointNumber").val());
// 				$("#lstPayAmtView").text(${item_price } - $("#pointNumber").val());
// 			} else {
// 				$("#pointNumber").val(${point});
// 				$("#totDcAmtView").text($("#pointNumber").val());
// 				$("#lstPayAmtView").text(${item_price } - $("#pointNumber").val());
// 			}
// 		} else {
// 			$("#pointNumber").val("");
// 			$("#totDcAmtView").text("");
// 			$("#lstPayAmtView").text(${item_price });
// 			var userInputPoint = "";
//             setCookie("userInputPoint", userInputPoint, 7); // 7일 보관
// 		}
		
// 	});
	
//     function setCookie(cookieName, value, exdays){
//         var exdate = new Date();
//         exdate.setDate(exdate.getDate() + exdays);
//         var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
//         document.cookie = cookieName + "=" + cookieValue;
//     }
     
//     function deleteCookie(cookieName){
//         var expireDate = new Date();
//         expireDate.setDate(expireDate.getDate() - 1);
//         document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
//     }
     
//     function getCookie(cookieName) {
//         cookieName = cookieName + '=';
//         var cookieData = document.cookie;
//         var start = cookieData.indexOf(cookieName);
//         var cookieValue = '';
//         if(start != -1){
//             start += cookieName.length;
//             var end = cookieData.indexOf(';', start);
//             if(end == -1)end = cookieData.length;
//             cookieValue = cookieData.substring(start, end);
//         }
//         return unescape(cookieValue);
//     }
	
	
	
});
</script>
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
										<label for="adressList">배송지를 선택해주세요.</label>
										<select disabled="">
											<option hidden="">배송지를 선택해주세요.</option>
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
							<li class="order_card last_order_card">
							<div class="order_card_left">
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
									<div>
										<div>
											<ul class="pay_method_list item_pay_method_list">
												<div class="other_wrapper_div">
													<ul>
														<li><div class="wrapper_div other_wrapper_div_option checked"><div class="info"><label for="Kakaopay" class="radio_desc">카카오페이</label></div><div class="exp"></div></div></li>
														<li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="EasyBank" class="radio_desc">간편 계좌이체</label></div><div class="exp"></div></div></li>
														<li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="CreditCard" class="radio_desc">신용카드</label></div><div class="exp"></div></div></li>
														<li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="Toss" class="radio_desc">토스결제</label></div><div class="exp"></div></div></li>
														<li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="MobilePhone" class="radio_desc">휴대폰</label></div><div class="exp"></div></div></li>
														<li><div class="wrapper_div other_wrapper_div_option"><div class="info"><label for="VirtualBank" class="radio_desc">무통장(가상계좌)</label></div><div class="exp"></div></div></li>
													</ul>
												</div>
												<div class="other_wrapper_consignment">
													<span>카카오페이 수수료 : 3.2%</span>
												</div>
											</ul>
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
											<div class="success_btn btn_disabled" onclick="requestPay()">결제하기</div>
										</div>
									</div>
								</div></li>
							<form method="post" id="SETTLEBANK_PAYINFO"target="orderServiceForm">
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