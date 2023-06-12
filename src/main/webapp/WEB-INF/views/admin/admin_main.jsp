 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>

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
									
<!-- 								막대	============================================================== -->
									<div>
									  <canvas id="barChart"></canvas>
									</div>
									
									<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
									
									<script>
									  const ctx = document.getElementById('barChart');
									
									  new Chart(ctx, {
									    type: 'bar',
									    data: {
									      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange', 'Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
									      datasets: [{
									        label: '# of Votes',
									        data: [12, 19, 3, 5, 2, 3, 12, 19, 3, 5, 2, 3],
									        borderWidth: 1
									      }]
									    },
									    options: {
									      scales: {
									        y: {
									          beginAtZero: true
									        }
									      }
									    }
									  });
									</script>
<!-- 								막대끝	============================================================== -->

									
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
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-black mb-4">
								<div class="card-body font20">
									스토어 주문<br> <span class="fontB">${payCount }</span> 건
									
<!-- 								라인시작	============================================================== -->		
									<div style="width:100%;">
									  <canvas id="lineChart"></canvas>
									</div>
									
									<script>
									new Chart(document.getElementById("lineChart"), {
									    type: 'line',
									    data: {
									        labels: ['1', '2', '3', '4', '5', '6', '7'],
									        datasets: [{
									            label: '테스트 데이터셋',
									            data: [
									                10,
									                3,
									                30,
									                23,
									                10,
									                5,
									                50
									            ],
									            borderColor: "rgba(255, 201, 14, 1)",
									            backgroundColor: "rgba(255, 255, 255, 0)",
									            fill: true,
									            lineTension: 0
									        }]
									    },
									    options: {
									        responsive: true,
									        title: {
									            display: true,
									            text: '라인 차트 테스트'
									        },
									        tooltips: {
									            mode: 'index',
									            intersect: false,
									        },
									        hover: {
									            mode: 'nearest',
									            intersect: true
									        },
									        scales: {
									            xAxes: [{
									                display: true,
									                scaleLabel: {
									                    display: true,
									                    labelString: 'x축'
									                }
									            }],
									            yAxes: [{
									                display: true,
									                ticks: {
									                    suggestedMin: 0,
									                },
									                scaleLabel: {
									                    display: true,
									                    labelString: 'y축'
									                }
									            }]
									        }
									    }
									});
									
									</script>						
<!-- 								라인 끝	============================================================== -->									
								
								
								</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-black stretched-link" href="admin_item_pay">더보기</a>
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
					<div class="card mb-4">
						<div class="card-header">
							<svg class="svg-inline--fa fa-table me-1" aria-hidden="true"
								focusable="false" data-prefix="fas" data-icon="table" role="img"
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
								data-fa-i2svg="">
								<path fill="currentColor"
									d="M64 256V160H224v96H64zm0 64H224v96H64V320zm224 96V320H448v96H288zM448 256H288V160H448v96zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z"></path>
							</svg>
							회원정보
						</div>
						<div class="card-body">
							<div
								class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
								<div class="datatable-top">
									<div class="datatable-search" style="width: 348px;float: left;display: inline-block;">
										<form action="admin">
											<input class="datatable-input" placeholder="회원정보를 입력하세요" value="${param.searchKeyword }" name="searchKeyword" type="search" title="Search within table" aria-controls="datatablesSimple" style="width: 210px;">
											 <input type="submit" value="검색" />
											<input type="button" value="전체보기" onclick="location.href='admin'">
										</form>
									</div>
								</div>
								<!-- 회원정보 테이블 -->
								<div class="datatable-container">
									<table id="datatablesSimple" class="datatable-table">
										<thead>
											<tr>
												<th data-sortable="true" style="width: 10%;"><a
													href="#" class="datatable-sorter">아이디</a></th>
												<th data-sortable="true" style="width: 10%;"><a
													href="#" class="datatable-sorter">이름</a></th>
												<th data-sortable="true" style="width: 10%;"><a
													href="#" class="datatable-sorter">이메일</a></th>
												<th data-sortable="true" style="width: 10%;">
													<a href="#" class="datatable-sorter">휴대폰번호</a>
												</th>
												<th data-sortable="true" style="width: 10%;">
													<a href="#" class="datatable-sorter">포인트</a>
												</th>
												<th data-sortable="true" style="width: 10%;">
													<a href="#" class="datatable-sorter">선호지점</a>
												</th>
												<th data-sortable="true" style="width: 10%;">
													<a href="#" class="datatable-sorter">선호장르</a>
												</th>
												<th data-sortable="true" style="width: 10%;">
													<a href="#" class="datatable-sorter">가입일자</a>
												</th>
											</tr>
										</thead>
										<!-- 회원목록 -->
										<c:forEach var="member" items="${memberList }">
											<tbody>
												<tr data-index="0">
													<td>${member.get("member_id") }</td>
													<td>${member.get("member_name") }</td>
													<td>${member.get("member_email") }</td>
													<td>${member.get("member_tel") }</td>
													<td>${member.get("member_point") }</td>
													<td>${member.get("member_prefer_branch") }</td>
													<td>${member.get("member_prefer_genre") }</td>
													<td>${member.get("member_date") }</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
								<!-- 페이징처리 -->
								<div class="datatable-bottom">
									<nav class="datatable-pagination">
										<ul class="datatable-pagination-list">
											<c:choose>
												<c:when test="${empty param.pageNum }">
													<c:set var="pageNum" value="1" />
												</c:when>
												<c:otherwise>
													<c:set var="pageNum" value="${param.pageNum }"></c:set>
												</c:otherwise>
											</c:choose>

											<!-- 							 datatable-disabled -->
											<c:choose>
												<c:when test="${pageNum > 1 }">
													<li class="datatable-pagination-list-item datatable-hidden"
														onclick="location.href='admin?pageNum=${pageNum - 1}'">
														<a data-page="${pageNum } class="datatable-pagination-list-item-link">‹</a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="datatable-pagination-list-item datatable-hidden">
														<a data-page="${pageNum } class="datatable-pagination-list-item-link">‹</a>
													</li>
												</c:otherwise>
											</c:choose>
											<c:forEach var="num" begin="${pageInfo.startPage }"
												end="${pageInfo.endPage }">
												<c:choose>
													<c:when test="${pageNum eq num }">
														<%-- 현재 페이지 번호일 경우 --%>
														<li class="datatable-pagination-list-item "><a
															class="datatable-pagination-list-item-link"
															style="background-color: #ececec">${num }</a>
													</c:when>
													<%--페이지번호 --%>
													<c:when test="${pageNum ne num and empty param.searchKeyword }">
														<a href="admin?pageNum=${num }">${num }</a>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${pageNum < pageInfo.maxPage }">
													<li class="datatable-pagination-list-item datatable-hidden"
														onclick="location.href='admin?pageNum=${pageNum + 1}'">
														<a data-page="${pageNum } class="datatable-pagination-list-item-link">›</a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="datatable-pagination-list-item datatable-hidden">
														<a data-page="${pageNum } class="datatable-pagination-list-item-link">›</a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
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
