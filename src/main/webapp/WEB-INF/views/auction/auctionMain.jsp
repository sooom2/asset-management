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
<link href="${path }/resources/css/auction.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/main.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style type="text/css">


</style>
<script type="text/javascript">
$(function() {
	$('ul.auctionTab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.auctionTab li').removeClass('on');
		$('.tabcontent').removeClass('on');
		$(this).addClass('on');
		$('#' + activeTab).addClass('on');
	})
});
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="auction_container">
		<div id="auction_contents" class="">
		<!-- inner-wrap -->
<!-- 			<a href="auction">생성후채팅방</a> -->
			<div class="inner-wrap">
				<h2 class="tit" style="display: inline-block;">소셜 가계부</h2>
				<ul class="auctionTab">
					<li class="on" data-tab="tab1"><a href="#">실시간경매</a></li>
					<li data-tab="tab2"><a href="#">기간경매</a></li>
					<li data-tab="tab3"><a href="#">종료된경매</a></li>
				</ul>
				<div class="section group chall-board">
					<div class="tab_content">
						<!-- Tab1 실시간 경매 -->
						<div id="tab1" class="tabcontent on">
							<ul class="pickedContentContainer">
							
								<!-- 실시간 경매 목록 -->
								<c:forEach var="auction" items="${auction }">
									<c:choose>
										<c:when test="${auction.get('auction_type') eq '실시간 경매' and auction.get('auction_status') eq 'N'}">
											<li class="pickedContent">
											<div class="landingPickWrap">
												<div class="contentImage" style="background-image:url('${auction.get('image_name')}')">
													<div class="ddday">
														시작<br>D-10
													</div>
		<!-- 											<div class="ddday"> -->
		<!-- 												마감임박(몇분)<br>10분 -->
		<!-- 											</div> -->
												</div>
												<div class="contentBox">
					<!-- 								<div  class="con_period">[소비방]</div> -->
													<div class="con_tit">${auction.get("auction_item_name") }</div>
													<hr>
													<div class="con_detail">
														<div><span>시작일</span><div class="con_period">${auction.get('auction_start_date') }</div></div>
														<div><span>현재가</span><div class="con_price"><span class="won">&nbsp;${auction.get("auction_present_price") }원</span></div></div>
														<div><span>즉시구매가</span><div class="con_price">&nbsp;<span class="won">${auction.get("auction_present_price") }원</span></div></div>
														<hr>
														<div><div class="con_pick"><i class="fas fa-user"></i>&nbsp;<span>입찰자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${auction.enroll_count }<span>명</span></div></div><br>
					<!-- 									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/20<span>명</span></div><br> -->
													</div>
												</div>
												<a href="auction?auction_code=${auction.get('auction_code') }" class="clickArea">대화방바로가기</a>
											</div>
											</li>
										</c:when>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						<!-- Tab2 기간 경매 -->
						<div id="tab2" class="tabcontent">
							<ul class="pickedContentContainer">
							<!-- 기간 경매 목록 -->
							<c:forEach var="auction" items="${auction }">
									<c:choose>
										<c:when test="${auction.get('auction_type') eq '기간 경매' and auction.get('auction_status') eq 'N'}">
										<li class="pickedContent">
											<div class="landingPickWrap">
												<div class="contentImage" style="background-image:url('${auction.get('image_name')}')">
													<div class="ddday">
														진 행
		<!-- 												시작<br>D-10 -->
													</div>
												</div>
												<div class="contentBox">
					<!-- 								<div  class="con_period">[소비방]</div> -->
													<div class="con_tit">${auction.get("auction_item_name") }</div>
													<hr>
													<div class="con_detail">
														<div><span>시작일</span><div class="con_period">${auction.get("auction_start_date") }</div></div>
														<div><span>종료일</span><div class="con_period">${auction.get("auction_end_date") }</div></div>
														<div><span>현재가</span><div class="con_price"><span class="won">&nbsp;${auction.get("auction_present_price") }원</span></div></div>
														<div><span>즉시구매가</span><div class="con_price">&nbsp;<span class="won">${auction.get("auction_immediate_price") }원</span></div></div>
														<hr>
														<div><div class="con_pick"><i class="fas fa-user"></i>&nbsp;<span>입찰자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${auction.enroll_count }<span>명</span></div></div><br>
					<!-- 									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/20<span>명</span></div><br> -->
													</div>
												</div>
												<a href="auctionPeriod?auction_code=${auction.get('auction_code') }" class="clickArea">대화방바로가기</a>
											</div>
										</li>
										</c:when>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						<!-- Tab3 종료된 경매 -->
						<div id="tab3" class="tabcontent">
							<ul class="pickedContentContainer">
								<li class="pickedContent">
									<div class="landingPickWrap">
										<div class="contentImage">
<!-- 											<div class="ddday"> -->
<!-- 												시작<br>D-10 -->
<!-- 											</div> -->
										</div>
										<div class="contentBox">
			<!-- 								<div  class="con_period">[소비방]</div> -->
											<div class="con_tit">도자기</div>
											<hr>
											<div class="con_detail">
												<div><span>종료일</span><div class="con_period">2023.05.14</div></div>
												<div><span>낙찰가</span><div class="con_price"><span class="won">&nbsp;5,000원</span></div></div>
<!-- 												<div><span>즉시구매가</span><div class="con_price">&nbsp;<span class="won">35,000원</span></div></div> -->
												<hr>
												<div><div class="con_pick"><i class="fas fa-user"></i>&nbsp;<span>입찰자</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>입찰자명 나중에 표시</span></div></div><br>
			<!-- 									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/20<span>명</span></div><br> -->
											</div>
										</div>
										<a href="auctionFinish" class="clickArea">대화방바로가기</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>