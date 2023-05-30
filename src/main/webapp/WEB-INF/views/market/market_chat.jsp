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
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>



<script type="text/javascript">




$(function() {
	
	function scrollToBottom() {
		var chatWrapper = document.getElementById('chatWrapper');
		chatWrapper.scrollTop = chatWrapper.scrollHeight;
	}
	
	
	let sId = "${sessionScope.sId}";
	var room_code = <%= request.getAttribute("room_code") %>;
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
    
    //왼쪽 list 눌렸을때
    function chatDetail(room_code){
    	
    	let reviewElement = $("<div class='review' style='text-align: right;font-size: 13px; color: #bbb'><a>후기작성</a></div>");
    	new Promise((succ, fail)=>{
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
			        	let year = date.getFullYear();
			        	let month = (date.getMonth() + 1).toString().padStart(2, '0');
			        	let day = date.getDate().toString().padStart(2, '0');

			        	let formatDate = year + '년 ' + month + '월 ' + day + '일';
			        	
			        	console.log(result);
			        	
			        	// 채팅 헤더 상대방 닉네임
			        	let oppenent_nickname = result[0].buy_nickname;
			        	let item_subject = result[0].item_subject;
			        	
			        	if (sId == result[0].buy_member_id) { oppenent_nickname = result[0].sell_nickname; }
			        	$(".chat_header a .info div").empty();
			        	$(".chat_header a .info div").append("<span>["+oppenent_nickname+"]<br><i class='fa-regular fa-comment-dots fa-flip-horizontal'></i> "+item_subject+"</span>");
								
						
						// 상품판매상태 버튼
						$(".trade_status").empty();
						$(".trade_status").append("<input type='button' value='판매중'> <input type='button' value='거래중'> <input type='button' value='거래완료'>");
    					
						
						if (result[0].item_status === '거래완료') {
						    $(".trade_status").append(reviewElement);
						}

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
							let formattedMinutes = minutes.toString().padStart(2, '0');
							let amPm = hours < 12 ? "오전" : "오후";
							hours = hours % 12 || 12;
							let formatChatTime = amPm + " " + hours + ":" + formattedMinutes;	        	   
							
							
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
							
							succ(result);
						}//success
			        },
			        error:function(request,status,error){
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
			    }); //ajax
		    
    		}).then((arg) =>{//then    
    			// reload 될때 현재페이지 (지금선택된 목록 )가 reload되야하는디 ㅠ
    			$(".trade_status input").on("click", function() {
    			    let item_status = $(this).val();
    			    let result = confirm(item_status + "으로 변경하시겠습니까");

    			    if (result) {
    			        $.ajax({ //두번째 ajax
    			            type: "GET",
    			            url: "itemStatus_update",
    			            dataType: "text",
    			            data: {
    			                item_status: item_status,
    			                room_code: room_code
    			            },
    			            success: function(result2) {
    			            	
    			                location.reload();
    			            },
    			            error: function(request, status, error) {
    			                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    			            }
    			        });
    			    }
    			});

    		
		});//then(arg)
		    
		    
    }//function chatDetail()
    
	
	// 판매상태 버튼 처리 >> db에 상태 업데이트
	$(".trade_status input").on("click",function(){
		
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
	
	
	
	
	
	//리뷰작성
	$(".review").on("click",function(){
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400,height=400,left=350,top=200";
		window.open('market_review','리뷰작성',options);
	});
    
});

</script>

<script type="text/javascript">


// 채팅보내기
	
	
$(function() {
	let item_code = $(".item_code").val();
	let room_code = "${room_code}";
	console.log(item_code);
	function chatSend() {
		const data = {
				"room_code" :  room_code,
                "name" : "${ sessionScope.sId }",
                "item_code" : item_code,
                "message"   : $('#message').val()
            };
        let jsonData = JSON.stringify(data);
		socket.send(jsonData);
	};

// 	버튼 누름 전송
	$('#btnSend').on("click", function(evt) {
		chatSend();
		evt.preventDefault();
	});
// 	엔터 누름 전송
	$("#message").on("keydown",function(key){
        if(key.keyCode == 13) {
            chatSend();
        }
    });
	connect();
});


	// 채팅 시간
	let today = new Date();
	let h = today.getHours();
	let m = today.getMinutes();

	let amPm = h < 12 ? "오전" : "오후";
	let hours = h < 13 ? h : h - 12; // 시
	let minutes = m < 10 ? "0" + m : m;  // 분

	console.log(today);
	
	
	var socket = null;
	function connect() {
		
		let room_code = "${room_code}";
		let item_code = $(".item_code").val();
		var ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/market_chat");
		socket = ws;
	
		ws.onopen = function() {
			console.log('연결완료');
			console.log("방번호 : "+room_code+"아이템코드 :"+item_code);
			const data = {
					"room_code" :  room_code,
					"item_code" : item_code,
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
			
			if(sessionId == cur_session) {
				
				var str = "<div class='chat_myself'>";
				str += "<div class='chat_myself_box'>";
				str += "<div class='chat_myself_message'>";
				str += "<span>" + message + "</span>";
				str += "<div class='chat_myself_timeago'>" + amPm + " " + hours + ":" + minutes + "</div></div></div></div>";
				$(".chat_wrapper").append(str);
				
				
			} else {
				
				var str = " <div class='chat_opponent'><div class='chat_opponent_box'><div class='chat_opponent_image_box'>";
				str += "<img class='chat_opponent_profile_image' src='https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png' alt='상대방이미지'> </div>";
				str += "<div class='chat_opponent_title'>" + sessionId + "</div>";
				str += "<div class='chat_opponent_message'>";
				str += "<span>" + message + "</span>";
				str += "<div class='chat_opponent_timeago'>" + amPm + " " + hours + ":" + minutes + " </div></div></div></div>";
			
				$(".chat_wrapper").append(str);
			};
	               
	                
		};
	
		ws.onclose = function (event) { console.log('연결종료'); };
		ws.onerror = function (event) { console.log('연결에러'); };
	}

</script>
</head>
<body>
<jsp:include page="../nav.jsp" />
<input class="item_code" type="hidden" value="${param.item_code }">
	<!-- 대화내역이있을때 -->
	<c:if test="${not empty myChatList }">
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
									<div style="font-size: 13px;  text-align: center;}">${chatList.get('item_status')}</div>
								</div>
								<div class="info">
									<div class="nick">[${chatList.get('member_nickname') }]</div>
									<div class="subject"><i class="fa-regular fa-comment-dots fa-flip-horizontal"></i> ${chatList.get('item_subject') }</div>
									<div class="description">${chatList.get('chat_content') }</div>
									<!-- 날짜처리 제대로해야함 -->
<%-- 									<fmt:parseDate var="formattedDate" value="${chatList.chat_time}" pattern="yyyy-MM-dd'T'HH:mm:ss" /> --%>
<%-- 									<div class="time_ago"><fmt:formatDate value="${formattedDate}" pattern="yyyy-MM-dd a hh:mm" /></div>	 --%>
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
								<span>[${chatList.member_nickname }]<br><i class="fa-regular fa-comment-dots fa-flip-horizontal"></i> ${chatList.item_subject }</span>
<%-- 								<span>판매아이템 ${sellCount }개</span> --%>
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

						    <input type="button" class="${chatList.item_status eq '판매중' ? 'active' : ''}" value="판매중">
						    <input type="button" class="${chatList.item_status eq '거래중' ? 'active' : ''}" value="거래중">
						    <input type="button" class="${chatList.item_status eq '거래완료' ? 'active' : ''}" value="거래완료">
						    <br>
						    <c:if test="${chatList.item_status eq '거래완료'}">
						        <div class="review" style="text-align: right;font-size: 13px; color: #bbb"><a>후기작성</a></div>
						    </c:if>
					    </div>
					</div>
				</div>
				
				<!-- 채팅영역 -->
				<div class="chat_description" style="bottom:49px">
					<div class="chat_wrapper" id="chat_wrapper">
						
						
						<!-- 나 -->
							<div class="chat_timeago">
							<c:if test="${not empty room_code}">
								<div class="chat_timeago_box">
									<span class="chat_timeago_text">
										<fmt:formatDate value="${chatList.chat_openDate }" pattern="yyyy년 MM월 dd일" />
									</span>
								</div>
							</c:if>
							</div>
						<c:forEach var="chatDetail" items="${chatDetail }">
							<c:choose>
							    <c:when test="${sessionScope.sId eq chatDetail.chat_mem_id}">
							        <div class="chat_myself">
							            <div class="chat_myself_box">
							                <div class="chat_myself_message">
							                    <span>${chatDetail.chat_content }</span>
							                    <div class="chat_myself_timeago"><fmt:formatDate value="${formattedDate}" pattern="a hh:mm" /></div>
							                </div>
							            </div>
							        </div>
							    </c:when>
							    <c:otherwise>
							        <div class="chat_opponent">
							            <div class="chat_opponent_box">
							                <div class="chat_opponent_image_box">
							                    <img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
							                </div>
							                <div class="chat_opponent_title">${chatDetail.buy_nickname }</div>
							                <div class="chat_opponent_message">
							                    <span>${chatDetail.chat_content }</span>
							                    <div class="chat_opponent_timeago"><fmt:formatDate value="${formattedDate}" pattern="a hh:mm" /></div>
							                </div>
							            </div>
							        </div>
							    </c:otherwise>
							</c:choose>
						</c:forEach>
						
						
						
						
						<!-- 파는사람쪽 -->
				
						
						
					</div>
				</div>
				
				<!-- 전송버튼 -->
				<div class="chat_footer">
					<div class="chat_footer_area">
						<input type="text" class="chat_input" id="message" contenteditable="true" placeholder="메세지를 입력해주세요."></div>
						<button type="button" id="btnSend">전송</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	</c:if>
	
	<!--  대화내역이 존재하지않을때 -->
	<c:if test="${empty myChatList}">
	
		<section class="content">
			<div class="main_area">
				<div class="content_area">
					<p>
					<span style="font-size: 50px;">🧐</span><br>
					<span>대화 내역이 존재하지 않습니다</span>
					<span>대화를 시작 하러 가볼까요?</span>
					</p>
				</div>
			</div>
		</section>
	
	</c:if>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>