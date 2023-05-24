<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>머니또</title>
<link href="${path }/resources/css/market_chat.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>




<script type="text/javascript">

$(function() {
    $(".sch_date").click(function() {
        var schBox = $(".sch_box");

        $(".scheduling").datepicker({
            dateFormat: 'yy-mm-dd',
            showOtherMonths: true,
            showMonthAfterYear: true,
            changeYear: true,
            changeMonth: true,
            yearSuffix: "년",
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
            minDate: "0D",
            maxDate: "+30D",
            onSelect: function(dateText, inst) {
                schBox.val(dateText);
                // datepicker 창 숨기기
                $(".scheduling").datepicker("hide"); // 현재 선택한 datepicker를 닫음
                
                //ajax로 거래상태(거래중으로)를 바꿔야함
            }
        });
    });
});

</script>
</head>
<body>
<jsp:include page="../nav.jsp" />

	<section class="content">
		<div class="main_area">
			<!-- left -->
			<div class="left_main">
				<div class="left_main_header">
					<div class="title">MY CHAT LIST</div>
<!-- 					<hr> -->
				</div>
				<ul>
					<!-- 채팅방 목록-->
					<!--  선택된채팅에 active처리  -->
				<c:forEach var="chatList" items="${myChatList }">
					<div class="card_box">
						<a href="">
							<li>
								<div class="profile">
									<img src="${path }/resources/images/chat/defaultProfile.png" alt="명품인증">
								</div>
								<div class="info">

									<div class="nick">${chatList.get('member_nickname') }</div>
									<div class="description">${chatList.get('chat_content') }</div>
<%-- 									<div class="time_ago"><fmt:formatDate value="${chatList.chat_time}" pattern="yyyy년 MM월 dd일" /></div> --%>
									<div class="time_ago">${chatList.chat_time}</div>

<%-- 									<div class="time_ago">${chatList.get('chat_time') }</div> --%>
									
									
								</div>
							</li>
						</a>
						<div class="etc_dots"></div>
					</div>
				</c:forEach>
					
				</ul>
			</div>
			<!-- 나중에 세션아이디로(내아이디) -->
			<input hidden="${id }">
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
								<span>${sellDetail.member_nickname }</span>
								<span>판매아이템 <!-- -->${sellCount }<!-- -->개</span>
							</div>
						</div>
					</a>
					<!-- 신고 -->
					<div class="declaration">
						<div>
							<img src="${path }/resources/images/chat/btn_report_x2.png" alt="신고 이미지">
						</div>
					</div>
					<div>
					    <div class="scheduling">
					        <a class="sch_date">
					            <i class="fa-regular fa-calendar"></i> 일정잡기 
					        </a>
					        <input type="text" class="sch_box" style="border: none; width: 98px;" readonly/>
					    </div>
					    <div class="trade_status">
<!-- 					    선택하는걸로 업데이트 될수있게해야함  -->
					    	<c:choose>
					    		<c:when test="${itemList.item_status eq '판매중' }">
					    			<input type="button" class="active" value="판매중">
				    				<input type="button" value="거래중">
				    				<input type="button" value="거래완료">
					    	
					    		</c:when>
					    		<c:when test="${itemList.item_status eq '거래중' }">
 						    		<input type="button" value="판매중">
					    			<input type="button" class="active"  value="거래중">
					    			<input type="button" value="거래완료">
					    		</c:when>
					    		<c:when test="${itemList.item_status eq '거래완료' }">
					    			<input type="button" value="판매중">
					    			<input type="button" value="거래중">
					    			<input type="button" class="active"  value="거래완료">
					    		</c:when>
					    	</c:choose>
				    		
					    
					    </div>
					</div>
				</div>
				
				<!-- 채팅영역 -->
				<div class="chat_description" style="bottom:49px">
					<div>
						<div class="chat_timeago">
							<div class="chat_timeago_box">
								<span class="chat_timeago_text"><fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일" /></span>
							</div>
						</div>
						
						<!-- 처음에 아이템이미지무조건 출력 -->
<!-- 						<div class="chat_item"> -->
<!-- 							<div class="chat_item_box"> -->
<!-- 								<div class="chat_item_image_box"> -->
<!-- 									<img class="chat_item_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지"> -->
<!-- 								</div> -->
<!-- 								<div class="chat_item_message"> -->
<!-- 									<div class="chat_item_message_box"> -->
<!-- 										<div class="image_wrapper"> -->
<!-- 											<div class="image_outside"> -->
<!-- 												<div class="image_centerbox"> -->
<!-- 													<img src="https://ccimg.hellomarket.com/images/2023/item/05/15/17/3324332_5222579_1.jpg" alt="채팅아이템이미지" class="chat_item_message_image"> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="chat_item_message_main"> -->
<%-- 											<div class="chat_item_message_title">${sellDetail.item_subject }</div> --%>
											
											
										    
											
											
<%-- 											<div class="chat_item_message_price"><fmt:setLocale value="ko_kr"/><fmt:formatNumber value="${sellDetail.item_price }" type="currency" /> 원</div> --%>
<!-- 										</div> -->
<!-- 										<div class="chat_item_message_link">안전결제</div> -->
<!-- 									</div> -->
<!-- 									채팅연결한 시간 (클릭한시간) 룸을db에 저장 -->
<!-- 									<div class="chat_item_timeago">오후 1:57</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
						
						
						<!-- 나 -->
<!-- 						<div class="chat_myself"> -->
<!-- 							<div class="chat_myself_box"> -->
<!-- 								<div class="chat_myself_message"> -->
<!-- 									<span>안녕하세요</span> -->
<!-- 									읽음처리 -->
<!-- 									<div class="chat_myself_ack"></div> -->
<!-- 									<div class="chat_myself_timeago">오후 1:57</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
						
						
						<!-- 파는사람쪽 -->
<!-- 						<div class="chat_opponent"> -->
<!-- 							<div class="chat_opponent_box"> -->
<!-- 								<div class="chat_opponent_image_box"> -->
<!-- 									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지"> -->
<!-- 								</div> -->
<%-- 								<div class="chat_opponent_title">${sellNick }</div> --%>
<!-- 								<div class="chat_opponent_message"> -->
<!-- 									<span>녜~ 궁금한점 문의주셔도됩니다</span> -->
<!-- 									<div class="chat_opponent_timeago">오전 11:21</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
						
						
						
						
					</div>
				</div>
				
				<!-- 전송버튼 -->
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