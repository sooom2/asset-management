<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>머니머니머니또</title>
<link href="${path }/resources/css/main.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/b2ab45b73f.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.bxslider.min.js"></script>
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

		
	
});
</script>
</head>

<body id="top">

	<jsp:include page="nav.jsp" />
	
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
								<a href="" class="whiteButton button_main" >인기상품</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/002.png') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="main_title"><div style="font-size: 20px;height: 40px">우리끼리<br></div>머니또 경매</div>
							<p class="description">머니또와 함께 거래를 시작해보세요!</p>
							<div class="buttons">
								<a href="" class="violetButton button_main">경매바로가기</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/003.png') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="main_title"><div style="font-size: 20px;height: 40px">이웃과함께하는 동네생활<br></div>머니또 커뮤니티</div>
							<p class="description">우리 동네의 다양한 이야기를 이웃과 함께 나누어요.</p>
							<div class="buttons">
								<a href="" class="whiteButton button_main" >커뮤니티바로가기</a>
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
				<div class="itemWrapper">
				
					<!-- 상품 하나 -->
					<c:forEach var="item" items="${itemList }">
					<div class="item">
						<div class="itemThumbnailBox">
							<!-- 이건좀 아닌거같은데.. -->
							<img src="http://c3d2212t3.itwillbs.com/images/${item.image_name }" alt="썸네일" class="itemThumbnail">
								<div class="wishWrapper">
									<img src="${path }/resources/images/main/ico_heart_off_x3.png" alt="좋아요 아이콘" class="wishWishIcon">
								</div>
						</div>
						<div class="itemTextBox">
							<div class="itemBrand">${item.item_category }</div>
							<div class="itemText">${item.item_price }0원</div>
							<div class="itemText">${item.item_subject }</div>
							<div class="itemTagBox">
								<div class="itemSizeTag">${item.tag }</div>
							</div>
							<div class="itemTimeTag">${item.item_status }</div>
						</div>
					</div>
					</c:forEach>
				</div>
			
				<a href="challange">
					<div class="chall_more">MORE</div>
				</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>






