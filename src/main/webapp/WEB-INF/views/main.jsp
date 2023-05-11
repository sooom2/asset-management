<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Insert title here</title>
<link href="${path }/resources/css/main.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<%-- <link href="${path }/resources/css/jquery.bxslider.css" rel="stylesheet"> --%>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		//메인 슬라이 더
		if ($(".bxslider-main").length) {

			var slider_main_info = [];
			$("div.section-main-slider ul.bxslider-main li").each(function() {
				slider_main_info[slider_main_info.length] = {
					kind : $(this).data("kind"),
					title_ko : $(this).data("title_ko"),
					title_fo : $(this).data("title_fo"),
					desc : unescape($(this).data("desc"))
				};
			});

			slider_main = $('.bxslider-main').bxSlider(
					{
						auto : true,
						speed : 500,
						minSlides : 1,
						maxSlides : 1,
						slideWidth : 4096,
						slideMargin : 0,
						infiniteLoop : true,
						adaptiveHeight : true,
						adaptiveHeightSpeed : 1,
						hideControlOnEnd : false,
						preloadImages : 'visible',
						controls : false,
						onSliderLoad : function() {
						},
						onSlideBefore : function() {
						},
						onSlideAfter : function() {
						}
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
					<li style="background: url('resources/images/main/main1.JPG') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="title_2dcSx">우리들의 금융친구<br>머니머니머니또<br><small>챌린지!!!!</small></div>
							
							<div class="buttons_ro1GY">
								<a href="" class="whiteButton button_main" >서비스 더 알아보기</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/main2.JPG') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="title_2dcSx"><small>아껴쓰장아껴쓰장</small><br>머니또 가계부</div>
							<p class="description_19cU6">1분만에, 은행 방문 없이, 신용점수 영향 없이</p>
							<div class="buttons_ro1GY">
								<a href="" class="violetButton button_main">가계부 바로가기</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/main3.JPG') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="titleCard">이벤트 응모하고<br>카드 사용하면<br>최대 73만원 받아요!</div>
							<p class="descriptionCard">기간 한정 이벤트이니 지금 참여하세요.</p>
							<div class="buttons_ro1GY">
								<a href="" class="mustardButton button_main" >카드추천 바로가기</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		
		<!-- 스토어 / 리뷰 -->
		<div class="section group main-board">

			
		
		</div>
		<!--  content -->		

	<jsp:include page="footer.jsp" />
</body>
</html>






