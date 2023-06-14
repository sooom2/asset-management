 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-black mb-4">
								<div class="card-body font20">
									수익률<br>
									
<!-- 								혼합 시작	============================================================== -->
									<div>
									    <canvas id="mixedChart"></canvas>
									</div>
									
									<script>
										var list = ${jsonArray};
										console.log(list);
										
										var date1 = new Date.now();
// 										var date2 = new Date(now());
										console.log(date1);
										
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
									            labels: [list[6].date , list[5].date, list[4].date, list[3].date, list[2].date, list[1].date, list[0].date],
									            datasets: [{
									                label: 'Sales',
									                data: [50, 60, 70, 80, 20, 40, 20],
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
									        data: [70, 70, 70, 70, 70, 70],
									        borderColor: 'rgba(255, 99, 132, 1)',
									        fill: false
									    });
									</script>
<!-- 								혼합 끝	============================================================== -->

									
								</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-black stretched-link" href="resList">더보기</a>
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
							<div class="card bg-primary text-black mb-4">
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
									<a class="small text-black stretched-link" href="resList">더보기</a>
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
							<div class="card bg-primary text-black mb-4">
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
									<a class="small text-black stretched-link" href="resList">더보기</a>
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
					<div class="datatable-container">
						<h3 class="text-center font-weight-light my-4">경매품목관리</h3>
						
						<form id="iForm" >
						<div class="">
							<div class="selectbox searchbox"
								style="display: inline-block; float: right; margin-bottom: 25px; margin-top: -19px; width: 520px; padding-left: 11px;">
								<div class="cinema_name">
									<label for="cinema_name"></label>
	<!-- 								<select name="cinema_name" onchange="" style="margin-top: 0px; !important">  -->
	<!-- 									<option value="전체" selected="selected" >전체</option> -->
	<%-- 									<c:forEach var="cinema" items="${cinemaList }"> --%>
	<%-- 										<option value="${cinema.cinema_name}" ${pageCnt.cinema_name == cinema.cinema_name ? 'selected' : ''}>${cinema.cinema_name}</option> --%>
	<%-- 									</c:forEach> --%>
	<!-- 								</select> -->
									<select name="typeSelect" onchange="" style="margin-top: 0px; !important">
										<option value="전체" <c:if test="${pageCnt.typeSelect eq '전체'}">selected</c:if>>전체</option>
										<option value="경매 완료" <c:if test="${pageCnt.typeSelect eq '경매 완료'}">selected</c:if>>경매 완료</option>
										<option value="실시간 경매" <c:if test="${pageCnt.typeSelect eq '실시간 경매'}">selected</c:if>>실시간 경매</option>
										<option value="기간 경매" <c:if test="${pageCnt.typeSelect eq '기간 경매'}">selected</c:if>>기간 경매</option>
									</select>
									<input class="datatable-input" value="${pageCnt.searchKeyword }" name="searchKeyword" type="search" 
									placeholder="검색어를 입력해 주세요." aria-controls="datatablesSimple" style="width: 210px;">
									<input class="btn btn-block btn-more" type="button" value="검색" onclick="search('0');"
										style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;">
								</div>
							</div>
						</div>
						<div>
							<strong>전체 <em class="font-gblue">${categoryCnt.totalCnt == null ? 0 : categoryCnt.totalCnt}</em>건</strong>
						</div>
	<%-- 				<input type="hidden" name="memberName" value="${pageCnt.memberName}"> --%>
	<%-- 				<input type="hidden" name="memberTel" value="${pageCnt.memberTel}"> --%>
	<%-- 				<input type="hidden" name="memberEmail" value="${pageCnt.memberEmail}"> --%>
						<input type="hidden" name="startNum" value="${pageCnt.startNum}">
						<input type="hidden" name="endNum" value="${pageCnt.endNum}">
						<input type="hidden" name="pageNum" value="${pageCnt.pageNum}">
	<!-- 				<input type="hidden" name="table_name" value=""> -->
	<!-- 				<input type="hidden" name="code" value=""> -->
						<table id="datatablesSimple" class="datatable-table">
							<thead>
								<tr>
									<th data-sortable="true" style="width: 10%;">
										<a href="#" class="datatable-sorter">번호</a>
									</th>
									<th data-sortable="true" style="width: 10%;">
										<a href="#" class="datatable-sorter">코드</a>
									</th>
									<th data-sortable="true" style="width: 10%;">
										<a href="#" class="datatable-sorter">카테고리</a>
									</th>
									<th data-sortable="true" style="width: 10%;">
										<a href="#" class="datatable-sorter">구매자</a>
									</th>
									<th data-sortable="true" style="width: 10%;">
										<a href="#" class="datatable-sorter">날짜</a>
									</th>
									<th data-sortable="true" style="width: 10%;">
										<a href="#" class="datatable-sorter">카테고리별 수</a>
									</th>
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
						<!-- pagination  -->
							<div class="datatable-bottom">
							<nav class="datatable-pagination">
							<ul class="datatable-pagination-list">
								<c:if test="${1 < pageCnt.pageNum }">
										<li class="datatable-pagination-list-item datatable-hidden"
											onclick="location.href='adminAuction?pageNum=${pageNum - 1}'">
											<a href="javascript:search('${pageCnt.pageNum-2}')" class="datatable-pagination-list-item-link" pagenum="1">‹</a>
										</li>
								</c:if>
								<c:forEach begin="${pageCnt.pageNum-pageCnt.pageNum%10}" end="${(categoryCnt.totalCnt == null ? 1 : categoryCnt.totalCnt/10) + (categoryCnt.totalCnt%10> 0 ? 1 : 0) -1}" varStatus="status">
									<c:choose>
										<c:when test="${pageCnt.pageNum eq status.index+1}">
											<strong class="active" style="line-height: 36px;padding: 0 13px">${status.index+1}</strong>
										</c:when>
										<c:otherwise>
											<a title="${status.index+1}페이지보기" href="javascript:search('${status.index}')" pageNum="${status.index+1}">${status.index+1}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${categoryCnt.totalCnt > 10*pageCnt.pageNum }">
									<li class="datatable-pagination-list-item datatable-hidden"
										onclick="location.href='adminAuction?pageNum=${pageNum + 1}'">
										<a href="javascript:search('${pageCnt.pageNum}')" class="datatable-pagination-list-item-link">›</a>
									</li>
								</c:if>
							</ul>
							</nav>
							</div>
							<!-- pagination  -->
						</form>
					</div>
					<!-- 테이블 -->
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
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
