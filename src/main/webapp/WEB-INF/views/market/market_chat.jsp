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
	
	$('.chat_description').scrollTop($('.chat_description')[0].scrollHeight+1000);

	
	

	let sId = "${sessionScope.sId}";
	var room_code = <%= request.getAttribute("room_code") %>;
	let item_code;
	// (대화내역이 존재하지않을때) => 최근대화에 active
	// (대화내역이 존재할때 ) => 그 내용에 active
	$('.card_box input.room_code[value="'+room_code+'"]').closest('.card_box').addClass('active');
	
	//아이템코드의 대화내용이있으면 그 대화에 active 되야함
	
	$(".card_box").on("click", function() {
	    let room_code = $(this).find('.room_code').val();
	    $(".card_box").removeClass("active");
		$(this).addClass("active");	
		
		//채팅내역을 눌렀을때 > 상세보기
		chatDetail(room_code);		
	});
	
	
    $(".sch_date").click(function() {
        var schBox = $(".sch_box");


        $(".sch_box").datepicker({
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
        	show: "fast" 
        	,
        	onSelect: function(dateText, inst) {
        		let scheduleButton = $(".scheduling").append("<input type='button' class='schdule' value='확인'><input type='button' class='schduleRemove' value='취소'>");
                
                schedule = dateText;
                $(".scheduling").append(scheduleButton);
                
                scheduleButton.click(function() {
                	let sch = confirm(schedule + "으로 일정을 잡으시겠습니까?\n동의시 거래중으로 상태가 바뀝니다.");
                    console.log("선택된 일정: " + schedule);
                    if(sch){
//                     	거래중으로 상태변경
						localStorage.setItem('scheduleValue', schedule);
                    	 $.ajax({
             		        type: "GET",
	             		    url: "itemStatus_update",
	   			            dataType: "text",
	   			            data: {
	   			                item_status: "거래중",
	   			                room_code: room_code
	   			            },
	   			            success: function(result) {
	   			                location.reload();
	   			             	$('.card_box input.room_code[value="'+room_code+'"]').closest('.card_box').addClass('active');
	   			            },
	   			            error: function(request, status, error) {
	   			                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	   			            }
	   			        });
                    }
                });
            }
        });

        $(".sch_date").click(function() {
            $(".sch_box").datepicker("show");
        });

    });
    
   
    //왼쪽 list 눌렸을때
    function chatDetail(room_code){
    	
    	let reviewElement = $("<div class='reviewForm' style='text-align: right;font-size: 13px; color: #bbb'><a>후기작성</a></div>");
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
			        	alert(result[0].buy_member_id);
			        	
			        	// 채팅 헤더 상대방 닉네임
			        	let opponent_nickname = result[0].buy_nickname;
			        	let item_subject = result[0].item_subject;
			        	let buy_profileImg = result[0].buy_image;
			        	let sell_profileImg = result[0].sell_image;
			        	let buy_id = result[0].buy_member_id;
			        	let sell_id = result[0].sell_member_id;
			        	let sell_nickname = result[0].sell_nickname;
			        	let profileImg = sell_profileImg;
			        	
			        	
			        	
						let sellButton = $("<input>").attr("type", "button").addClass("sellTrade").val("거래완료");
						// 상품판매상태 버튼
						$(".trade_status").empty();

						$(".trade_status").append("<input type='button' value='판매중'> <input type='button' value='거래중'> ");
						$(".trade_status").append(sellButton);
						
						if (result[0].item_status === '거래완료') {
						    $(".trade_status").append(reviewElement);
						}

						$(".trade_status input").each(function() {
						    if ($(this).val() === result[0].item_status) {
						        $(this).addClass('active');
						    }
						});
			        	
			        	
			        	if(sId == buy_id){
			        		$(".trade").empty();
				        	$('.image_table img').attr('src', sell_profileImg);
				        	profileImg = sell_profileImg;
				        	$(".trade img").attr("src", "${path}/resources/images/chat/btn_trade_x2.png");
				        	
				        	$(".declaration").after("<div class='trade'><div><img src='${path }/resources/images/chat/btn_trade_x2.png' alt='송금이미지'></div></div>");
				        	
				      	// 파는사람일땐 거래완료를 하면안됨
			        	}else if (sId == sell_id) {
			        	    $('.image_table img').attr('src', sell_profileImg);
			        	    profileImg = buy_profileImg;
			        	    $(".trade").remove();
			        	    alert("ddddd");
			        	    sellButton.prop('disabled', true);
			        	    sellButton.after("<br><span style='font-size: 11px;  display: inline-block; float:right;margin-top:5px;font-weight: bolder;'><i class='fa-brands fa-bilibili'></i> 판매자는 거래완료버튼을 누를수 없습니다.</span>");
			        	}
			        	
			        	
			        	if (sId == result[0].buy_member_id) { opponent_nickname = result[0].sell_nickname; }
			        	$(".chat_header a .info div").empty();
			        	$(".chat_header a .info div").append("<span>[" + sell_nickname + "]<br><i class='fa-regular fa-comment-dots fa-flip-horizontal'></i> " + item_subject + "</span>");
								
						
						
						
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
								    "<img class='chat_opponent_profile_image' src='"+profileImg+"' alt='상대방이미지'></div>" +
								    
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
//     			                location.reload();
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
	
	// 거래중일때 날짜가 남아있게하기위해 ,, 근데 해당방에만 남아있어야하는디..
	let storedSchedule = localStorage.getItem('scheduleValue');
	if(storedSchedule){
		$("input.sch_box").val(storedSchedule);
	}
	
	if($("input.active").val()=="판매중"){
			$(".sch_box").val("");
	}
	    
	
	//리뷰작성
	$(".reviewForm").on("click",function(){
		let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400,height=400,left=350,top=200";
		window.open('reviewForm?item_code='+"market0027", '리뷰작성', options);
	});
    
});

</script>

<script type="text/javascript">




//채팅 시간
let today = new Date();
let year = today.getFullYear();

let month = today.getMonth()+1;
let day = today.getDate();

let h = today.getHours();
let m = today.getMinutes();



month = String(month).padStart(2, '0');
day = String(day).padStart(2, '0');
let amPm = h < 12 ? "오전" : "오후";
let hours = h < 13 ? h : h - 12; // 시
let minutes = m < 10 ? "0" + m : m; // 분

hours = String(hours).padStart(2, '0');
minutes = String(minutes).padStart(2, '0');

let formatDate = year+"-"+month+"-"+day+" "+amPm + " " + hours + ":" + minutes;

let room_code;
let target;
var ws = null;
var socket = null;
$(function() {

	
	
    ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/market_chat");
    socket = ws;
    //파라미터가 있을때 없을떄
    let urlParams = new URLSearchParams(window.location.search);
    let paramItemCode = urlParams.get('item_code');
   
    
    room_code = "${room_code}";
    if (paramItemCode) { // 디테일에서 상대아이디 구하기> 즉 판매자 아이디
        target = "${sellId}";
        item_code = "${param.item_code}";
    } else { // nav에서 들어갈때 최근채팅의 상대아이디
        target = "${opponentId.opponent_id}";
        item_code = "${item_code}";
    }
	    messages();

    
  
    console.log("아이템코드 : " + item_code + "room_code : " + room_code + "target : " + target);

    function chatSend() {
    	
        const data = {
            "room_code": room_code,
            "name": "${ sessionScope.sId }",
            "item_code": item_code,
            "message": $('#message').val(),
            "target": target
        };
        let jsonData = JSON.stringify(data);
        socket.send(jsonData);
        
		
    };
    
    $('#btnSend').on("click", function(evt) {
        chatSend();
        evt.preventDefault();
        $('#message').val('');
    	
    
    });

    $("#message").on("keydown", function(key) {
        if (key.keyCode == 13) {
            chatSend();
            $('#message').val('');
        }
    });


	//리스트 눌렀을때
    $(".card_box li").one("click", function() { //버튼여러번 왓다갓다막기위해 one click
    	
		
        room_code = $(this).find('.room_code').val();
        item_code = $(this).find('.item_code').val();
    
        
        // 메세지 수신 
        // 제일위에 목록은 nav로 처음 들어왔을때 메세지 보내면 보내지게 해놨기때문에
        // 목록을 다른데 클릭했다가 제일위에 있는 목록을 클릭하면 중복으로 메세지가 보내지게 됨
        // 그래서 제일위에 목록이 아닌거에만 메세지를 보내게해야함
        if (!$(this).parent().is("ul > div:first-child")) {
			messages();
        }
        ws.onclose = function(event) {
            console.log('연결종료');
        };
        ws.onerror = function(event) {
            console.log('연결에러');
        };

    });


});




function messages() {

    ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/market_chat");
    socket = ws;

    //처음입장할때
    ws.onopen = function() {
//     	alert("입장");
        console.log('연결완료');
        console.log("방번호 : " + room_code + "아이템코드 :" + item_code + "target : " + target);
        const data = {
            "room_code": room_code,
            "item_code": item_code,
            "name": "${ sessionScope.sId }",
            "message": "${sessionScope.sId} " + "님접속",
            "target": target
        };
        let jsonData = JSON.stringify(data);
        socket.send(jsonData);

    };

    ws.onmessage = function(msg) {
        var data = msg.data;
        var sessionId = null; //데이터를 보낸 사람
        var message = null;
        var cur_session = "${sessionScope.sId}"; //현재 세션에 로그인 한 사람
        sessionId = data.split(":")[0];
        message = data.split(":")[1];
        if (sessionId == cur_session) {
			
        	if (!$(".chat_description").text().trim()) {
	        	var str = "<div class='chat_timeago'>";
	        	str += "<div class='chat_timeago_box'>";
	        	str += "<span class='chat_timeago_text'>"+year+"년 "+month+"월 "+day+"일" +"</span></div></div>";
	        	$(".chat_wrapper").append(str);
        	}
        	
            var str = "<div class='chat_myself'>";
            str += "<div class='chat_myself_box'>";
            str += "<div class='chat_myself_message'>";
            str += "<span>" + message + "</span>";
            str += "<div class='chat_myself_timeago'>" + amPm + " " + hours + ":" + minutes + "</div></div></div></div>";
            $(".chat_wrapper").append(str);

            $(".active .description").text(message);
            $(".active .time_ago").text(year + "-" + month+"-" + day + " "+amPm + " " + hours + ":" + minutes);	
      
        } else {
            var str = " <div class='chat_opponent'><div class='chat_opponent_box'><div class='chat_opponent_image_box'>";
            str += "<img class='chat_opponent_profile_image' src='${opponentId.opponent_image}' alt='상대방이미지'> </div>";
            str += "<div class='chat_opponent_title'>" + sessionId + "</div>";
            str += "<div class='chat_opponent_message'>";
            str += "<span>" + message + "</span>";
            str += "<div class='chat_opponent_timeago'>" + amPm + " " + hours + ":" + minutes + " </div></div></div></div>";

            $(".chat_wrapper").append(str);
            $(".active .description").text(message);
            $(".active .time_ago").text(year + "-" + month + "-" + day + " " + amPm + " " + hours + ":" + minutes);	
        };
        $('.chat_description').scrollTop($('.chat_description')[0].scrollHeight+100);
    };
    
//     location.reload();
}


</script>
</head>
<body>
<jsp:include page="../nav.jsp" />

		<!-- 채팅내역없을때 -->
		<c:if test="${empty param.item_code and empty myChatList}">
			<section class="content">
				<div class="main_area">
					<div class="content_area">
						<a href="market_list">
						<p>
						<span style="font-size: 50px;">🧐</span><br>
						<span>대화 내역이 존재하지 않습니다</span><br>
						<span>대화를 시작 하러 가볼까요?</span><br>
						</p>
						</a>
					</div>
				</div>
			</section>
		</c:if>
	

		<!-- 대화내역이있을때 -->
		<c:if test="${not empty myChatList and createRoom ne 0}">
			<section class="content">
				<div class="main_area">
					<!-- left -->
					<div class="left_main">
						<div class="left_main_header">
							<div class="title">MY CHAT LIST - 내역있을때</div>
						</div>
						<ul>
						<!-- 채팅방 목록-->
						<!--  선택된채팅에 active처리  -->
						<c:forEach var="chatList" items="${myChatList }">
							<div class="card_box">
									<li>
										<div class="profile">
											<img src="${chatList.member_image}" alt="프사">
											<div style="font-size: 13px;  text-align: center;}">${chatList.get('item_status')}</div>
										</div>
										<div class="info">
											<div class="nick">[${chatList.get('member_nickname') }]</div>
											<div class="subject"><i class="fa-regular fa-comment-dots fa-flip-horizontal"></i> ${chatList.get('item_subject') }</div>
											<div class="description">${chatList.get('chat_content') }</div>
											<div class="time_ago">${chatTime}</div>	
											<input type="hidden" value="${chatList.get('room_code')}" class="room_code">
											<input type="hidden" value="${chatList.get('item_code')}" class="item_code">
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
										<img src="${sellDetail.sell_image}" alt="프사">
									</div>
								</div>
								
								<div class="info" onclick="location.href='mypage?member_id=${marketItem.member_id}'">
									<div>
										<!-- 판매자 닉네임 -->
										<span>[${sellDetail.sell_nickname }]<br><i class="fa-regular fa-comment-dots fa-flip-horizontal"></i> ${item_subject }</span>
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
							
							<c:if test="${sellDetail.buy_member_id eq sessionScope.sId }">
								<div class="trade">
									<div>
										<img src="${path }/resources/images/chat/btn_trade_x2.png" alt="송금이미지">
									</div>
								</div>
							</c:if>
							
							
							<div>
							    <div class="scheduling">
							        <a class="sch_date">
							            <i class="fa-regular fa-calendar"></i> 일정잡기 
							        </a>
							        <input type="text" class="sch_box" style="border: none; width: 90px;" readonly/>
							    </div>
							    <div class="trade_status">
		
								    <input type="button" class="${chatList.item_status eq '판매중' ? 'active' : ''}" value="판매중">
								    <input type="button" class="${chatList.item_status eq '거래중' ? 'active' : ''}" value="거래중">
								    <c:choose>
								    	<c:when test="${sellDetail.sell_member_id eq sessionScope.sId }">
									    	<input type="button" class="sellTrade" value="거래완료" disabled="disabled"><br>
								    		<span style="font-size: 11px;  display: inline-block; float:right;margin-top:5px;font-weight: bolder;"><i class="fa-brands fa-bilibili"></i> 판매자는 거래완료버튼을 누를수 없습니다.</span>
								    	</c:when>
								    	<c:otherwise>
										    <input type="button" class="${chatList.item_status eq '거래완료' ? 'active' : ''} sellTrade" value="거래완료">
								    	</c:otherwise>
								    </c:choose>
								    <br>
								    <c:if test="${chatList.item_status eq '거래완료'}">
								        <div class="reviewForm" style="text-align: right;font-size: 13px; color: #bbb"><a>후기작성</a></div>
								    </c:if>
							    </div>
							</div>
							
						</div>
						<!-- 채팅영역 -->
						<div class="chat_description" style="bottom:49px">
							<div class="chat_wrapper" id="chat_wrapper">
								
								<!-- 나 -->
								<div class="chat_timeago">
									<div class="chat_timeago_box">
										<span class="chat_timeago_text">
											<fmt:formatDate value="${chatList.chat_openDate }" pattern="yyyy년 MM월 dd일" />
										</span>
									</div>
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
									                    <img class="chat_opponent_profile_image" src="${oppProfileImg}" alt="상대방이미지">
									                </div>
									                <div class="chat_opponent_title">${opponentId.opponent_nickname }</div>
									                <div class="chat_opponent_message">
									                    <span>${chatDetail.chat_content }</span>
									                    <div class="chat_opponent_timeago"><fmt:formatDate value="${formattedDate}" pattern="a hh:mm" /></div>
									                </div>
									            </div>
									        </div>
									    </c:otherwise>
									</c:choose>
								</c:forEach>
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
		<c:if test="${not empty param.item_code and createRoom eq 0}">
			<section class="content">
				<div class="main_area">
					<!-- left -->
					<div class="left_main">
						<div class="left_main_header">
							<div class="title">MY CHAT LIST- 암것도없을때</div>
						</div>
						<ul>
						<!-- 채팅방 목록-->
						<!--  선택된채팅에 active처리  -->
						<c:forEach var="chatList" items="${myChatList }">
							<div class="card_box">
									<li>
										<div class="profile">
											<img src="${chatList.member_image}" alt="프사">
											<div style="font-size: 13px;  text-align: center;}">${chatList.get('item_status')}</div>
										</div>
										<div class="info">
											<div class="nick">[${chatList.get('member_nickname') }]</div>
											<div class="subject"><i class="fa-regular fa-comment-dots fa-flip-horizontal"></i> ${chatList.get('item_subject') }</div>
											<div class="description">${chatList.get('chat_content') }</div>
											<!-- 날짜처리 제대로해야함 -->
											<fmt:parseDate var="formattedDate" value="${chatList.chat_time}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
											<div class="time_ago"><fmt:formatDate value="${formattedDate}" pattern="yyyy-MM-dd a hh:mm" /></div>	
											<input type="hidden" value="${chatList.get('room_code')}" class="room_code">
											<input type="hidden" value="${chatList.get('item_code')}" class="item_code">
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
										 <img class="chat_opponent_profile_image" src="${sellMember.member_image}" alt="상대방이미지">
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
	<jsp:include page="../footer.jsp" />
</body>
</html>