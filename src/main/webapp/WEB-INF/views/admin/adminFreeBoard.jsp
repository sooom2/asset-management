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

				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">커뮤니티</h3>
					<form id="iForm">
					<div class="">
						<div class="selectbox searchbox"
							style="display: inline-block; float: right; margin-bottom: 25px; margin-top: -19px; width: 460px; padding-left: 11px;">
							<div class="cinema_name">
								<label for="cinema_name"></label>
								<select name="cinema_name" onchange="" style="margin-top: 0px; !important"> 
									<option value="커뮤니티" selected="selected" >커뮤니티</option>
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
					<div>
						<strong>전체 <em class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</em>건</strong>
					</div>
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 5%;"><a href="#"
									class="datatable-sorter">글번호</a></th>
								<th data-sortable="true" style="width: 20%;"><a href="#"
									class="datatable-sorter">제목</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">작성자</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">작성일</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#"
									class="datatable-sorter">수정/삭제</a></th>
							</tr>
						</thead>
						
						<tbody>
								<c:forEach items="${boardList}" var="boardList" varStatus="loop">
									<tr>
										<td id="board-data">${loop.index + 1}</td>
										<td id="board-data">
											<div class="board-info">
												<a href="commBoardView?comm_code=${boardList.comm_code}"
													class="board-title">${boardList.comm_title}</a> <span
													class="comment-count">(${boardList.comment_count})</span>
											</div>
										</td>
										<td id="board-data">${boardList.member_id}</td>
										<td id="board-data">${boardList.formatted_date}</td>
										<td id="board-data"><input type="button" value="수정/삭제"></td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
				
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
						<div class="text-muted">Copyright &copy; MONEYTTO 2023</div>
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
