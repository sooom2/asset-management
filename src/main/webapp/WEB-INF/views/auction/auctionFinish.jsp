<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	$("#con_countDown").html("경매가 종료 되었습니다.");
	$('#auction_input_after *').prop('disabled', true);
	

		
	
		
</script>
<script type="text/javascript">
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
							<div id="con_countDown" class="con_countDown"><i class="fa-regular fa-clock fa-xs"></i>&nbsp;종료된 경매 입니다.</div>
						</div>
						<div class="auction_info">
							<span class="notice_title"><i class="fa-solid fa-bookmark"></i>&nbsp;공지사항</span><br>
							<p class="auction_notice">
							1. 참가 신청을 하셔야 경매에 참여 가능합니다<br>
							2. 경매가의 10%의 보증금을 받습니다<br>
							3. 경매가 끝난 후 낙찰자를 제외하고 보증금을 돌려드립니다<br>
							4. 낙찰 후 구매 취소 시 보증금을 받을 수 없습니다<br>
							5. 즉시 구매 시 경매가 종료됩니다<br>
							6. 현재 페이지를 나가면 채팅 기록이 사라집니다
							</p>
							<hr>
							<div class="con_tit">${auction.get("auction_item_name") }</div>
							<div class="con_detail">
								<!-- 상품이미지 -->
								<div class="contentImage" style="background-image:url('${auction.get('image_name')}')"></div><br>
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
								<div class="con_pick"><i class="fas fa-user"></i>&nbsp;<span>입찰자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${auction.enroll_count }<span>명</span></div></div><br>
							</div>
						</div>
					</div>
				</div>
				<!-- 가운데 -->
				<div class="auction_center">
					
					<div class="auction_realTime">
						<span style="font-size: 25px;">낙찰 금액</span>
								<div class="auction_price"><span id="lastLogPrice">${lastLog.log_content }</span>원&nbsp;<i class="fa-solid fa-comment-dollar"></i></div>
						<div class="auction_alert"><span>서버 요청과 3초 정도 느릴수 있습니다.</span></div>
						<div class="auction_id">
<!-- 						<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> -->
							<span id="auctionLog_nickname">${lastLog.member_nickname }님</span>
						</div>
					</div>
					<div class="auction_realStatus">
						<div class="auction_log_title">경매로그</div>
						<div class="auction_log">
							<div class="logBox">
								<c:forEach var="auctionLog" items="${auctionLog }">
									<div class='chat_myself'>
<%-- 										${auctionLog.member_nickname }님&nbsp;&nbsp;<span>${auctionLog.log_content }원&nbsp;&nbsp;입찰!&nbsp;&nbsp;</span> --%>
										<${auctionLog.log_time }>&nbsp;${auctionLog.member_nickname }님&nbsp;&nbsp;<span>${auctionLog.log_content }원&nbsp;&nbsp;입찰!</span>
									</div>
								</c:forEach>
<!-- 								<div class="chat_myself"> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
					<!-- 경매 등록 전 -->
					<div id="auction_input_before" class="auction_input" >
						<div id="auction_input_title" class="auction_input_title">경매 입찰 등록</div>
						<hr>
						<br><br><br>
						<input id="auctionRegist" class="auction_input_button" type="button" value="종료된 경매입니다." disabled="disabled">
					</div>
					<!-- 경매 등록 후 -->
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
								</div>
							</div>
						</div>
						<div class="chat_footer">
							<div class="chat_footer_area">
								<input type="text" id="message" contenteditable="true" placeholder="종료된 경매 입니다." disabled="disabled">
								<button id="btnSend" type="button" disabled="disabled">전송</button>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
</body>
</html>
