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
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	function search(idx) {
		idx = parseInt(idx);
		document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
		document.querySelector("input[name=startNum]").value = Number(idx)*10;
		document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
		let form = document.querySelector('#iForm');
		form.action = 'admin_notice_board';
		form.method = 'post';
		form.submit();
	}
	
	function modalClose() {
		let dis = document.querySelector(".modal");
		let dis2 = document.querySelector(".admin-modal-update");
		dis.style.display = "none";
		dis2.style.display = "none";
	}

	function doDisplay(${noticeBoard.notice_code}) {

		let dis2 = document.querySelector(".admin-modal-update");

		if (dis2.style.display = "none") {
			dis2.style.display = "block"

		} else {
			dis2.style.display = "none";
		}
	}

	function doNoticeRegister() {

		let dis = document.querySelector(".admin-modal-register");

		if (dis.style.display = "none") {
			dis.style.display = "block"

		} else {
			dis.style.display = "none";
		}
	}
	
		
</script>
</head>
<body>
<jsp:include page="admin_nav_top.jsp" />
	<div id="layoutSidenav">
		<!-- 고정  -->
		<jsp:include page="admin_nav_side.jsp" />
		
		
		<!-- 고정 -->
		<div id="layoutSidenav_content">
			
			<!-- 들어갈내용 -->
			<main>
				<!-- 등록 모달 -->
				<div class="container modal admin-modal-register"
					style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header">
									<button type="button" class="close-modal"
										onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">공지사항 등록</h3>
								</div>
								<div class="row justify-content-center">
									<div class="col-lg-7" style="width: 700px">
										<div class="card-body">
											<form action="notice_register_pro">
												<div class="row mb-3">
													<div>
														<div class="form-floating mb-3 mb-md-0 ">
															<input class="form-control" id="notice_subject"
																name="notice_subject" type="text" value="" /> <label
																for="notice_subject">제목</label>
														</div>
													</div>
												</div>
												<div class="row mb-3">
													<div class="dropdown bootstrap-select">
														<div class="form-floating mb-3 mb-md-0 selectbox">
															<div class="cinema_name">
																<label for="cinema_name">문의지점 : </label> 
																<select name="cinema_name" onchange="selectCinema()"
																	style="margin-top: 0px; !important">
																	<option value="none" selected="selected" disabled>선택</option>
																	<option value="none" disabled>=======================</option>
																	<option value="전체공지">전체공지</option>
																	<c:forEach var="cinema" items="${cinemaList }">
																		<option value="${cinema.get('cinema_name') }">${cinema.get("cinema_name")}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
												</div>

												<hr>
												<div class="row mb-3">
													<div class="form-floating mb-3 mb-md-0 text">
														<div>
															<textarea name="notice_content" class="form-control"
																id="notice_content" placeholder="내용" rows="10"></textarea>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="mt-4 mb-0 ">
														<div class="d-grid">
															<input class="btn btn-primary btn-block" type="submit"
																value="등록">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">공지사항</h3>
					<form id="iForm">
					<div class="">
						<div class="selectbox searchbox"
							style="display: inline-block; float: right; margin-bottom: 25px; margin-top: -19px; width: 460px; padding-left: 11px;">
							<div class="cinema_name">
								<label for="cinema_name"></label>
								<select name="cinema_name" onchange="" style="margin-top: 0px; !important"> 
									<option value="전체공지" selected="selected" >전체공지</option>
									<c:forEach var="cinema" items="${cinemaList }">
										<option value="${cinema.cinema_name}" ${paramMap.cinema_name == cinema.cinema_name ? 'selected' : ''}>${cinema.cinema_name}</option>
									</c:forEach>
								</select>
								<c:forEach var="cinema" items="${cinemaList }">
									<input type="hidden" name="location_code"
										value="${cinema.get('location_code') }">
								</c:forEach>
								<input class="datatable-input" value="${param.searchKeyword }" name="searchKeyword" type="search" 
								placeholder="검색어를 입력해 주세요." aria-controls="datatablesSimple" style="width: 210px;">
								<input class="btn btn-block btn-more" type="button" value="검색" onclick="search('0');"
									style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;">
							</div>
						</div>
					</div>
					<input class="btn btn-block btn-more" type="button" value="공지등록" onclick="doNoticeRegister()">
					<div>
						<strong>전체 <em class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</em>건</strong>
					</div>
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 7%;"><a href="#"
									class="datatable-sorter">공지번호</a></th>
								<th data-sortable="true" style="width: 40%;"><a href="#"
									class="datatable-sorter">제목</a></th>
								<th data-sortable="true" style="width: 20%;"><a href="#"
									class="datatable-sorter">일자</a></th>
								<th data-sortable="true" style="width: 7%;"><a href="#"
									class="datatable-sorter">수정/삭제</a></th>
							</tr>
						</thead>	
						
						<tbody>
		
							<c:forEach var="noticeList" items="${noticeList }">
								<tr data-index="0">
									<td>${noticeList.notice_no }</td>
									<td>${noticeList.notice_subject }</td>
									<td>${noticeList.notice_date }</td>
									<td>
										<input type="button" value="수정/삭제">
									
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- pagination  -->
						<div class="datatable-bottom">
						<nav class="datatable-pagination">
						<ul class="datatable-pagination-list">
							<c:if test="${1 < paramMap.pageNum }">
									<li class="datatable-pagination-list-item datatable-hidden"
										onclick="location.href='admin_schedule_register?pageNum=${pageNum - 1}'">
										<a href="javascript:search('${paramMap.pageNum-2}')" class="datatable-pagination-list-item-link" pagenum="1">‹</a>
									</li>
							</c:if>
							<c:forEach begin="${paramMap.pageNum-paramMap.pageNum%10}" end="${(paramMap.totalCnt == null ? 1 : paramMap.totalCnt/10) + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}" varStatus="status">
								<c:choose>
									<c:when test="${paramMap.pageNum eq status.index+1}">
										<strong class="active" style="line-height: 36px;padding: 0 13px">${status.index+1}</strong>
									</c:when>
									<c:otherwise>
										<a title="${status.index+1}페이지보기" href="javascript:search('${status.index}')" pageNum="${status.index+1}">${status.index+1}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${paramMap.totalCnt > 10*paramMap.pageNum }">
								<li class="datatable-pagination-list-item datatable-hidden"
									onclick="location.href='admin_schedule_register?pageNum=${pageNum + 1}'">
									<a href="javascript:search('${paramMap.pageNum}')" class="datatable-pagination-list-item-link">›</a>
								</li>
							</c:if>
						</ul>
						</nav>
						</div>
						<!-- pagination  -->
					</form>
				</div>
				<!-- 테이블 -->

			</main>




			<!--들어갈내용 -->

			<!-- 푸터 -->
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
	
<!-- 	페이징 처리   밑에 다시 컨트롤러 갔다와야 함 -->
	<c:choose>
		<c:when test="${empty param.pageNum }">
			<c:set var="pageNum" value="1" />
		</c:when>
		<c:otherwise>
			<c:set var="pageNum" value="${param.pageNum }" />
		</c:otherwise>
	</c:choose>
	<section id="listForm">
		<table>
			<%-- JSTL 과 EL 활용하여 글목록 표시를 위한 반복문 작성 - <c:forEach> --%>
			<c:forEach var="board" items="${boardList }">
				<tr>
					<%-- 제목에 하이퍼링크 추가(BoardDetail.bo) => 글번호(board_num), 페이지번호(pageNum) 전달 --%>
					<td id="subject">
						<a href="BoardDetail.bo?board_num=${board.board_num }&pageNum=${pageNum}">${board.board_subject }</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<section id="pageList">
		
	
	
		<%--
		현재 페이지번호(pageNum) 가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소에 pageNum - 1 값을 파라미터로 전달 
		--%>
		<c:choose>
			<c:when test="${pageNum > 1 and empty param.searchKeyword }">
				<input type="button" value="이전" onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'">
			</c:when>
			<c:when test="${pageNum > 1 and not empty param.searchKeyword}">
				<input type="button" value="이전" onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>
		
		<%-- 페이지번호 목록은 시작페이지(startPage) 부터 끝 페이지(endPage) 까지 표시 --%>
		<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<%-- 페이지번호 하이퍼링크 설정 => 페이지번호를 pageNum 파라미터로 전달 --%>
			<%-- 단, 현재 페이지번호는 하이퍼링크 없이 표시 --%>
			<c:choose>
				<c:when test="${pageNum eq num }"> <%-- 현재 페이지 번호일 경우 --%>
					<b>${num }</b>
				</c:when>
				<c:when test="${pageNum ne num and empty param.searchKeyword}">
					<a href="BoardList.bo?pageNum=${num }">${num }</a>
				</c:when>
				<c:when test="${pageNum ne num and not empty param.searchKeyword}">
					<a href="BoardList.bo?pageNum=${num }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }">${num }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<%--
		현재 페이지번호(pageNum) 가 최대 페이지 번호(maxPage) 보다 작을 경우에만 [다음] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소에 pageNum + 1 값을 파라미터로 전달 
		--%>
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage and empty param.searchKeyword}">
				<input type="button" value="다음" onclick="location.href='BoardList.bo?pageNum=${pageNum + 1}'">
			</c:when>
			<c:when test="${pageNum < pageInfo.maxPage and not empty param.searchKeyword}">
				<input type="button" value="다음" onclick="location.href='BoardList.bo?pageNum=${pageNum + 1}&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
		
	</section>
</body>
</html>
