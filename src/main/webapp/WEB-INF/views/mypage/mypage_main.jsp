<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/inc.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/main.js"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
		<div id="container">
			<div id="content">
				<div class="wrap-sitemap-title">
					<h2 class="sitemap-title">마이페이지</h2>
				</div>
					<div class="section group section-mypage-summary">
						<div class="summary summary-1">
							<h3>회원정보</h3>
							<a href="mypageI" class="btn btn-top">회원정보 관리</a>
							
							<div class="username">
									<b>${member.member_name } 꾸꾸</b> 님
							</div>
		
							<div class="username">
								상품 <span class="right"> 6개 ${member.member_prefer_branch } </span>
		
							</div>
		
							<div class="username">
								거래 평점 <span class="right"> 4.7점 ${member.member_prefer_genre } </span>
							</div>
		
						</div>
						<div class="summary summary-2">
							<h3>
								금일 지출 내역 <span class="num"></span>
							</h3>
							<div id=spendList>
						<div class="scroll-wrapper scrollbar-inner"
							style="position: relative;">
							<div
								class="scrollbar-inner scroll-content scroll-scrolly_visible"
								style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 492px;">
								<ul id="List">
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
									<li>당근당근 | 10,000</li>
								</ul>
							</div>
							<div class="scroll-element scroll-x scroll-scrolly_visible">
								<div class="scroll-element_outer">
									<div class="scroll-element_size"></div>
									<div class="scroll-element_track"></div>
									<div class="scroll-bar" style="width: 359px;"></div>
								</div>
							</div>
							<div class="scroll-element scroll-y scroll-scrolly_visible">
								<div class="scroll-element_outer">
									<div class="scroll-element_size"></div>
									<div class="scroll-element_track"></div>
									<div class="scroll-bar" style="height: 0px; top: 0px;"></div>
								</div>
							</div>
						</div>
					</div>
							<div>
													
							</div>
						</div>
						<div class="summary summary-3">
							<h3>증가 & 감소 추이 분석</h3>	
							<div align="center" style="margin-top: 54px;">
								"지출이 <b style="color: blue;">감소</b>하고 있습니다. <br>
								최근 3개월 대비 지난 3주 동안의 <br>
								일주일 평균 지출은 <b style="color: blue;">-5%</b> 감소했습니다."
							</div>
						</div>
					</div>
					<div class="section group section-mypage-select">
<!-- 						<ul class="selector-summary"> -->
<!-- 							<li><a href="mypageR" class="selected">수입 & 지출 차트</a></li> -->
<!-- 							<li><a href="mypageS" class="">카테고리별 지출</a></li> -->
<!-- 						</ul> -->
					</div>
				</div>
			</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>