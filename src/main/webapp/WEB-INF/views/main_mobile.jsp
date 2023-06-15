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
<%-- <link href="${path }/resources/css/main_mobile.css" rel="stylesheet"> --%>
<link href="${path }/resources/css/market_mobile.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/wish.js"></script>
<script type="text/javascript">
	$(function() {
		// 상품 페이지 이동
  	$(".itemThumbnail, .itemTextBox").on("click",function(){
  		var item_code = $(this).closest(".item").attr("data-cd");
		location.href="market_detail_m?item_code="+item_code
	})
	
	
});
</script>
</head>

<body id="top">
	
	<div id="content">
		<div class="layout__Header-sc-1fg0dfe-0 iSTjqT" style="background-color: #BB2649">
			<div class="TopNavigation__Wrapper-sc-6acoe4-0 iqcBld" style="border-bottom: 1px solid #2f2f2f; ">
				<div class="menu2" style=" display: inline-block;margin-left:5px;margin-top:2px; font-size: 2vh;padding: 27px 10px;color: #fff!important; ">
					<a href="main"><div style="display: inline-block;height: 30px;"><img src="${path }/resources/images/header/mobile_logo.png" style="height: 46px;    margin-bottom: 10px;"></div></a>
					<div class="menu" style=" display: inline-block;    margin-right: 15px; color: #fff">
						<a href="auctionMain" style="color: #fff">경매</a>
					</div>
					<div class="menu" style=" display: inline-block;margin-right: 15px;color: #fff">
						<a href="market_list_mobile" style="color: #fff">중고거래</a>
					</div>
					<div class="menu" style=" display: inline-block;margin-right: 15px;color: #fff">
						<a href="commBoard" style="color: #fff">커뮤니티</a>
					</div>
					<div class="menu" style=" display: inline-block;color: #fff ">
						<a href="noticeList" style="color: #fff">공지사항</a>
					</div>
				</div>
				<div class="jCbMwE" style=" margin-top:25px;display: inline-block;margin-right:15px; float: right; padding: 6px;color: #fff ">
					
						
				<c:choose>
					<c:when test="${empty sessionScope.sId }">
						<a href="memLogin_mobile" style="color: #fff;font-size: 45px"><i class="fa-regular fa-circle-user"></i></a>	
					</c:when>
					<c:otherwise>
						<a href="todayAlarm" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-regular fa-bell"></i></a>
						<a href="marketChat" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-regular fa-comment-dots fa-flip-horizontal" ></i></a>
						<a href="logout" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-right-from-bracket"></i></a>
						<c:if test="${sessionScope.sId ne 'admin' }">
							<a href="itemRegist_mobile" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-boxes-packing"></i></a>
						</c:if>
						<c:if test="${sessionScope.sId eq 'admin' }">
						<a href="admin" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-screwdriver-wrench"></i></a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			</div>
		</div>
		<div>
			<div>
			<div style="background: url(resources/images/main/001.png) center center no-repeat fixed;   background-position: -1215px -31px;">
				<div style="height: 550px;">
					<div style="padding: 135px 100px 100px 100px">
						<div class="main_title">
						<div style="font-size: 40px;height: 40px;margin-bottom: 45px">우리동네 안심 중고직거래마켓<br>
						</div><span style="font-size: 80px">머니또</span></div>
<!-- 						<p class="description" style="font-size: 30px">머니또에서 동네 주민들과<br>가깝고 따뜻한 거래를 지금 경험해보세요</p> -->
						<div class="buttons">
							<a href="market_list" class="whiteButton button_main" style="font-size: 40px;">인기상품</a>
						</div>
					</div>
				</div>
			</div>
		</div>
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
									<div class="itemText subject" style="width: 450px;">${item.item_subject }</div>
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
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<a href="market_list">
					<div class="chall_more" style="margin-top: 30px;">더 많은 상품 보러가기</div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>