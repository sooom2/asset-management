
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>머니또관리자페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
	
// $(document).ready(function(){
	
// 	$(".tabTab").on("click",function(){
// 		preventDefault();
		
// 		var chartType = $(this).attr('data-attr');
// 		location.href = "admin_main?chartList="+ chartType ;
// 	});
	
// })
	
	function search(idx) {
		idx = parseInt(idx);
		document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
		document.querySelector("input[name=startNum]").value = Number(idx)*10;
		document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
		let form = document.querySelector('#iForm');
		form.action = 'admin';
		form.method = 'post';
		form.submit();
	}
</script>
</head>
<body>
	<!-- <script type="text/javascript"> -->
	<%-- var list = ${jsonArray}; --%>
	<!-- var now = Date.now(); -->
	<!-- for(var element of list){ -->
	<!-- 	console.log(element.date.compareTo(now)); -->
	<!-- } -->

	<!-- </script> -->
	<%-- 	<c:if test="${sessionScope.sId  ne 'admin' }"> --%>
	<!-- 		<script type="text/javascript"> -->
	<!-- 			alert("잘못된 접근입니다!"); -->
	<!-- 			location.href = "./"; -->
	<!-- 		</script> -->
	<%-- 	</c:if> --%>
	<jsp:include page="admin_nav_top.jsp" />
	<div id="layoutSidenav">
		<!-- 고정  -->
		<jsp:include page="admin_nav_side.jsp" />
		<!-- 고정 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">MONEYTTO MAIN</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">머니또 관리자 페이지</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6" style="margin-right: 20px">
							<div class="card bg-primary text-black mb-4" style="width:400px; height: 550px !important;">
								<div class="card-body font20">
									일별 거래량<br>

									<!-- 								혼합 시작	============================================================== -->
									<div>
										<canvas id="mixedChart" width="350" height="380"></canvas>
									</div>

									<script>
										var list = ${jsonArray};
										console.log(list);
										var nowDay = list[0].date;
										var oneDay = list[1].date;
										var twoDay = list[2].date;
										var threeDay = list[3].date;
										var forDay = list[4].date;
										var fiveDay = list[5].date;
										var sixDay = list[6].date;
										console.log(nowDay);
										
// 										const now = Date.now();
// 										let year = now.getFullYear();
// 										let month = now.getMonth() < 10 ? "0" + (now.getMonth() + 1) : now.getMonth() + 1;
// 										let day = now.getDate();
										
// 										var nowDate1 = year + "-" + month + "-" + day;
// 										console.log("오늘 날짜 nowDate : " + nowDate);
// 										for(var i = 0; i < list.length ; i ++){
// 											console.log("list[i].date : " + list[i].date);
// // 											console.log(list[i].date);
											
// 										}
// 										let today = nEW DATE();
// 										CONSOLE.LOG(Today);
// 									    var trade1 = ${accountCnt.totalCnt};

// 									    const trade1 = ${tradeChart};
// 										console.log(${tradeChart});
									    var ctx = document.getElementById('mixedChart').getContext('2d');
									
									    var mixedChart = new Chart(ctx, {
									        type: 'bar',
									        data: {
									            labels: [sixDay, fiveDay, forDay, threeDay, twoDay, oneDay, nowDay],
									            datasets: [{
									                label: 'Sales',
									                data: [list[6].dateCnt, list[5].dateCnt, list[4].dateCnt, list[3].dateCnt, list[2].dateCnt, list[1].dateCnt, list[0].dateCnt],
									                backgroundColor: 'rgba(54, 162, 235, 0.5)'
									            }]
									        },
									        options: {
									            responsive: true,
									            scales: {
									                y: {
									                    beginAtZero: true
									                }
									            }
									        }
									    });
									
									    mixedChart.data.datasets.push({
									        type: 'line',
									        label: 'Average',
									        data: [list[6].dateCnt, list[5].dateCnt, list[4].dateCnt, list[3].dateCnt, list[2].dateCnt, list[1].dateCnt, list[0].dateCnt],
									        borderColor: 'rgba(255, 99, 132, 1)',
									        fill: false
									    });
									</script>
									<!-- 								혼합 끝	============================================================== -->


								</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<div class="tabTab" data-attr="cateAdmin">
										<a class="small text-black stretched-link"
											href="admin?chartList=tradeAdmin">상세내역</a>
									</div>
<!-- 									<a class="small text-black stretched-link" href="resList">더보기</a> -->
									<div class="small text-black">
										<svg class="svg-inline--fa fa-angle-right" aria-hidden="true"
											focusable="false" data-prefix="fas" data-icon="angle-right"
											role="img" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 256 512" data-fa-i2svg="">
											<path fill="currentColor"
												d="M246.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-160 160c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L178.7 256 41.4 118.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l160 160z"></path>
										</svg>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6" style="margin-right: 20px;">
							<div class="card bg-primary text-black mb-4" style="width: 400px!important;height: 550px !important;">
								<div class="card-body font20">
									카테고리별<br>

									<!-- 								도넛 2. 카테고리별 차트	============================================================== -->
									<canvas id="chart1"></canvas>
									<script>
										
										var cate1 = ${categoryCnt.cate1} + ${categoryCnt.cate8} + ${categoryCnt.cate9};
										var cate2 = ${categoryCnt.cate2} + ${categoryCnt.cate10};
										var cate3 = ${categoryCnt.cate3};
										var cate4 = ${categoryCnt.cate4};
										var cate5 = ${categoryCnt.cate5} + ${categoryCnt.cate11};
										var cate6 = ${categoryCnt.cate6};
										var cate7 = ${categoryCnt.cate7} + ${categoryCnt.cate12};
										
										var ctx1 = document.getElementById('chart1').getContext('2d');
										var chart1 = new Chart(ctx1, {
										    type: 'doughnut',
										    data: {
										    	labels: ['패션/의류/잡화/뷰티', '가전제품/모바일/PC', '가구/인테리어', '도서/음반/문구/티켓', '게임/스포츠/취미', '유아동/반려동물', '그외기타'],
										        datasets: [{
										            data: [cate1, cate2, cate3, cate4, cate5, cate6, cate7],
										            backgroundColor: ['#4bc0c0', '#9966ff', '#ff9f40', '#ff00ff', '#00ffff', '#ffff00', '#0000ff',]
										        }]
										    },
										    options: {
										        // 차트 옵션 설정
										    }
										});
									</script>

									<!-- 								도넛끝	============================================================== -->
								</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<div class="tabTab" data-attr="cateAdmin">
										<a class="small text-black stretched-link"
											href="admin?chartList=cateAdmin">상세내역</a>
									</div>
									<!-- 									<a class="small text-black stretched-link" href="resList">더보기</a> -->
									<div class="small text-black">
										<svg class="svg-inline--fa fa-angle-right" aria-hidden="true"
											focusable="false" data-prefix="fas" data-icon="angle-right"
											role="img" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 256 512" data-fa-i2svg="">
											<path fill="currentColor"
												d="M246.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-160 160c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L178.7 256 41.4 118.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l160 160z"></path>
										</svg>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-black mb-4" style="width: 400px!important;height: 550px !important;">
								<div class="card-body font20">
									거래비율<br>

									<!-- 								도넛 3. 직거래, 안전거래 비교 차트	============================================================== -->
									<canvas id="chart2"></canvas>
									<script>
										
										var tradeType = ${payTypeCnt.tradeCnt};
										var safeType = ${payTypeCnt.safeCnt};
										
										var ctx2 = document.getElementById('chart2').getContext('2d');
										var chart2 = new Chart(ctx2, {
										    type: 'doughnut',
										    data: {
										    	labels: ['직접거래', '안전거래'],
										        datasets: [{
										            data: [tradeType, safeType],
										            backgroundColor: ['#ff6384', '#36a2eb']
										        }]
										    },
										    options: {
										        // 차트 옵션 설정
										    }
										});
									</script>
									<!-- 								도넛끝	============================================================== -->


								</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<div class="tabTab" data-attr="payTypeAdmin">
										<a class="small text-black stretched-link"
											href="admin?chartList=payTypeAdmin">거래비율 상세</a>
									</div>
									<!-- 									<a class="small text-black stretched-link" href="resList">더보기</a> -->
									<div class="small text-black">
										<svg class="svg-inline--fa fa-angle-right" aria-hidden="true"
											focusable="false" data-prefix="fas" data-icon="angle-right"
											role="img" xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 256 512" data-fa-i2svg="">
											<path fill="currentColor"
												d="M246.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-160 160c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L178.7 256 41.4 118.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l160 160z"></path>
										</svg>
									</div>
								</div>
							</div>
						</div>



					</div>

					<!-- 테이블 -->
					<div class="card mb-4">
						<c:choose>
							<c:when test="${param.chartList eq 'tradeAdmin'}">
<!-- 						 1번차트 클릭시 -->
								<!-- 일자별 몇건인지 보여주는게 좋지 않나? -->
								<div class="card-header">
									<svg class="svg-inline--fa fa-table me-1" aria-hidden="true"
										focusable="false" data-prefix="fas" data-icon="table"
										role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 512 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M64 256V160H224v96H64zm0 64H224v96H64V320zm224 96V320H448v96H288zM448 256H288V160H448v96zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z"></path>
									</svg>
									일별 거래량
								</div>
								<div class="card-body">
									<form id="iForm">
										<div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
											<div class="datatable-top">
												<div>
													<strong>전체 <em class="font-gblue">${chartList.size() }</em>건</strong>
												</div>
												<!-- 									<div class="datatable-search" style="width: 348px;float: left;display: inline-block;"> -->
												<%-- 										<input class="datatable-input" value="${pageCnt.searchKeyword }" name="searchKeyword" type="search"  --%>
												<!-- 										placeholder="검색어를 입력해 주세요." aria-controls="datatablesSimple" style="width: 210px;"> -->
												<!-- 										<input class="btn btn-block btn-more" type="button" value="검색" onclick="search('0');" -->
												<!-- 											style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;"> -->
												<!-- 									</div> -->
											</div>
											<%-- 								<input type="hidden" name="startNum" value="${pageCnt.startNum}"> --%>
											<%-- 								<input type="hidden" name="endNum" value="${pageCnt.endNum}"> --%>
											<%-- 								<input type="hidden" name="pageNum" value="${pageCnt.pageNum}"> --%>
											<!-- 회원정보 테이블 -->
											<div class="datatable-container">
												<table id="datatablesSimple" class="datatable-table">
													<thead>
														<tr>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">번호</a></th>
<!-- 															<th data-sortable="true" style="width: 10%;"><a -->
<!-- 																href="#" class="datatable-sorter">전체거래량</a></th> -->
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">가격</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">카테고리</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">날짜</a></th>
														</tr>
													</thead>
													<!-- 회원목록 -->
													<c:forEach var="chartList" items="${chartList }">
														<tbody>
															<tr data-index="0">
																<td>${chartList.rownum }</td>
<%-- 																<td>${chartList.totalCnt }</td> --%>
																<td>${chartList.price }</td>
																<td>${chartList.category }</td>
																<td>${chartList.d }</td>
															</tr>
														</tbody>
													</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- pagination  -->
											
											<!-- pagination  -->
										</div>
									</form>
								</div>
							</c:when>
							
							<c:when test="${param.chartList eq 'payTypeAdmin'}">
						<!--  3번차트 클릭시 -->
<!-- 								거래 종류 , 종류별 수, 날짜 이것만 보여줘도 될듯한데 -->
								<div class="card-header">
									<svg class="svg-inline--fa fa-table me-1" aria-hidden="true"
										focusable="false" data-prefix="fas" data-icon="table"
										role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 512 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M64 256V160H224v96H64zm0 64H224v96H64V320zm224 96V320H448v96H288zM448 256H288V160H448v96zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z"></path>
									</svg>
									거래비율
								</div>
								<div class="card-body">
									<form id="iForm">
										<div
											class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
											<div class="datatable-top">
												<div>
													<strong>전체 <em class="font-gblue">${payTypeCnt.tradeCnt + payTypeCnt.safeCnt == null ? 0 : payTypeCnt.tradeCnt + payTypeCnt.safeCnt}</em>건
													</strong>
												</div>
												<!-- 									<div class="datatable-search" style="width: 348px;float: left;display: inline-block;"> -->
												<%-- 										<input class="datatable-input" value="${pageCnt.searchKeyword }" name="searchKeyword" type="search"  --%>
												<!-- 										placeholder="검색어를 입력해 주세요." aria-controls="datatablesSimple" style="width: 210px;"> -->
												<!-- 										<input class="btn btn-block btn-more" type="button" value="검색" onclick="search('0');" -->
												<!-- 											style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;"> -->
												<!-- 									</div> -->
											</div>
											<%-- 								<input type="hidden" name="startNum" value="${pageCnt.startNum}"> --%>
											<%-- 								<input type="hidden" name="endNum" value="${pageCnt.endNum}"> --%>
											<%-- 								<input type="hidden" name="pageNum" value="${pageCnt.pageNum}"> --%>
											<!-- 회원정보 테이블 -->
											<div class="datatable-container">
												<table id="datatablesSimple" class="datatable-table">
													<thead>
														<tr>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">번호</a></th>
<!-- 															<th data-sortable="true" style="width: 10%;"><a -->
<!-- 																href="#" class="datatable-sorter">코드</a></th> -->
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">구매자</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">판매자</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">가격</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">거래종류</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">거래종류수</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">날짜</a></th>
														</tr>
													</thead>
													<!-- 회원목록 -->
													<c:forEach var="payTypeAdmin" items="${payTypeAdmin }">
														<tbody>
															<tr data-index="0">
																<td>${payTypeAdmin.rownum }</td>
<%-- 																<td>${payTypeAdmin.market_code }</td> --%>
																<td>${payTypeAdmin.buy_id }</td>
																<td>${payTypeAdmin.sell_id }</td>
																<td>${payTypeAdmin.market_price }</td>
																<td>${payTypeAdmin.market_pay_type }</td>
																<c:choose>
																	<c:when test="${payTypeAdmin.trade_cnt != null}">
																		<td>${payTypeAdmin.trade_cnt }</td>
																	</c:when>
																	<c:when test="${payTypeAdmin.safe_cnt != null}">
																		<td>${payTypeAdmin.safe_cnt }</td>
																	</c:when>
																</c:choose>
																<td>${payTypeAdmin.market_date }</td>
															</tr>
														</tbody>
													</c:forEach>
													</tbody>
												</table>
											</div>
											<!-- pagination  -->
											
											<!-- pagination  -->
										</div>
									</form>
								</div>
							</c:when>
							
							<c:otherwise>
								<div class="card-header">
									<svg class="svg-inline--fa fa-table me-1" aria-hidden="true"
										focusable="false" data-prefix="fas" data-icon="table"
										role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 512 512" data-fa-i2svg="">
								<path fill="currentColor"
											d="M64 256V160H224v96H64zm0 64H224v96H64V320zm224 96V320H448v96H288zM448 256H288V160H448v96zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z"></path>
							</svg>
									카테고리별 상세
								</div>
								<div class="card-body">
									<form id="iForm">
										<div
											class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
											<div class="datatable-top">
												<div>
													<strong>전체 <em class="font-gblue">${categoryCnt.totalCnt == null ? 0 : categoryCnt.totalCnt}</em>건
													</strong>
												</div>
												<!-- 									<div class="datatable-search" style="width: 348px;float: left;display: inline-block;"> -->
												<%-- 										<input class="datatable-input" value="${pageCnt.searchKeyword }" name="searchKeyword" type="search"  --%>
												<!-- 										placeholder="검색어를 입력해 주세요." aria-controls="datatablesSimple" style="width: 210px;"> -->
												<!-- 										<input class="btn btn-block btn-more" type="button" value="검색" onclick="search('0');" -->
												<!-- 											style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;"> -->
												<!-- 									</div> -->
											</div>
											<%-- 								<input type="hidden" name="startNum" value="${pageCnt.startNum}"> --%>
											<%-- 								<input type="hidden" name="endNum" value="${pageCnt.endNum}"> --%>
											<%-- 								<input type="hidden" name="pageNum" value="${pageCnt.pageNum}"> --%>
											<!-- 회원정보 테이블 -->

											<div class="datatable-container">
												<table id="datatablesSimple" class="datatable-table">
													<thead>
														<tr>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">번호</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">코드</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">카테고리</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">구매자</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">날짜</a></th>
															<th data-sortable="true" style="width: 10%;"><a
																href="#" class="datatable-sorter">카테고리별 수</a></th>
														</tr>
													</thead>
													<!-- 회원목록 -->
													<c:forEach var="categoryChart" items="${categoryChart }">
														<tbody>
															<tr data-index="0">
																<td>${categoryChart.rownum }</td>
																<td>${categoryChart.code }</td>
																<td>${categoryChart.category }</td>
																<td>${categoryChart.buy_id }</td>
																<td>${categoryChart.date }</td>
																<td>${categoryChart.cate_cnt }</td>
															</tr>
														</tbody>
													</c:forEach>
													</tbody>
												</table>
											</div>

											<!-- pagination  -->
											<!-- 									<div class="datatable-bottom"> -->
											<!-- 									<nav class="datatable-pagination"> -->
											<!-- 									<ul class="datatable-pagination-list"> -->
											<%-- 										<c:if test="${1 < pageCnt.pageNum }"> --%>
											<!-- 												<li class="datatable-pagination-list-item datatable-hidden" -->
											<%-- 													onclick="location.href='adminAuction?pageNum=${pageNum - 1}'"> --%>
											<%-- 													<a href="javascript:search('${pageCnt.pageNum-2}')" class="datatable-pagination-list-item-link" pagenum="1">‹</a> --%>
											<!-- 												</li> -->
											<%-- 										</c:if> --%>
											<%-- 										<c:forEach begin="${pageCnt.pageNum-pageCnt.pageNum%10}" end="${(categoryCnt.totalCnt == null ? 1 : categoryCnt.totalCnt/10) + (categoryCnt.totalCnt%10> 0 ? 1 : 0) -1}" varStatus="status"> --%>
											<%-- 											<c:choose> --%>
											<%-- 												<c:when test="${pageCnt.pageNum eq status.index+1}"> --%>
											<%-- 													<strong class="active" style="line-height: 36px;padding: 0 13px">${status.index+1}</strong> --%>
											<%-- 												</c:when> --%>
											<%-- 												<c:otherwise> --%>
											<%-- 													<a title="${status.index+1}페이지보기" href="javascript:search('${status.index}')" pageNum="${status.index+1}">${status.index+1}</a> --%>
											<%-- 												</c:otherwise> --%>
											<%-- 											</c:choose> --%>
											<%-- 										</c:forEach> --%>
											<%-- 										<c:if test="${categoryCnt.totalCnt > 10*pageCnt.pageNum }"> --%>
											<!-- 											<li class="datatable-pagination-list-item datatable-hidden" -->
											<%-- 												onclick="location.href='adminAuction?pageNum=${pageNum + 1}'"> --%>
											<%-- 												<a href="javascript:search('${pageCnt.pageNum}')" class="datatable-pagination-list-item-link">›</a> --%>
											<!-- 											</li> -->
											<%-- 										</c:if> --%>
											<!-- 									</ul> -->
											<!-- 									</nav> -->
											<!-- 									</div> -->
											<!-- pagination  -->
										</div>
									</form>
								</div>
							</c:otherwise>


						</c:choose>
						<!-- 테이블 -->
					</div>
				</div>
		</div>
	</div>
	</main>
	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; IMOVIE 2023</div>
				<div></div>
			</div>
		</div>
	</footer>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
