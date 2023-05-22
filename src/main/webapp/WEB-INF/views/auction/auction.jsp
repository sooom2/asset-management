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
							1. 아ㅓㅇㅇㅇ잉ㅂ력해주세요<br>
							2. 가가가가가가ㅏ가가가<br>
							3. 나나난나나나나난나<br>
							4. 다다다다다다
							</p>
							<hr>
							<div class="con_tit">도자기</div>
							<div class="con_detail">
								<!-- 상품이미지 -->
								<div class="contentImage" style="height: 300px"></div><br>
								<!-- 상품정보 -->
								<div>
									<div>
										<span>상품정보</span>
										<div class="con_price">상세정보 창 열기</div>
									</div>
									<span>경매날짜</span>
									<div class="con_period">2023.06.14</div>
									<div>
										<span>시작가</span>
										<div class="con_price">1,000원</div>
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
								<div class="chat_item">
									<div class="chat_item_box">
										<div class="chat_item_image_box">
											<img class="chat_item_image" src="https://ccimg.hellomarket.com/images/2023/member_profile/03/08/13/2823905_171_1.jpg?size=s4" alt="상대방이미지">
										</div>
										<div class="chat_item_message">
											<div class="chat_item_message_box">
												<div class="image_wrapper">
													<div class="image_outside">
														<div class="image_centerbox">
															<img src="https://ccimg.hellomarket.com/images/2023/item/05/15/17/3324332_5222579_1.jpg" alt="채팅아이템이미지" class="chat_item_message_image">
														</div>
													</div>
												</div>
												<div class="chat_item_message_main">
													<div class="chat_item_message_title">서류가방</div>
													<div class="chat_item_message_price">80,000원</div>
												</div>
												<div class="chat_item_message_link">안전결제</div>
											</div>
											<div class="chat_item_timeago">오후 1:57</div>
										</div>
									</div>
								</div>
								<div class="chat_myself">
									<div class="chat_myself_box">
										<div class="chat_myself_message">
											<span>안녕하세요</span>
											<div class="chat_myself_ack"></div>
											<div class="chat_myself_timeago">오후 1:57</div>
											<div class="chat_myself_timeago">오후 1:57</div>
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