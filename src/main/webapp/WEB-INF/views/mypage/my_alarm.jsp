<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니또</title>
<style type="text/css">
</style>
<link href="${path }/resources/css/myAlarm.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">


$(function() {
	
	var today = new Date();

	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);

	let dateString = month  + '월 ' + day + '일';

	$(".alarm_date").empty();
	$(".alarm_date").append(dateString);
	
	
	$('.close').on('click', function() {
		
	    $(this).closest('.alarm_list_box').addClass('isRead').css('display', 'none');

	});
});

</script>
</head>
<body>
<jsp:include page="../nav.jsp" />
	<section class="alarm_container">
		<div class="scroll">
			<div>
				<!-- 새로고침 -->
				<div class="alarm_update">
					<button>
						<div></div>
					</button>
				</div>
				
				<!-- 알림리스트 -->
				<div class="alarm_list_box">
					<li class="alarm_date"></li>
				</div>
				<c:forEach var="chatList" items="${chatList}">
				<div class="alarm_list_box">
					<li class="alarm_list">
						<div class="alarm_list_contents" style="right: 0; pointer-events: auto">
								<a href="marketChat" target="_blank" rel="noreferrer">
									<div class="contents">
										<div class="profile">
											<img src="${path }/resources/images/mypage/alarm_msg.png" alt="알람~">
										</div>
										<div class="info_no_item_img">
											<c:choose>
												<c:when test="${sessionScope.sId ne chatList.buy_member_id}">
													<p class="title">${chatList.buy_member_id} 님에게 메세지가 도착했습니다</p>
													<p>
														<fmt:parseDate var="parsedDate" value="${chatList.chat_time }" pattern="yyyy-MM-dd'T'HH:mm:ss" />
														<fmt:formatDate value="${parsedDate}" pattern="MM월 dd일 a hh시mm분 " />
													</p>
												</c:when>
												<c:otherwise>
													<p class="title">${chatList.sell_member_id} 님에게 메세지가 도착했습니다</p>
													<p>
														<fmt:parseDate var="parsedDate" value="${chatList.chat_time }" pattern="yyyy-MM-dd'T'HH:mm:ss" />
														<fmt:formatDate value="${parsedDate}" pattern="MM월 dd일 a hh시mm분 " />
													</p>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</a>
							<button>
								<div class="close"></div>
							</button>
						</div>
					</li>
				</div>
				</c:forEach>
				<c:forEach var="report" items="${report}">
					<div class="alarm_list_box">
						<li class="alarm_list">
							<div class="alarm_list_contents" style="right: 0; pointer-events: auto">
									<a href="" target="_blank" rel="noreferrer">
										<div class="contents">
											<div class="profile">
												<img src="${path }/resources/images/mypage/alarm_report.png" alt="알람~">
											</div>
											<div class="info_no_item_img">
													<p class="title">${report.member_id}님 께서 신고 하셨습니다</p>
											</div>
										</div>
									</a>
								<button>
									<div class="close"></div>
								</button>
							</div>
						</li>
					</div>
				</c:forEach>
<!-- 			포인트 -->
					<c:forEach var="point" items="${point}">
						<c:choose>
						<c:when test="${point ne null }">
						<div class="alarm_list_box">
							<li class="alarm_list">
								<div class="alarm_list_contents" style="right: 0; pointer-events: auto">
										<a href="mypage?member_id=${sessionScope.sId }" target="_blank" rel="noreferrer">
											<div class="contents">
												<div class="profile">
												<img src="${path }/resources/images/mypage/alarm_point.png" alt="알람~">
												</div>
												<div class="info_no_item_img">
														<p class="title">[${point.point_type}]  ${point.point_change } 원 ${point.point_type} 완료</p>
												</div>
											</div>
										</a>
									<button>
										<div class="close"></div>
									</button>
								</div>
							</li>
						</div>
						</c:when>
					</c:choose>
				</c:forEach>
				<!-- 경매 -->
				<c:forEach var="auction" items="${auction}">
					<div class="alarm_list_box">
						<li class="alarm_list">
							<div class="alarm_list_contents" style="right: 0; pointer-events: auto">
									<a href="auctionMain" target="_blank" rel="noreferrer">
										<div class="contents">
											<div class="profile">
												<img src="${path }/resources/images/mypage/alarm_auction.png" alt="알람~">
											</div>
											<div class="info_no_item_img">
													<p class="title">${auction.auction_item_name } - ${auction.pay_price}원에  낙찰 </p>
											</div>
										</div>
									</a>
								<button>
									<div class="close"></div>
								</button>
							</div>
						</li>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
</html>