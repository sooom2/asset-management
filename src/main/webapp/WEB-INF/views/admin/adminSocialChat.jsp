<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">

	function search(idx) {
		idx = parseInt(idx);
		document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
		document.querySelector("input[name=startNum]").value = Number(idx)*10;
		document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
		let form = document.querySelector('#iForm');
		form.action = 'admin_oneOnOne';
		form.method = 'post';
		form.submit();
	}


	function doDisplay() {

		let dis = document.querySelector(".admin-modal");

		if (dis.style.display = "none") {
			dis.style.display = "block"

		} else {
			dis.style.display = "none";
		}
	}

	function modalClose() {
		let dis = document.querySelector(".admin-modal");
		dis.style.display = "none";
	}
</script>
</head>
<body>
<jsp:include page="admin_nav2.jsp" />
	<div id="layoutSidenav">
		<!-- 고정  -->
		<jsp:include page="admin_nav.jsp" />
		<!-- 고정 -->

		<div id="layoutSidenav_content">

			<!-- 들어갈내용 -->
			<main>
				<!-- 모달 -->

				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">오픈채팅관리</h3>
					<form id="iForm">
					<div class="">
						<div class="selectbox searchbox"
							style="display: inline-block; float: right; margin-bottom: 25px; margin-top: -19px; width: 520px; padding-left: 11px;">
							<div class="cinema_name">
								<label for="cinema_name"></label>
								<select name="cinema_name" onchange="" style="margin-top: 0px; !important"> 
									<option value="전체공지" selected="selected" >#채팅 검색키워드#</option>
									<c:forEach var="cinema" items="${cinemaList }">
										<option value="${cinema.cinema_name}" ${paramMap.cinema_name == cinema.cinema_name ? 'selected' : ''}>${cinema.cinema_name}</option>
									</c:forEach>
								</select>
								<select name="rep_board" onchange="" style="margin-top: 0px; !important">
									<option value="전체" <c:if test="${paramMap.rep_board eq '전체'}">selected</c:if>>전체</option>
									<option value="답변완료" <c:if test="${paramMap.rep_board eq '답변완료'}">selected</c:if>>답변완료</option>
									<option value="미답변" <c:if test="${paramMap.rep_board eq '미답변'}">selected</c:if>>미답변</option>
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
					<div>
						<strong>전체 <em class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</em>건</strong>
					</div>
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 5%;"><a href="#"
									class="datatable-sorter">채팅코드</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">social#</a></th>
								<th data-sortable="true" style="width: 13%;"><a href="#"
									class="datatable-sorter">social#</a></th>
								<th data-sortable="true" style="width: 30%;"><a href="#"
									class="datatable-sorter">social#</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">social#</a></th>
								<th data-sortable="true" style="width: 20%;"><a href="#"
									class="datatable-sorter">social#</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">답글등록</a></th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<tbody>
<%-- 							<input type="hidden" name="memberName" value="${paramMap.memberName}"> --%>
<%-- 							<input type="hidden" name="memberTel" value="${paramMap.memberTel}"> --%>
<%-- 							<input type="hidden" name="memberEmail" value="${paramMap.memberEmail}"> --%>
<%-- 							<input type="hidden" name="startNum" value="${paramMap.startNum}"> --%>
<%-- 							<input type="hidden" name="endNum" value="${paramMap.endNum}"> --%>
<%-- 							<input type="hidden" name="pageNum" value="${paramMap.pageNum}"> --%>
<!-- 							<input type="hidden" name="table_name" value=""> -->
<!-- 							<input type="hidden" name="code" value=""> -->
							<c:forEach var="oneBoard" items="${oneBoardList }">
								<tr>
									<td>${oneBoard.rownum }</td>
									<td>${oneBoard.one_name }</td>
									<td>${oneBoard.cinema_name }</td>
									<td>${oneBoard.one_subject }</td>
									<td>${oneBoard.one_rep_board }</td>
									<td>${oneBoard.one_write_date }</td>
									<td class="modi"><input class="btn btn-block btn-more"
										type="button" value="M O R E" onclick="location.href='admin_one_rep?one_code=${oneBoard.one_code }'"></td>
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
										<strong class="active">${status.index+1}</strong>
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
</body>
</html>
