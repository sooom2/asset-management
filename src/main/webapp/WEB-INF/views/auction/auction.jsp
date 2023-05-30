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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style type="text/css">
.contentImage {
	height: 300px;
}
</style>
<script type="text/javascript">
// $(function(){ 
// 	$('#btnBid').click(function() { // 즉시구매
// // 		console.log(" du dd")
// 	});
// });

// ==========================================================
$(document).ready(function() {
// 	var message = ${price};
	var message;
	var nowPrice = ${price};
	
	function chatSend() {
// 		console.log(" 옥션 프라이스 텍스트" + $(".auction_price").text())
	
		const data = {
			"id" : "${ sessionScope.sId }",
			"name" : "${ sessionScope.nickname }",
			"message"   : message
// 				if($('#message').val() != null && $('#message').val() != "") {
// 				$('#message').val()
// 				}
		};
		let jsonData = JSON.stringify(data);
		socket.send(jsonData);
		$('#message').val('');
		
	};
	
// 	// 버튼 누름 전송
// 	$('#btnAskingPrice').on("click", function(evt) {
// 		chatSend();
// 		evt.preventDefault();
// 	});
// 	// 버튼 누름 전송
// 	$('#btnBid').on("click", function(evt) {
// 		chatSend();
// 		evt.preventDefault();
// 	});
	

	$(".btn").click(function(){
		
		
		//버튼을 눌렀을때 data-price가 없으면	
		// data-price 없는게 직접 입력 버튼
		if($(this).attr("data-price") == ""){ // 가격 직접 입력시 
			// id = message 값을 message에
			message = $("#message").val();			
		}else{ // 입찰하기(1%값) 버튼 클릭시 
// 			message = $(".auction_price").find("span").html();
			// 누른 값에 해당하는 data-price 속성의 값을 메시지에
			// 현재 상황 입찰하기 버튼을 눌렀을 때 입찰하기 버튼에 data-price속성이 있어서 그 값을 가져오는것
			console.log("1번" + message);
			console.log("1-1번" + typeof message); // number
// 			if(message == null || message == "") {
// 				message = (parseInt($(this).attr("data-price"), 10) + ${price }) + ""; // 3300
// 				console.log("4번" + message + typeof message); // 303000  string
// 			} else {
// 				console.log("else도착");
				message = (parseInt($(this).attr("data-price"), 10) + parseInt(nowPrice, 10) + "");
				console.log("2번" + message);
// 			}
		}
		
		if(message == ""){
			alert("금액을 입력해주세요")
			return false;
		}
		else if(message < ${price} ) {
			alert("최소금액 보다 높게 입력해주세요")
			$("#message").val("");
			message = nowPrice;
			return false;
		}
		
		if(nowPrice < message) {
			nowPrice = message;
		}
		
		console.log(message);
		chatSend();
	})
	
	connect();
	
});


//채팅 시간
let today = new Date();
let h = today.getHours();
let m = today.getMinutes();

let amPm = h < 12 ? "오전" : "오후";
let hours = h < 12 ? h : h - 12; // 시
let minutes = m < 10 ? "0" + m : m;  // 분


var socket = null;
function connect() {
	var ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/auctionChat");
	socket = ws;
	
	ws.onopen = function() {
		console.log('Info: connection opened');
		
	};
	
	// 메세지 수신
	ws.onmessage = function (msg) {
		var data = msg.data;
		var sessionId = null; //데이터를 보낸 사람
		var sessionName = null; 
		var message = null;
		
		var cur_session = "${sessionScope.sId}"; //현재 세션에 로그인 한 사람
		console.log(data);
		sessionId = data.split(":")[0];
		sessionName = data.split(":")[1];
		message = data.split(":")[2];

		
		// 낙찰 최대금액
	//	var auctionMax = "<span>" + message + "</span>원&nbsp;<i class='fa-solid fa-comment-dollar'></i>";
	//	$(".auction_price").html(auctionMax);
		$(".auction_price").find("span").html(message);
// 		$("#btnAskingPrice").attr("data-price",message);
		//  입찰하기 부분이 현재 최고가 기준으로 변경됨 (속성만)
		// 보여주는 부분을 변경하려면 val()을 수정해야하는것
// 		$("btnAskingPrice").attr("data-price", message);
		
		// 낙찰 최대금액 닉네임
		var auctionNic = "<span>" + sessionName + "님</span>";
		$(".auction_id").html(auctionNic);
		
		// 경매 로그
		var auctionLog = "<div class='chat_myself'>" + sessionName + "님&nbsp;&nbsp;<span>" + message + "원&nbsp;&nbsp;입찰!&nbsp;&nbsp;</span>" + amPm + " " + hours + ":" + minutes + "</div>";
		$(".chatBox").append(auctionLog);
		
		if(sessionId == cur_session) { // 세션 ID 와 입력된 금액의 ID가 같을 경우
			// 내가 입력한 낙찰가
			var auctionMyPrice =  message + "원";
			$(".my_bid").html(auctionMyPrice);
		}
	};
	
	ws.onclose = function (event) { console.log('Info: connection closed'); };
	ws.onerror = function (event) { console.log('Info: connection closed'); };
}
// ==========================================================

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
						<div class="auction_price"><span>${auction.auction_present_price }</span>원&nbsp;<i class="fa-solid fa-comment-dollar"></i></div>
						<div class="auction_alert"><span>서버 요청과 3초 정도 느릴수 있습니다.</span></div>
						<div class="auction_id">
						<span>추누공주님</span>
						</div>
					</div>
					<div class="auction_realStatus">
						<div class="auction_log_title">경매로그</div>
						<div class="auction_log">
							<div class="chatBox">
								<div class="chat_myself">
								</div>
							</div>
<!-- 							<div>ㅇㅇㅇ님 ㅇㅇㅇㅇ원 입찰 !</div> -->
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
							
<%-- 								<div>${prince * 0.1 }원 소수점 지워지나?</div> --%>
								<div>${deposit }원</div>
								<div>
									<input type="button" id="btnAskingPrice" value="즉시입찰(+${askingPrice })" style="width: 228px"
									data-price="${askingPrice }" class="btn">
								</div><!-- 실시간 변동 금액에 대한 호가 계산 -->
								<div>
									<input type="text" id="message" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="금액입력">
									<input type="button" value="입찰" id="btnBid" class="btn" data-price="">
								</div>
								<div class="my_bid"></div>
								<div class="buy_now">
									<span style="color:#bb2649">${purchase }원</span>
									<input type="button" id="btnPurchase" value="즉시구매" style="float: right;margin-right: 11px;">
								</div>
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