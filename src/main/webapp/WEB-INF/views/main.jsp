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
							if (slider_main_info.length > 0) {
								$(".section-main-slider .kind").html(
										slider_main_info[0]["kind"]);
								$(".section-main-slider .title-ko").html(
										slider_main_info[0]["title_ko"]);
								$(".section-main-slider .title-fo").html(
										slider_main_info[0]["title_fo"]);
								$(".section-main-slider .desc").html(
										slider_main_info[0]["desc"]);
							}
						},
						onSlideBefore : function() {
							$(".section-main-slider > span:not(.left)")
									.fadeOut();
						},
						onSlideAfter : function() {
							now = slider_main.getCurrentSlide();
							$(".section-main-slider .kind").html(
									slider_main_info[now]["kind"]);
							$(".section-main-slider .title-ko").html(
									slider_main_info[now]["title_ko"]);
							$(".section-main-slider .title-fo").html(
									slider_main_info[now]["title_fo"]);
							$(".section-main-slider .desc").html(
									slider_main_info[now]["desc"]);
							$(".section-main-slider > span:not(.left)")
									.fadeIn();
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
		$(window)
				.on(
						"orientationchange load resize",
						function() {
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

		// 영화목록
		if ($(".bxslider-bo").length) {
			slider_bo = $('.bxslider-bo').bxSlider({
				auto : false,
				speed : 500,
				minSlides : 5,
				maxSlides : 5,
				slideWidth : 170,
				slideMargin : 10,
				infiniteLoop : false,
				adaptiveHeight : true,
				adaptiveHeightSpeed : 1,
				hideControlOnEnd : true,
				preloadImages : 'visible',
				controls : true
			});
			setTimeout(function() {
				slider_bo.redrawSlider();
			}, 1000);
		}
		if ($(".bxslider-lr").length) {
			slider_lr = $('.bxslider-lr').bxSlider({
				auto : false,
				speed : 500,
				minSlides : 5,
				maxSlides : 5,
				slideWidth : 170,
				slideMargin : 10,
				infiniteLoop : false,
				adaptiveHeight : true,
				adaptiveHeightSpeed : 1,
				hideControlOnEnd : true,
				preloadImages : 'visible',
				controls : true
			});
			setTimeout(function() {
				slider_lr.redrawSlider();
			}, 1000);
		}
		if ($(".bxslider-cs").length) {
			slider_cs = $('.bxslider-cs').bxSlider({
				auto : false,
				speed : 500,
				minSlides : 5,
				maxSlides : 5,
				slideWidth : 170,
				slideMargin : 10,
				infiniteLoop : false,
				adaptiveHeight : true,
				adaptiveHeightSpeed : 1,
				hideControlOnEnd : true,
				preloadImages : 'visible',
				controls : true
			});
			setTimeout(function() {
				slider_cs.redrawSlider();
			}, 1000);
		}

		if ($(".main-movie-list").length) {
			$(".wrap-slider").hide();
			$(".wrap-bo").show();
			$(".main-movie-list .selector li").each(function() {
				$(this).click(function() {
					$(this).siblings().removeClass("selected");
					$(this).addClass("selected");
					var panel = $(this).data("panel");
					$(".wrap-slider").each(function() {
						$(this).hide();
						$(".wrap-" + panel).show();
						window['slider_' + panel].redrawSlider();
					});
				});
			});
		}
	
});
</script>
</head>

<body id="top">

	<jsp:include page="nav.jsp" />
	
	
	<div id="content">
		<!-- 메인슬라이더 -->
		<div class="section group section-main-slider" id="main-slider">
			<span class="kind"></span> <span class="title-ko"></span> <span
				class="title-fo"></span> <span class="desc"></span> <span
				class="left" id="slider_left"></span>
			<div class="slider-main">
				<ul class="bxslider-main">
					<li data-kind="개봉 예정작" data-title_ko="범죄도시3"
						data-title_fo="THE ROUNDUP : NO WAY OUT"
						data-desc="나쁜 놈들 잡는 데 이유 없고 제한 없다 커진 판도 시원하게 싹 쓸어버린다!">
						<a href="MovieInfo?info_movie_code=20226411" style="background: url('resources/images/main/movie/mv4.png') center center no-repeat;"></a>
					</li>
				</ul>
			</div>
		</div>
		

		
		
		<!-- 영화목록 -->
		<div class="section group section-main-movie-list">
			<div class="title">MOVIE</div>
			<div class="main-movie-list">
				<ul class="selector">
					<li class="selected" data-panel="bo">박스오피스</li>
					<li class="" data-panel="cs">상영예정작</li>
				</ul>


				<div class="wrap-slider wrap-bo">
					<ul class="bxslider-bo">
					
						<c:forEach var="movie" items="${screeningMovieList}" end = "9" >
						    <li data-moviecode="${movie.info_movie_code }">
						    	<span class="over over-a">
						    		<a href="reservation" class="rsv">
						    		<span class="over-btn-rsv">
						    		<c:choose>
										<c:when test="${movie.info_status eq 'screening' }">예매하기</c:when>						    		
						    			<c:when test="${movie.info_status eq 'comming' }">상영예정</c:when>
						    			<c:when test="${movie.info_status eq 'end' }">상영종료</c:when>
		    						</c:choose>		</span></a>
						    		<a href="MovieInfo?info_movie_code=${movie.info_movie_code }" class="info"><span class="over-btn-info">상세정보</span></a>
						    	</span>
						    <img src="${movie.info_movie_poster }" class="posterlist">
						    <div class="movie-desc">
						    	<span class="${movie.rate }">${movie.info_rating }</span>
						    		${movie.info_movie_title }
						    	</div>
						 	  	<div class="like-btn">
									<a href="javascript:;" class="icon heart">
									<c:set var="info_movie_code" value="${movie.info_movie_code }"/>
									<c:choose>
										<c:when test ="${fn:contains(likeList,info_movie_code) }">
											<img src='${path }/resources/images/ico/after-like.png' alt="찜하기완료">
										</c:when>
										<c:otherwise>
											<img src="${path }/resources/images/ico/before-like.png" alt="찜하기">	
										</c:otherwise>
									</c:choose>
								<span class="likeNum">${movie.like_count }</span></a>
						</div>
				   		 </li>
						</c:forEach>	
					</ul>
				</div>

				<!--  상영예정작 -->
				<div class="wrap-slider wrap-cs">
					<ul class="bxslider-cs">
						<c:forEach var="movie" items="${commingMovieList}" end = "9" >
						    <li data-moviecode="${movie.info_movie_code }">
						    	<span class="over over-a">
						    		<a href="#" class="rsv"><span class="over-btn-rsv">
						    		<c:choose>
										<c:when test="${movie.info_status eq 'screening' }">예매하기</c:when>						    		
						    			<c:when test="${movie.info_status eq 'comming' }">상영예정</c:when>
						    			<c:when test="${movie.info_status eq 'end' }">상영종료</c:when>
						    		</c:choose>
						    		</span></a>
						    		<a href="MovieInfo?info_movie_code=${movie.info_movie_code }" class="info"><span class="over-btn-info">상세정보</span></a>
						    	</span>
						    <img src="${movie.info_movie_poster }" class="posterlist">
						    <div class="movie-desc">
						    	<span class="${movie.rate }">${movie.info_rating }</span>
						    		${movie.info_movie_title }
						    	</div>
						 	  	<div class="like-btn">
									<a href="javascript:;" class="icon heart">
										<c:set var="info_movie_code" value="${movie.info_movie_code }"/>
										<c:choose>
											<c:when test ="${fn:contains(likeList,info_movie_code) }">
												<img src='${path }/resources/images/ico/after-like.png' alt="찜하기완료">
											</c:when>
											<c:otherwise>
												<img src="${path }/resources/images/ico/before-like.png" alt="찜하기">	
											</c:otherwise>
										</c:choose>
									<span class="likeNum">${movie.like_count }</span></a>
							</div>
				   		 </li>
						</c:forEach>	
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 스토어 / 리뷰 -->
		<div class="section group main-board">

			<ul class="giftcon_list_wrap">

				<li class="pakage">
					<dl class="giftcon_list">
					<dt>
							HOT ITEM<a href="store_main" alt="" class="btn_more pak">더보기</a>
					</dt>
					<c:forEach var="hotItem" items="${hotItem }"> 
						<dd>
							<a href="store_detail?item_code=${hotItem.item_code }">
								<div class="img_wrap" data-scale="false">
									<img src="${hotItem.item_image }" alt="상품이미지">
								</div>
								<div class="giftcon_info_wrap">
									<span>${hotItem.item_name }</span> <strong>${hotItem.item_price }원</strong>
								</div>
							</a>
						</dd>
					</c:forEach>
					</dl>
				</li>
				<li class="bestReview">
					<dl class="giftcon_list">
						<dt>
							베스트리뷰
<!-- 							<a href="" alt="베스트리뷰" class="btn_more">더보기</a> -->
						</dt>

						<dd>
							<ul class="review_con_list" id="review_con_list2">
							<c:forEach var="review" items="${review }">
								<li>
									<span class="img_info">
									<c:choose>
										<c:when test="${review.rev_rating eq '5' }">
								 			<img src="resources/images/main/ic_survey_01.png" alt="">
										</c:when>									
										<c:when test="${review.rev_rating eq '4' }">
											<img src="resources/images/main/ic_survey_02.png" alt="">
										</c:when>									
										<c:when test="${review.rev_rating eq '3' }">
												<img src="resources/images/main/ic_survey_03.png" alt="">
										</c:when>
										<c:otherwise>
											<img src="resources/images/main/ic_survey_05.png" alt="">
										</c:otherwise>
									</c:choose>
								 	</span>
									<div class="top_info">
										<span class="name">${review.mem_name }</span>
										<span class="txt_ic_score">
											<span class="stargradebg">
												<span class="blindbg grade${review.rev_rating }"> <!-- 별 -->
													<span class="stargradecolor "></span>
												</span>
											</span>
												<span class="gradenum">${review.rev_rating }</span> <!-- 숫자 -->
										</span>
										<span class="date_info">${review.rev_date }</span>
									</div>
									<div class="review_info"><a href='MovieInfo?info_movie_code=${review.rev_movie_code }' style="color:#000!important;">[${review.info_movie_title}] ${review.rev_content }</a></div>
									</li>
							</c:forEach>
									
							</ul>
						</dd>

						<dd></dd>

						<dd></dd>

					</dl>
				</li>
			</ul>
			<div class="noticeClient_wrap">
				<div class="contents">
					<div class="noticeClient_container">
						<div class="noticeClient_content">
							<div id="ctl00_PlaceHolderContent_notice_wrap"
								class="notice_wrap">
								<strong>공지사항</strong> <a href="notice_detail?notice_code=${notice.notice_code }" class="btn_link">[${notice.cinema_name}]
									${notice.notice_subject }</a>
								<a href="cc_home" id="notice_more" class="btn_more">더보기</a>
							</div>
							<div class="client_wrap">
								<dl class="client_list">
									<dt>
										<strong>고객센터</strong>
									</dt>
									<dd>
										<strong>1555-0909</strong> <span>고객센터 운영시간 (평일 09:00~18:00)
											<p>업무시간 외 자동응답 안내 가능합니다.</p>
										</span>
									</dd>
								</dl>
								<div class="client_btn_wrap" id="client_btn_wrap">
									<a href="faq">FAQ</a> 
									<a href="oneOnOne">1:1 문의</a> 
									<a href="lost_board">분실물 문의</a>
								</div>
							</div>
						</div>
						<div class="qr_wrap">
							<strong>앱 다운로드</strong> <span>아이무비앱에서 더 편리하게 이용하세요</span>
							<div class="img_wrap" data-scale="false">
								<img src="resources/images/main/img_qrcode.png" alt="QR CODE">
							</div>
							<p>
								QR코드를 스캔하고<br>앱설치 페이지로 바로 이동하세요
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  content -->

		<jsp:include page="footer.jsp" />
</body>
</html>






