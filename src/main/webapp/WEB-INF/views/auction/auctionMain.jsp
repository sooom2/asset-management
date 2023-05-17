<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<a href="chatPage">생성후채팅방</a>
			<div class="inner-wrap">
				<h2 class="tit" style="display: inline-block;">소셜 가계부</h2>
				<ul class="auctionTab">
					<li class="on" data-tab="tab1"><a href="#">실시간경매</a></li>
					<li data-tab="tab2"><a href="#">기간경매</a></li>
					<li data-tab="tab3"><a href="#">종료된경매</a></li>
				</ul>
			<div class="section group chall-board">
			<div class="tab_content">
				<!-- Tab  -->
				<div id="tab1" class="tabcontent on">
				<ul class="pickedContentContainer">
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage">
								<div class="ddday">
									시작<br>D-10
								</div>
							</div>
							<div class="contentBox">
<!-- 								<div  class="con_period">[소비방]</div> -->
								<div class="con_tit">도자기</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/20<span>명</span></div>
									<span>현재가</span><div class="con_price"><span class="won">&nbsp;5,000원</span></div>
									<div class="con_period"></div>
								</div>
							</div>
							<a href="" class="clickArea">대화방바로가기</a>
						</div>
					</li>
				</ul>
			</div>
			
			<div id="tab2" class="tabcontent">
			</div>
			
			<div id="tab3" class="tabcontent">
			</div>
			</div>
		</div>
				
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>