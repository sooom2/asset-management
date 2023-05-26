<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>




<script type="text/javascript">

$(function() {
	
	let sId = "${sessionScope.sId}";
	var room_code = <%= request.getAttribute("room_code") %>;
// 	alert(room_code);
	$('.card_box input.room_code[value="'+room_code+'"]').closest('.card_box').addClass('active');

	$(".card_box").on("click", function() {
	    let room_code = $(this).find('.room_code').val();
	    $(".card_box").removeClass("active");
		$(this).addClass("active");

		//채팅내역을 눌렀을때 > 상세보기
		chatDetail(room_code);
	});
	
	
	
	
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
                // datepicker 창 숨기기 왜안숨겨지냐 선택한 
                $(".scheduling").datepicker("hide"); // 현재 선택한 datepicker를 닫음
            }
        });
    });
    
    
    function chatDetail(room_code){
    	
    	
    	new Promise( (succ, fail)=>{
		    $.ajax({
		        type: "GET",
		        url: "chatDetail",
		        dataType: "json",
		        data: {
		        	room_code: room_code
		        },
		        success: function(result){
		        	
		        	//조회한 채팅방 내용에서의 room_code는 동일함 그래서 젤첨값인 resul[0]으로 조회
		        	room_code = result[0].room_code;
		        	
		        	// 채팅 생성 날짜 (처음에 날짜 지정 포맷으로 변경)
		        	let dateString = result[0].chat_openDate;
		        	let date = new Date(dateString);
		        	let formatDate = date.toLocaleDateString("ko-KR", { year: 'numeric', month: 'long', day: 'numeric' });
		        	
		        	
		        	// 채팅 헤더 상대방 닉네임
		        	let oppenent_nickname = result[0].buy_nickname;
		        	if (sId == result[0].buy_member_id) { oppenent_nickname = result[0].sell_nickname; }
		        	$(".chat_header a .info div").empty();
		        	$(".chat_header a .info div").append("<span>"+oppenent_nickname+"</span>");
							
					
					// 상품판매상태 버튼
					$(".trade_status").empty();
					$(".trade_status").append("<input type='button' value='판매중'> <input type='button' value='거래중'> <input type='button' value='거래완료'>");
					
					$(".trade_status input").each(function() {
					    if ($(this).val() === result[0].item_status) {
					        $(this).addClass('active');
					    }
					});
		        	//날짜표시
		        	$(".chat_wrapper").empty();
		            let str = "<div class='chat_timeago'>" +
		                       "<div class='chat_timeago_box'>" +
		                       "<span class='chat_timeago_text'>" + formatDate + "</span></div></div>";
		                       
		            $(".chat_description .chat_wrapper").append(str);
		            
		            //대화내역 상대방인지 나인지 구분하며 표시
					for(var i=0; i<result.length; i++){
						let time = new Date(result[i].chat_time);
						let hours = time.getHours();
						let minutes = time.getMinutes();
						let amPm = hours < 12 ? "오전" : "오후";
						hours = hours % 12 || 12;
						let formatChatTime = amPm + " " + hours + "시" + minutes + "분";	        	   
						
						
						if (sId == result[i].chat_mem_id) {
							let str =
								"<div class='chat_myself'>" +
							    "<div class='chat_myself_box'>" +
							    "<div class='chat_myself_message'>" +
							    "<span>" + result[i].chat_content + "</span>" +
							    "<div class='chat_myself_timeago'>" +formatChatTime + "</div></div></div></div>";
							 	$(".chat_timeago").append(str);
						} else {
							let str =
							    "<div class='chat_opponent'>" +
							    "<div class='chat_opponent_box'>" +
							    "<div class='chat_opponent_image_box'>" +
							    "<img class='chat_opponent_profile_image' src='https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png' alt='상대방이미지'></div>" +
							    "<div class='chat_opponent_title'>" + result[i].buy_nickname + "</div>" +
							    "<div class='chat_opponent_message'>" +
							    "<span>" + result[i].chat_content + "</span>" +
							    "<div class='chat_opponent_timeago'>" + formatChatTime + "</div></div></div></div>";
						  		$(".chat_timeago").append(str);
						}
					}//success
		        },
		        error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		    }); //ajax
		    
    		}).then((arg) =>{    //두번째 ajax
		    
		    alert("ddd");
		    
		});    
		    
		    
    }//function chatDetail()
//     alert("3룸코드 :"+room_code);
	
	// 판매상태 버튼 처리 >> db에 상태 업데이트
	$(".trade_status input").on("click",function(){
//     alert("4룸코드 :"+room_code);
		
		let item_status = $(this).val();
		let result = confirm(item_status+"으로 변경하시겠습니까");
		
		if(result){
			$.ajax({
				type: "GET",
		        url: "itemStatus_update",
		        dataType: "text",
		        data: {
		        	item_status: item_status,
		        	room_code: room_code
				},
				success: function(result){
					 location.reload();
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
			});
		}
		
	});
	
	
	
    
});

</script>
</head>
<body>
<jsp:include page="../nav.jsp" />
<input type="hidden" value="${room_code }">
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
							<li>
								<div class="profile">
									<img src="${path }/resources/images/chat/defaultProfile.png" alt="명품인증">
								</div>
								<div class="info">
									<div class="nick">[${chatList.get('oppenent_nick') }]</div>
									<div class="subject"><i class="fa-regular fa-comment-dots fa-flip-horizontal"></i> ${chatList.get('item_subject') }</div>
									<div class="description">${chatList.get('chat_content') }</div>
									<div class="time_ago">${chatList.chat_time}</div>
									<input type="hidden" value="${chatList.get('room_code')}" class="room_code">
								</div>
							</li>
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
								<!-- 상대방 닉네임 -->
								<span>${chatList.oppenent_nick }</span>
								<span>판매아이템 ${sellCount }개</span>
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
							<c:forEach var="chatDetail" items="${chatDetail }">
						    	<c:choose>
						    		<c:when test="${chatDetail.item_status eq '판매중' }">
						    			<input type="button" class="active" value="판매중">
					    				<input type="button" value="거래중">
					    				<input type="button" value="거래완료">
						    		</c:when>
						    		<c:when test="${chatDetail.item_status eq '거래중' }">
	 						    		<input type="button" value="판매중">
						    			<input type="button" class="active"  value="거래중">
						    			<input type="button" value="거래완료">
						    		</c:when>
						    		<c:when test="${chatDetail.item_status eq '거래완료' }">
						    			<input type="button" value="판매중">
						    			<input type="button" value="거래중">
						    			<input type="button" class="active"  value="거래완료">
						    		</c:when>
						    	</c:choose>
					    	</c:forEach>
					    </div>
					</div>
				</div>
				
				<!-- 채팅영역 -->
				<div class="chat_description" style="bottom:49px">
					<div class="chat_wrapper">
						
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
						<c:forEach var="chatDetail" items="${chatDetail }">
							<div class="chat_timeago">
								<div class="chat_timeago_box">
									<span class="chat_timeago_text">
										<fmt:formatDate value="${chatDetail.chat_openDate }" pattern="yyyy년 MM월 dd일" />
									</span>
								</div>
							</div>
							<c:choose>
								<c:when test="${sessionScope.sId eq chatDetail.chat_mem_id }">
									<div class="chat_myself">
										<div class="chat_myself_box">
											<div class="chat_myself_message">
												<span>${chatDetail.chat_content }</span>
												<c:set var="chat_time" value="${chatDetail.chat_time}" />
												<fmt:parseDate var="formattedDate" value="${chat_time}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
												<div class="chat_myself_timeago"><fmt:formatDate value="${formattedDate}" pattern="a hh:mm" /></div>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									
									
								</c:otherwise>
							</c:choose>
						
						
						
						
						
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
						
						</c:forEach>
						
						
						
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