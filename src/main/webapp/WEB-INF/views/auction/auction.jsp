<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b2ab45b73f.js" crossorigin="anonymous"></script>
<link href="${path }/resources/css/auction.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<style type="text/css">
.contentImage {
	height: 300px;
}
</style>
<script type="text/javascript">
$(function(){ 
	$('#btnAskingPrice').click(function(askingPrice) { // 물건 금액 5% 가격으로 입찰
		console.log(${askingPrice })
		
	});
	
	$('#btnBid').click(function() { // 입찰하기
// 		console.log(" du dd")
		
	});
	
	$('#btnBid').click(function() { // 즉시구매
// 		console.log(" du dd")
		
	});
});
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
		<div class="fullScreen">
				<!-- 왼쪽 -->
				<div class="auction_left">
					<div class="left_main">
						<div class="remainTime"> 
							<span>경매종료 까지 남은시간</span>
							<div class="con_countDown"><i class="fa-regular fa-clock fa-xs"></i>&nbsp;10분 30초</div>
						</div>
						<div class="auction_info">
							<span class="notice_title"><i class="fa-solid fa-bookmark"></i>&nbsp;공지사항</span><br>
							<p class="auction_notice">
							1. 참가 신청을 하셔야 경매에 참여 가능합니다<br>
							2. 경매가의 10%의 보증금을 받습니다<br>
							3. 경매가 끝난 후 낙찰자를 제외하고 보증금을 돌려드립니다<br>
							4. 낙찰 후 구매 취소 시 보증금을 받을 수 없습니다<br>
							5. 즉시 구매 시 경매가 종료됩니다<br>
							6. 현재 페이지를 나가면 기록이 사라집니다(새로고침)
							</p>
							<hr>
							<div class="con_tit">${auction.get("auction_item_name") }</div>
							<div class="con_detail">
								<!-- 상품이미지 -->
								<div class="contentImage" style="background-image:url('http://c3d2212t3.itwillbs.com/images/${auction.get('image_name')}')"></div><br>
								<!-- 상품정보 -->
								<div>
									<div>
										<span>상품정보</span>
										<div class="con_price">상세정보 창 열기</div>
									</div>
									<span>경매날짜</span>
									<div class="con_period">${auction.get('auction_start_date') }</div>
									<div>
										<span>시작가</span>
										<div class="con_price">${auction.get('auction_present_price') }원</div>
									</div>
								</div>
								<hr>
								<div style="float: right;">
								<div class="con_pick"><i class="fas fa-user"></i>&nbsp;<span>입찰자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<span>명</span></div></div><br>
							</div>
						</div>
					</div>
				</div>
				<!-- 가운데 -->
				<div class="auction_center">
					
					<div class="auction_realTime">
						<span style="font-size: 25px;">실시간 경매</span>
						<div class="auction_price"><span>30,000</span>원&nbsp;<i class="fa-solid fa-comment-dollar"></i></div>
						<div class="auction_alert"><span>서버 요청과 3초 정도 느릴수 있습니다.</span></div>
						<div class="auction_id"><span>'추누공주'님</span></div>
					</div>
					<div class="auction_realStatus">
						<div class="auction_log_title">경매로그</div>
						<div class="auction_log">
							<div>ㅇㅇㅇ님 ㅇㅇㅇㅇ원 입찰 !</div>
							<div>ㅇㅇㅇ님 ㅇdddddㅇㅇㅇ원 입찰 !</div>
							<div>ㅇㅇㅇ님 ㅇㅇㅇㅇ원 입찰 !</div>
							<div>ㅇddddㅇㅇ님 ㅇㅇㅇㅇ원 입찰 !</div>
							<div>ㅇㅇddddㅇ님 ㅇㅇㅇㅇ원 입찰 !</div>
							<div>ㅇㅇㅇ님 ㅇㅇㅇㅇ원 입찰 !</div>
						</div>
					</div>
					<div class="auction_input">
						<div class="auction_input_title">입찰입찰입찰 제목좀바꿔죠</div>
						<hr>
<!-- 						<div style="float: right;"> -->
<!-- 						<div class="con_pick"><i class="fas fa-user"></i>&nbsp;<span>입찰자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<span>명</span></div></div><br> -->
						<div class="bid">
							<div class="bid_left">
								<div>MY 보증금</div>
								<div>입찰하기</div>
								<div>가격 입찰</div>
								<div>내 입찰가</div>
								<div>즉시구매가</div>
							</div>
							<div class="bid_right">
								<div>${deposit }원</div>
								<div><input type="button" id="btnAskingPrice" value="입찰(+${askingPrice })" style="width: 228px"></div>
								<div><input type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="금액입력"><input type="button" value="입찰" id="btnBid"></div>
								<div class="my_bid">28,000원</div>
								<div class="buy_now"><span style="color:#bb2649">${purchase }원</span><input type="button" id="btnPurchase" value="즉시구매" style="float: right;margin-right: 11px;"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 오른쪽 -->
				<div class="auction_right">
					<div class="right_main">
						<div class="chat_header">
							<a href="https://www.hellomarket.com/s/5222579" target="_blank" rel="noopener noreferrer">
								<div class="image_box">
									<div class="image_table">
										<img src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="명품인증님의 프로필 이미지">
									</div>
								</div>
								<div class="info">
									<div>
										<span>도자기</span>
										<span>4/100명</span>
									</div>
								</div>
							</a>
							<div class="declaration">
								<div>
									<img src="https://ccimage.hellomarket.com/web/2019/chat/btn_hellotalk_report_x2.png" alt="신고 이미지">
								</div>
							</div>
							<a href="/messages">
								<div class="chat_close"></div>
							</a>
						</div>
						<div class="chat_description" style="bottom:49px">
							<div>
								<div class="chat_timeago">
									<div class="chat_timeago_box">
										<span class="chat_timeago_text">2023년 05월 17일</span>
									</div>
								</div>
								<div class="chat_myself">
									<div class="chat_myself_box">
										<div class="chat_myself_message">
											<span>안녕하세요</span>
											<div class="chat_myself_ack"></div>
											<div class="chat_myself_timeago">오후 1:57</div>
										</div>
									</div>
								</div>
								<div class="OpponentChat__Wrapper-qv8pn4-0 cFvuGS">
									<img src="https://ccimage.hellomarket.com/img/web/common/empty_profile.svg" alt="상대방 프로필 이미지" class="OpponentChat__ProfileImage-qv8pn4-2 eLwuXd">
									<div class="OpponentChat__Nick-qv8pn4-3 hYaaYd"> 명품인증</div>
									<div class="OpponentChat__MyChatList-qv8pn4-1 lecfCu">
										<div class="OpponentChat__TextBox-qv8pn4-5 giIZqy">
											<span class="OpponentChat__Text-qv8pn4-6 ZPeEt">네 안녕하세요</span>
											<div class="OpponentChat__TimeAgo-qv8pn4-7 jXWPOW">오후 2:06 </div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="chat_footer">
							<div class="chat_footer_area">
								<div class="chat_input" contenteditable="true" placeholder="메세지를 입력해주세요."></div>
								<button type="button">전송</button>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
</body>
</html>