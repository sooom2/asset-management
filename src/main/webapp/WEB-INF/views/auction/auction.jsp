<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<script src="https://kit.fontawesome.com/b2ab45b73f.js" crossorigin="anonymous"></script>
<link href="${path }/resources/css/auction.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style type="text/css">
.contentImage {
	height: 250px;
	
}
.OpponentChat__Wrapper-qv8pn4-0 {
	margin-left: 10px;
}

.auction_input_button {
	font-size: 20px;
	width: 300px;
	height: 40px;
    margin: auto;
    display: block;
}

#auction_input_title {
	color: #bb2649;
    font-weight: bold;
}

#message {
  width: 70%;
  height: 60px;
  font-size: 15px;
  margin-left: 10px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}

#message::placeholder {
  color: black;
  font-family: 'Pretendard-Regular';
}

</style>
<script type="text/javascript">
	// 경매 타이머
	window.onload = function(){
		let clock = null;
		var time = window.setInterval(function(){
			
				now = new Date();
				let year = now.getFullYear();
				let month = now.getMonth() < 10 ? "0" + (now.getMonth() + 1) : now.getMonth() + 1;
				let day = now.getDate();
				let hours = now.getHours();
				let minutes = now.getMinutes() < 10 ? "0" + now.getMinutes() : now.getMinutes();  
				let seconds = now.getSeconds() < 10 ? "0" + now.getSeconds() : now.getSeconds();  
				
				
				clock = year + "."
						+ month + "."
						+ day + " "
						+ hours + ":"
						+ minutes + ":"
						+ seconds
				
				let start_time = new Date("${auction.get('auction_start_date') }");	// 경매 시작 시간
				let current_time = new Date(clock); // 현재시간
				
				
				// 경매 남은시간 분, 초 
				let diffMinutes = 10 - parseInt(((current_time - start_time) / (1000 * 60)));
				let diffSeconds = 60 - (((current_time - start_time) % (1000 * 60)) / 1000);
				let diffSecondsResult = diffSeconds < 10 ? "0" + diffSeconds : diffSeconds; 
				let resultClock = (diffMinutes - 1) + ":" + (diffSecondsResult - 1);
				
				console.log(current_time - start_time);
				
				
				// 경매시작 시간 지나면 (시간 카운트)
				if(start_time <= current_time) {
					$("#con_countDown").html(resultClock);
				} 
				
				// 경매 시작 후 (10분 이 지나면 종료)
				if(current_time - start_time > 600000) {
					
					window.setTimeout(function(){ // setInterval 함수 종료
						window.clearInterval(time);
						$("#con_countDown").html("경매가 종료 되었습니다.");
					});
				}
			
			
			},1000);
		
	};



	$(document).ready(function() {
		
		function chatSend() {
			const data = {
					"auctionCode" :  "${auction.get('auction_code') }",
	                "name" : "${ sessionScope.sId }",
	                "message"   : $('#message').val()
	            };
	        let jsonData = JSON.stringify(data);
			socket.send(jsonData);
			$('#message').val('');
		};
		
		// 버튼 누름 전송
		$('#btnSend').on("click", function(evt) {
			chatSend();
			evt.preventDefault();
		});
		// 엔터 누름 전송
		$("#message").on("keydown",function(key){
	        if(key.keyCode == 13) {
	            chatSend();
	        }
	    });
		
		// 소켓 연결
		connect();
		
		// 경매 입찰 등록
		$("#auctionRegist").on("click", function() {
			location.href="auctionDeposit?auction_code=" + $('input[name=auction_code]').val() 
										+ "&deposit=" + $('input[name=deposit]').val();
		});
		
		
		
		
	});
</script>
<script type="text/javascript">
	// 채팅 시간
	let today = new Date();
	let h = today.getHours();
	let m = today.getMinutes();
	
	let amPm = h < 12 ? "오전" : "오후";
	let hours = h < 13 ? h : h - 12; // 시
	let minutes = m < 10 ? "0" + m : m;  // 분
	
	
	var socket = null;
	function connect() {
		var ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/auctionChat");
		socket = ws;
		
		ws.onopen = function() {
			console.log('Info: connection opened');
			const data = {
					"auctionCode" :  "${auction.get('auction_code') }",
	                "name" : "${ sessionScope.sId }",
	                "message"   : "ENTER"
	            };
			
	        let jsonData = JSON.stringify(data);
			socket.send(jsonData);
			
		};
		
		// 메세지 수신
		ws.onmessage = function (msg) {
			var data = msg.data;
			var sessionId = null; //데이터를 보낸 사람
			var message = null;
			
			var cur_session = "${sessionScope.sId}"; //현재 세션에 로그인 한 사람
			
			sessionId = data.split(":")[0];
			message = data.split(":")[1];
			
		    // 로그인 한 클라이언트와 타 클라이언트를 분류
			if(sessionId == cur_session) {
				var str = "<div class='chat_myself'>";
				str += "<div class='chat_myself_box'>";
				str += "<div class='chat_myself_message'>";
				str += "<span>" + message + "</span>";
				str += "<div class='chat_myself_timeago'>" + amPm + " " + hours + ":" + minutes + "</div></div></div></div>";
				
				$(".chatBox").append(str);
			} else {
				var str = "<div class='OpponentChat__Wrapper-qv8pn4-0 cFvuGS'>";
				str += "<img src='https://ccimage.hellomarket.com/img/web/common/empty_profile.svg' alt='상대방 프로필 이미지' class='OpponentChat__ProfileImage-qv8pn4-2 eLwuXd'>";
				str += "<div class='OpponentChat__Nick-qv8pn4-3 hYaaYd'>" + sessionId + "</div>";
				str += "<div class='OpponentChat__MyChatList-qv8pn4-1 lecfCu'>";
				str += "<div class='OpponentChat__TextBox-qv8pn4-5 giIZqy'>";
				str += "<span class='OpponentChat__Text-qv8pn4-6 ZPeEt'>" + message + "</span>";
				str += "<div class='OpponentChat__TimeAgo-qv8pn4-7 jXWPOW'>" + amPm + " " + hours + ":" + minutes + "</div></div></div></div>";
				
				$(".chatBox").append(str);
			};
			
			
			
		};
		
		ws.onclose = function (event) { console.log('Info: connection closed'); };
		ws.onerror = function (event) { console.log('Info: connection closed'); };
	}
	
	
	
	
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<input type="hidden" name="auction_code" value="${auction.get('auction_code')}">
	<input type="hidden" name="image_name" value="${auction.get('image_name')}">
	<input type="hidden" name="deposit" value="${deposit}">
	<div class="container">
		<div class="fullScreen">
				<!-- 왼쪽 -->
				<div class="auction_left">
					<div class="left_main">
						<div class="remainTime"> 
							<span>경매종료 까지 남은시간</span>
							<div id="con_countDown" class="con_countDown"><i class="fa-regular fa-clock fa-xs"></i>&nbsp;경매 시작 전 입니다.</div>
						</div>
						<div class="auction_info">
							<span class="notice_title"><i class="fa-solid fa-bookmark"></i>&nbsp;공지사항</span><br>
							<p class="auction_notice">
							1. 참가 신청을 하셔야 경매에 참여 가능합니다<br>
							2. 경매가의 10%의 보증금을 받습니다<br>
							3. 경매가 끝난 후 낙찰자를 제외하고 보증금을 돌려드립니다<br>
							4. 낙찰 후 구매 취소 시 보증금을 받을 수 없습니다<br>
							5. 즉시 구매 시 경매가 종료됩니다<br>
							6. 현재 페이지를 나가면 기록이 사라집니다
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
					<div id="auction_input_before" class="auction_input" style="display:block">
						<div id="auction_input_title" class="auction_input_title">경매 입찰 등록</div>
						<hr>
						<br><br><br>
						<input id="auctionRegist" class="auction_input_button" type="button" value="참여하기">
					</div>
					<div id="auction_input_after" class="auction_input" style="display:none">
						<div class="auction_input_title">입찰입찰입찰 제목좀바꿔죠</div>
						<hr>
<!-- 						<div style="float: right;"> -->
<!-- 						<div class="con_pick"><i class="fas fa-user"></i>&nbsp;<span>입찰자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<span>명</span></div></div><br> -->
						<div class="bid">
							<div class="bid_left">
								<div>MY 보증금</div>
								<div>경매단가로 입찰하기</div>
								<div>입찰가격</div>
								<div>내 입찰가</div>
								<div>즉시구매가</div>
							</div>
							<div class="bid_right">
								<div>200,000원</div>
								<div><input type="button" value="단가입찰(상품금액의 5%)" style="width: 228px"></div>
								<div><input type="text" placeholder="금액입력"><input type="button" value="입찰"></div>
								<div class="my_bid">28,000원</div>
								<div class="buy_now"><span style="color:#bb2649">35,000원</span><input type="button" value="즉시구매" style="float: right;margin-right: 11px;"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 오른쪽 -->
				<div class="auction_right">
					<div class="right_main">
						<div class="chat_header">
							<a href="mypage" target="_blank" rel="noopener noreferrer">
								<div class="image_box">
									<div class="image_table">
										<img src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="명품인증님의 프로필 이미지">
									</div>
								</div>
								<div class="info">
									<div id="sessionCount">
										<span>${sessionScope.sId }</span>
										<span id="sessionCount2">0/100명</span>
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
							<div class="chatBox">
								<div class="chat_timeago">
									<div class="chat_timeago_box">
										<span class="chat_timeago_text">${formatedNow }</span>
									</div>
								</div>
								<div class="chat_myself">
									<div class="chat_myself_box">
										<div class="chat_myself_message">
											<span>안녕하세요</span>
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
								<input type="text" id="message" contenteditable="true" placeholder="메세지를 입력해주세요.">
								<button id="btnSend" type="button">전송</button>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
</body>
</html>