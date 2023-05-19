<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/resources/css/market_chat.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav.jsp" />

	<section class="content">
		<div class="main_area">
			<!-- left -->
			<div class="left_main">
				<div class="left_main_header">
					<div class="title">MY CHAT LIST</div>
				</div>
				<ul>
					<!-- 채팅방 목록-->
					<!--  선택된채팅에 active처리  -->
					<div class="card_box active">
						<a href="">
							<li>
								<div class="profile">
									<img src="${path }/resources/images/chat/defaultProfile.png" alt="명품인증">
								</div>
								<div class="info">
									<div class="nick">아무나상</div>
									<div class="description">안녕하세요</div>
									<div class="time_ago">오후 01:57</div>
								</div>
							</li>
						</a>
						<div class="etc_dots"></div>
					</div>
					
					<div class="card_box">
						<a href="">
							<li>
								<div class="profile">
									<img src="${path }/resources/images/chat/defaultProfile.png" alt="명품인증">
								</div>
								<div class="info">
									<div class="nick">아이티윌 보부상</div>
									<div class="description">ㅎㅇ</div>
									<div class="time_ago">오후 02:06</div>
								</div>
							</li>
						</a>
						<div class="etc_dots"></div>
					</div>
					
					
				</ul>
			</div>
			
			<!-- 채팅방 -->
			<div class="right_main">
				<div class="chat_header">
					<a href="" target="_blank" rel="noopener noreferrer" style="display: inline-block;">
						<div class="image_box">
							<div class="image_table">
								<img src="${path }/resources/images/chat/defaultProfile.png" alt="ㅇㅇ님의 프로필 이미지">
							</div>
						</div>
						<div class="info">
							<div>
								<span>아무나상</span>
								<span>판매아이템 <!-- -->8<!-- -->개</span>
							</div>
						</div>
					</a>
					<!-- 신고 -->
					<div class="declaration">
						<div>
							<img src="${path }/resources/images/chat/btn_report_x2.png" alt="신고 이미지">
						</div>
					</div>
					<div class="scheduling"><a><i class="fa-regular fa-calendar"></i> 일정잡기</a></div>
				</div>
				
				<!-- 채팅내용 -->
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
	</section>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>