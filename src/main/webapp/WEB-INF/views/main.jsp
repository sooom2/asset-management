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
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
							<div class="main_title">우리들의 금융친구<br>머니머니머니또<br><small>챌린지!!!!</small></div>
							
							<div class="buttons">
								<a href="" class="whiteButton button_main" >서비스 더 알아보기</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/main2.JPG') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="main_title"><small>아껴쓰장아껴쓰장</small><br>머니또 가계부</div>
							<p class="description">1분만에, 은행 방문 없이, 신용점수 영향 없이</p>
							<div class="buttons">
								<a href="" class="violetButton button_main">가계부 바로가기</a>
							</div>
						</div>
					</li>
					<li style="background: url('resources/images/main/main3.JPG') center center no-repeat;">
						<div style="width: 980px;margin: 0 auto;height: 550px; margin-top: 160px;">
							<div class="titleCard">이벤트 응모하고<br>카드 사용하면<br>최대 73만원 받아요!</div>
							<p class="descriptionCard">기간 한정 이벤트이니 지금 참여하세요.</p>
							<div class="buttons">
								<a href="" class="mustardButton button_main" >카드추천 바로가기</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- 메인슬라이더 -->
		
		
		<div class="section group main-board">
			<div class="news_list_wrap">
				<div class="top">
					<div class="news_title">TODAY NEWS</div>
					<div class="btn_more">MORE</div>
				</div>
				<ul class="news_list">
					<li class="news_box">
						<div class="news_tit">에코프로, 연달아 주가 악재…MSCI 지수 편입 무산</div>
						<p>에코프로가 모건스탠리캐피털인터내셔널(MSCI) 한국 지수 구성 종목에 포함되지 못했다.
							MSCI는 12일 5월 정기 리뷰 결과를 발표하고 한국 지수에 한화에어로스페이스, 코스모신소재, KT, 포스코인터내셔널을 새로 편입한다고 발표했다.
							반면 편입이 유력할 것으로 평가됐던 에코프로는 편입이 무산됐다. 증권가는 단기 주가 급등으로 지수 편입이 불발된 것으로 분석하고 있다. BM(기준이 되는 벤치마크) 대비 초과수익률이 일정 기준을 초과하면, 해당 주식은 과열 종목으로 지정돼 신규 구성종목 심사에서 탈락하는 조항 때문이다.
							편입이 불발됨에 따라 지수를 추종하는 글로벌 패시브 자금 유입을 기대하기 어렵게 됐다는 분석이다. 증권업계에 따르면, MSCI 신흥국지수를 추종하는 자금은 500조 원 규모로 추정된다. 지수에 편입되면 편입 비중에 따라 기계적으로 일부 자금이 유입될 수 있다. 전날 이동채 전 에코프로 회장의 구속에 이어 주가에 연달아 악재가 생긴 셈이다.</p>
					</li>
					<li class="news_box">
						<div class="news_tit">뉴우스스스스스제목</div>
						<p>뉴우스스스스스내용</p>
					</li>
					<li class="news_box">
						<div class="news_tit">뉴우스스스스스제목</div>
						<p>뉴우스스스스스내용</p>
					</li>
				</ul>
			</div>
		</div>
		<div style="background-color: #f4f4f4;">
			<div class="section group chall-board">
				<div class="challenge_list_wrap">
					<div class="top">
						<div class="challenge_title">챌린지</div>
<!-- 						<div class="btn_more">MORE</div> -->
					</div>
				</div>
				
				<ul class="pickedContentContainer">
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div class="dday">
									마감까지 D-10
								</div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[7일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);"></div>
							<div class="contentBox">
								<div  class="con_period">[7일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);"></div>
							<div class="contentBox">
								<div  class="con_period">[30일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);"></div>
							<div class="contentBox">
								<div  class="con_period">[60일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div></div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[7일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);"></div>
							<div class="contentBox">
								<div  class="con_period">[7일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);"></div>
							<div class="contentBox">
								<div  class="con_period">[30일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);"></div>
							<div class="contentBox">
								<div  class="con_period">[60일]</div>
								<div class="con_tit">챌린지명</div>
								<div class="con_detail">
									<div class="con_numPeo"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
									<div class="con_price"><span>10000</span><span class="won">&nbsp;원</span></div>	
								</div>
							</div>
							<a href="" class="clickArea">신용카드 추천 읽어보기</a>
						</div>
					</li>
				</ul>
				
				
				<a href="challange">
					<div class="chall_more">MORE</div>
				</a>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>






