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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function() {
	
	// 결제 금액
	$('#item_price').html("${auction.get('pay_price') }".replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원");
	
	
	
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
							<div class="title">결제 내역</div>
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
																	src="${auction.get('image_name')}"
																	alt="디올 어딕트 숄더백">
															</div>
														</div>
													</div>
													<div class="cont cont_main_col_1">
														<div class="item_title title_main_col_1">${auction.get('auction_item_name')}</div>
														<div id="item_price" class="item_price pri_main_col_1"></div>
														<div class="item_hasdeliveryfee">무료배송</div>
													</div>
													<div class="cont cont_main_col_1">
														<div class="item_hasdeliveryfee">&nbsp;</div>
														<div class="item_hasdeliveryfee">&nbsp;</div><br><br>
														<div class="item_title title_main_col_1">택배 배송은 문자로 알려드립니다.</div>
														<div id="item_deposit" class="item_price pri_main_col_1"></div>
													</div>
												</div>
											</li>
										</ul>
									</div></li>
								<li class="order_card "><div class="title_box">결제 상세</div>
									<ul class="order_member_info">
										<li>
											<dl>
												<dt>이름</dt>
												<dd class="order_member_name">
													<input type="text" class="w_10" name="member_id"
														placeholder="이름 입력" value="${auction.get('member_name') }" disabled="disabled">
												</dd>
											</dl>
										</li>
										<li><dl>
												<dt>연락처</dt>
												<dd class="order_member_phone">
													<input type="number" class="w_10" placeholder="숫자만 입력" name="member_tel"
														value="${auction.get('member_tel') }" disabled="disabled">
												</dd>
											</dl></li>
										<li><dl>
												<dt>주소</dt>
												<dd>
													<div readonly="" name="receiverAddr1" class="div_input_st">주소</div>
													<input style="width: 40%" type="text" name="member_address"
														placeholder="주소 입력" class="w_10" value="${auction.get('member_address') }" disabled="disabled">&nbsp;&nbsp;
												</dd>
											</dl></li>
										<li>
											<dl>
												<dt></dt>
												<dd>
													<div readonly="" name="receiverAddr2" class="div_input_st">상세주소</div>
													<input style="width: 40%" type="text" name="member_address_detail"
														placeholder="상세주소 입력" class="w_10" value="${auction.get('member_address_detail') }" disabled="disabled">
												</dd>
											</dl>
										</li>
										<li>
											<dl>
												<dt>배송 요청사항</dt>
												<dd class="order_member_name">
													<textarea disabled="disabled" name="pay_request" rows="5" cols="50" class="w_10" placeholder="요청사항 입력">${auction.get('pay_request') }</textarea>
												</dd>
											</dl>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>