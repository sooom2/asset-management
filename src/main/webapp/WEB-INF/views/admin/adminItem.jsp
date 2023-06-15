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
<link href="${pageContext.request.contextPath }/resources/css/adminItem.css" rel="stylesheet" />
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
		form.action = 'adminItem';
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
	
	function reportStatus(item_code, report_targetId, repId) {
		console.log(item_code + report_targetId + repId);
		location.href="adminItemReport?item_code="+item_code+"&report_targetId="+report_targetId+"&repId="+repId;
		console.log(item_code + report_targetId + repId);
	}
	
</script>
</head>
<body>
<c:if test="${sessionScope.sId  ne 'admin' }">
	<script type="text/javascript">
		location.href = "./";
	</script>
</c:if>
<jsp:include page="admin_nav_top.jsp" />
	<div id="layoutSidenav">
		<!-- 고정  확인  -->
		<jsp:include page="admin_nav_side.jsp" />
		<!-- 고정 -->

		<div id="layoutSidenav_content">

			<!-- 들어갈내용 -->
			<main>
					
				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">거래 물품 신고 상황</h3>
					
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
									<option value="판매중" <c:if test="${pageCnt.typeSelect eq '판매중'}">selected</c:if>>판매중</option>
									<option value="거래중" <c:if test="${pageCnt.typeSelect eq '거래중'}">selected</c:if>>거래중</option>
									<option value="거래완료" <c:if test="${pageCnt.typeSelect eq '거래완료'}">selected</c:if>>거래완료</option>
								</select>
								<input class="datatable-input" value="${pageCnt.searchKeyword }" name="searchKeyword" type="search" 
								placeholder="검색어를 입력해 주세요." aria-controls="datatablesSimple" style="width: 210px;">
								<input class="btn btn-block btn-more" type="button" value="검색" onclick="search('0');"
									style="height: 32px; line-height: 16px; margin-bottom: 5px; background-color: #ffffff;">
							</div>
						</div>
					</div>
					<div>
						<strong>전체 <em class="font-gblue">${pageCnt.totalCnt == null ? 0 : pageCnt.totalCnt}</em>건</strong>
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
								<th data-sortable="true" style="width: 5%;"><a href="#"
									class="datatable-sorter">글번호</a></th>
								<th data-sortable="true" style="width: 20%;"><a href="#"
									class="datatable-sorter">상품이름</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">상품등록자ID</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">거래상태</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">신고자</a></th>
								<th data-sortable="true" style="width: 18%;"><a href="#"
									class="datatable-sorter">신고내용</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">신고횟수</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">처리상황</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">신고처리</a></th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<tbody>
							<c:forEach var="adminItem" items="${adminItem }">
								<tr>
									<td>${adminItem.rownum }</td>
									<td>${adminItem.item_subject }</td>
									<td>${adminItem.report_targetId }</td>
									<td>${adminItem.item_status }</td>
									<td>${adminItem.repId }</td>
									<td>${adminItem.report_content }</td>
									<td>${adminItem.rep_cnt }</td>
									<td>${adminItem.report_statusYN }</td>
									<td class="modi">
										<input class="btn btn-block btn-more"
										type="button" value="처리" onclick="reportStatus('${adminItem.item_code }','${adminItem.report_targetId }','${adminItem.repId }')">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- pagination  -->
						<div class="datatable-bottom">
						<nav class="datatable-pagination">
						<ul class="datatable-pagination-list">
							<c:if test="${1 < pageCnt.pageNum }">
									<li class="datatable-pagination-list-item datatable-hidden"
										onclick="location.href='adminItem?pageNum=${pageNum - 1}'">
										<a href="javascript:search('${pageCnt.pageNum-2}')" class="datatable-pagination-list-item-link" pagenum="1">‹</a>
									</li>
							</c:if>
							<c:forEach begin="${pageCnt.pageNum-pageCnt.pageNum%10}" end="${(pageCnt.totalCnt == null ? 1 : pageCnt.totalCnt/10) + (pageCnt.totalCnt%10> 0 ? 1 : 0) -1}" varStatus="status">
								<c:choose>
									<c:when test="${pageCnt.pageNum eq status.index+1}">
										<strong class="active" style="line-height: 36px;padding: 0 13px">${status.index+1}</strong>
									</c:when>
									<c:otherwise>
										<a title="${status.index+1}페이지보기" href="javascript:search('${status.index}')" pageNum="${status.index+1}">${status.index+1}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageCnt.totalCnt > 10*pageCnt.pageNum }">
								<li class="datatable-pagination-list-item datatable-hidden"
									onclick="location.href='adminItem?pageNum=${pageNum + 1}'">
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
