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
<title>머니머니머니또</title>
<link href="${path }/resources/css/main.css" rel="stylesheet">
<link href="${path }/resources/css/market.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/wish.js"></script>
<script type="text/javascript">
	$(function() {
		//메인 슬라이 더
		if ($(".bxslider-main").length) {
			var slider_main_info = [];
			slider_main = $('.bxslider-main').bxSlider(
					{
						auto : true,
						speed : 1000,
						minSlides : 1,
						maxSlides : 1,
						slideWidth : 4096,
						slideMargin : 0,
						infiniteLoop : true,
						adaptiveHeight : true,
						adaptiveHeightSpeed : 1,
						hideControlOnEnd : false,
						preloadImages : 'visible',
						controls : false
					});

			setTimeout(function() {
				slider_main.redrawSlider();
				$(".slider-main .bx-pager").append(
						'<span class="custom-control pause">pause</span>');
			}, 1000);
		}
		var customControlStatus;
		$(document).on("click", ".custom-control", function() {
			if ($(".custom-control").hasClass("pause")) {
				slider_main.stopAuto();
				$(".custom-control").removeClass("pause").addClass("play");
				$(".custom-control").html("play");
				customControlStatus = 'play';
			} else {
				slider_main.startAuto();
				$(".custom-control").removeClass("play").addClass("pause");
				$(".custom-control").html("pause");

				customControlStatus = 'pause';
			}
		});
		$(window).on("orientationchange load resize", function() {
			if (!$(".custom-control").length) {
				if (customControlStatus == 'play') {
					$(".slider-main .bx-pager")
							.append(
									'<span class="custom-control play">play</span>');
				} else {
					$(".slider-main .bx-pager")
							.append(
									'<span class="custom-control pause">pause</span>');
				}
			}
		});

		$(document).on("click", ".slider-main .bx-pager-link", function() {
			slider_main.stopAuto();
			$(".custom-control").removeClass("pause").addClass("play");
			$(".custom-control").html("play");
			customControlStatus = 'play';
		});
		//메인 슬라이더
		
		// 상품 페이지 이동
  	$(".itemThumbnail, .itemTextBox").on("click",function(){
  		var item_code = $(this).closest(".item").attr("data-cd");
		location.href="market_detail?item_code="+item_code
	})
	
	
});
</script>
</head>

<body id="top">
	
	<jsp:include page="nav_mobile.jsp" />
	
	<div id="content">
		<!-- 메인슬라이더 -->
		<div class="section group section-main-slider" id="main-slider">
			<div class="slider-main">
				<ul class="bxslider-main">
					<li style="background: url('resources/images/main/001.png') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="main_title"><div style="font-size: 20px;height: 40px">우리동네 안심 중고직거래마켓<br></div>머니또</div>
							<p class="description">머니또에서 동네 주민들과<br>가깝고 따뜻한 거래를 지금 경험해보세요</p>
							<div class="buttons">
								<a href="market_list" class="whiteButton button_main" >인기상품</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/002.png') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="main_title"><div style="font-size: 20px;height: 40px">우리끼리<br></div>머니또 경매</div>
							<p class="description">머니또와 함께 거래를 시작해보세요!</p>
							<div class="buttons">
								<a href="auctionMain" class="violetButton button_main">경매바로가기</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/003.png') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="main_title"><div style="font-size: 20px;height: 40px">이웃과함께하는 동네생활<br></div>머니또 커뮤니티</div>
							<p class="description">우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>
							<div class="buttons">
								<a href="commBoard" class="whiteButton button_main" >커뮤니티바로가기</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- 메인슬라이더 -->
		
		
		<div class="section group main-board">
			<div class="section group goods-board">
				<div class="bestSell_list_wrap">
					<div class="top">
						<div class="bestSell_title"><i class="fa-brands fa-hotjar"></i>&nbsp;머니또 인기상품</div>
					</div>
				</div>
				<div class="itemListWrapper">
					<div class="itemWrapper">
						<!-- 상품 하나 -->
						<c:forEach var="item" items="${itemList }">
							<div class="item" data-cd="${item.item_code }">
								<div class="itemThumbnailBox">
									<c:choose>
	                              	<c:when test="${not empty item.image_name }">
	                              		<img src="${item.image_name }" alt="itemImg" class="itemThumbnail"/>
	                              	</c:when>
	                              	<c:otherwise>
										<img src="${path }/resources/images/main/noThumbnail.jpg" alt="itemImg" class="itemThumbnail" />		                                  		
	                              	</c:otherwise>
	                            </c:choose>
									<input type="button" value="${item.item_status }" class="status active">
								<c:choose>
	                       	 		<c:when test="${not empty item.wish_code }">
	                       	 			<img src="${path }/resources/images/main/ico_heart_on_x3.png" alt="좋아요 아이콘" class="WishWishImg" />
	                           		</c:when>
	                	 		   	<c:otherwise>
	                      	 		   	<img src="${path }/resources/images/main/ico_heart_off_x3.png"  alt="좋아요 아이콘" class="WishWishImg wish" >
	                      	 		</c:otherwise>
	                             </c:choose>
								</div>
								<div class="itemTextBox">
									<div class="itemCategory">${item.item_category }</div>
									<div class="itemText subject">${item.item_subject }</div>
									<div class="itemText"><fmt:formatNumber value="${item.item_price }" pattern="#,###" />원</div>
									<div class="itemTagBox">
										<c:forEach var="item_tag"
											items="${fn:split(item.item_tag, ',')}">
											<c:choose>
												<c:when test="${not empty item_tag}">
													<div class="itemSizeTag">${item_tag}</div>
												</c:when>
												<c:otherwise>
													<div class="itemSizeTag" style="visibility: hidden;"></div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
									<div>
										<div class="itemTimeTag">
											<fmt:parseDate var="parsedDate" value="${item.item_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
											<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd " />
										</div>
										<div class="itemTimeTag">
											<fmt:parseDate var="parsedDate" value="${item.item_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
											<fmt:formatDate value="${parsedDate}" pattern="ahh시 mm분" />
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				<hr style="margin-top: 50px">
				<div class="bestSell_list_wrap">
					<div class="top">
						<div class="bestSell_title"><i class="fa-solid fa-magnifying-glass fa-flip-horizontal"></i>&nbsp;머니또 최근상품</div>
					</div>
				</div>
				<div class="itemListWrapper">
					<div class="itemWrapper">
						<!-- 상품 하나 -->
						<c:forEach var="item" items="${recentItemList }">
							<div class="item" data-cd="${item.item_code }">
								<div class="itemThumbnailBox">
									<c:choose>
	                              	<c:when test="${not empty item.image_name }">
	                              		<img src="${item.image_name }" alt="itemImg" class="itemThumbnail"/>
	                              	</c:when>
	                              	<c:otherwise>
										<img src="${path }/resources/images/main/noThumbnail.jpg" alt="itemImg" class="itemThumbnail" />		                                  		
	                              	</c:otherwise>
	                            </c:choose>
									<input type="button" value="${item.item_status }" class="status active">
								<c:choose>
	                       	 		<c:when test="${not empty item.wish_code }">
	                       	 			<img src="${path }/resources/images/main/ico_heart_on_x3.png" alt="좋아요 아이콘" class="WishWishImg" />
	                           		</c:when>
	                	 		   	<c:otherwise>
	                      	 		   	<img src="${path }/resources/images/main/ico_heart_off_x3.png"  alt="좋아요 아이콘" class="WishWishImg wish" >
	                      	 		</c:otherwise>
	                             </c:choose>
								</div>
								<div class="itemTextBox">
									<div class="itemCategory">${item.item_category }</div>
									<div class="itemText subject">${item.item_subject }</div>
									<div class="itemText"><fmt:formatNumber value="${item.item_price }" pattern="#,###" />원</div>
									<div class="itemTagBox">
										<c:forEach var="item_tag"
											items="${fn:split(item.item_tag, ',')}">
											<c:choose>
												<c:when test="${not empty item_tag}">
													<div class="itemSizeTag">${item_tag}</div>
												</c:when>
												<c:otherwise>
													<div class="itemSizeTag" style="visibility: hidden;"></div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
									<!-- 여기 날짜 태그가... 적용이안돼요  -->
<!-- 									<div> -->
<!-- 										<div class="itemTimeTag"> -->
<%-- 											<fmt:parseDate var="parsedDate" value="${item.item_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" /> --%>
<%-- 											<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd " /> --%>
<!-- 										</div> -->
<!-- 										<div class="itemTimeTag"> -->
<%-- 											<fmt:parseDate var="parsedDate" value="${item.item_date}" pattern="yyyy-MM-dd'T'HH:mm:ss" /> --%>
<%-- 											<fmt:formatDate value="${parsedDate}" pattern="ahh시 mm분" /> --%>
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				
				<a href="market_list">
					<div class="chall_more">더 많은 상품 보러가기</div>
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>