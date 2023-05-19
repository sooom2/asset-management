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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	
	$(".sch_date").click(function() { // 일정 잡기 버튼을 클릭했을 때
	    $(".scheduling").datepicker({
	       dateFormat: 'yy-mm-dd' //달력 날짜 형태
	            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	            ,changeYear: true //option값 년 선택 가능
	            ,changeMonth: true //option값  월 선택 가능                
	            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	            ,minDate: "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            ,maxDate: "+30D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
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
								<span>${sellNick }</span>
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
					<div class="scheduling"><a class="sch_date"><i class="fa-regular fa-calendar"></i> 일정잡기</a></div>
				</div>
				
				<!-- 채팅영역 -->
				<div class="chat_description" style="bottom:49px">
					<div>
						<div class="chat_timeago">
							<div class="chat_timeago_box">
								<span class="chat_timeago_text"><fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일" /></span>
							</div>
						</div>
<!-- 						<div class="chat_item"> -->
<!-- 							<div class="chat_item_box"> -->
<!-- 								<div class="chat_item_image_box"> -->
<!-- 									<img class="chat_item_image" src="https://ccimg.hellomarket.com/images/2023/member_profile/03/08/13/2823905_171_1.jpg?size=s4" alt="상대방이미지"> -->
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
<!-- 											<div class="chat_item_message_title">서류가방</div> -->
<!-- 											<div class="chat_item_message_price">80,000원</div> -->
<!-- 										</div> -->
<!-- 										<div class="chat_item_message_link">안전결제</div> -->
<!-- 									</div> -->
<!-- 									<div class="chat_item_timeago">오후 1:57</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="chat_myself">
							<div class="chat_myself_box">
								<div class="chat_myself_message">
									<span>안녕하세요</span>
									<!-- 읽음처리 -->
<!-- 									<div class="chat_myself_ack"></div> -->
									<div class="chat_myself_timeago">오후 1:57</div>
									<div class="chat_myself_timeago">오후 1:57</div>
								</div>
							</div>
						</div>
						
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						
						
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						<div class="chat_opponent">
							<div class="chat_opponent_box">
								<div class="chat_opponent_image_box">
									<img class="chat_opponent_profile_image" src="https://ccimage.hellomarket.com/web/2019/member/img_apply_profile_4x_0419.png" alt="상대방이미지">
								</div>
								<div class="chat_opponent_title">${sellNick }</div>
								<div class="chat_opponent_message">
									<span>녜~ 궁금한점 문의주셔도됩니다</span>
									<div class="chat_opponent_timeago">오전 11:21</div>
								</div>
							</div>
						</div>
						
						
						
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