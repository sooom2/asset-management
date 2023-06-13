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
<link href="${pageContext.request.contextPath }/resources/css/adminAuction.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$("#file").on('change',function(){
			  var fileName = $("#file").val();
			  $(".upload-name").val(fileName);
		});
	});

	function search(idx) {
		idx = parseInt(idx);
		document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
		document.querySelector("input[name=startNum]").value = Number(idx)*10;
		document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
		let form = document.querySelector('#iForm');
		form.action = 'adminAuction';
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
<style type="text/css">
.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
#submitBtn {
    margin: auto;
    display: block;
    width: 50%;
}

input[type=radio] {
	height: 12px !important;
}

</style>
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
				<!-- 모달 -->
				<div class="regist_container">
					<div class="content">
						<form action="auction_regist" class="myForm" method="post" enctype="multipart/form-data" style="width: 1000px;">
						<h4 style="text-align: center;">경매 등록</h4><hr>
								<div>
									<div style="display:inline-block ;width: 900px;">
										<div style="display:inline-block;width: 49%;">
											<label for="auction_type" style="display: inline-block;width: 118px;">경매 타입</label>
											<div style="display: inline-block;height: 33px;width: 236px;text-align: center;border: 1px solid #a7a7a7;line-height: 30px;">
												<input type="radio" name="auction_type" value="실시간 경매" checked="checked">실시간 경매&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="auction_type" value="기간 경매">기간 경매
											</div>
										</div>
										<div style="display:inline-block;width: 50%;">
											<label for="auction_category" style=" width: 80px;">카테고리</label>
											<select name="auction_category" style="width: 240px;height: 33px;">
												<option value="">항목선택</option>
												<option value="의류">의류</option>
												<option value="시계/쥬얼리">시계/쥬얼리</option>
												<option value="디지털/가전">디지털/가전</option>
												<option value="스포츠/레저">스포츠/레저</option>
												<option value="차량/오토바이">차량/오토바이</option>
											</select>
										</div>
									</div>
							
									<div>
										<label for="auction_name">상품명</label>
										<input type="text" name="auction_item_name" required="" placeholder="상품명을 입력하세요." style="width: 649px;">
									</div>
									<div class="form-group">
									    <label for="comments">상품 설명</label>
									    <textarea name="auction_content" maxlength="500"></textarea>
									</div>
								<div style="display: inline-block;width: 900px;"> 
									<div style="display: inline-block;    width: 445px;">
										<label for="customer_name">시작가</label>
										<input type="text" name="auction_present_price" required="" placeholder="시작가를 입력하세요." style="width: 270px;">
									</div>
									<div style="display: inline-block;  width: 50%;">
										<label for="customer_name">즉시 구매가</label>
										<input type="text" name="auction_immediate_price" required="" placeholder="즉시 구매가를 입력하세요." style="width: 200px">
									</div>
								</div>
								<div style="display: inline-block;width: 100%"> 
									<div style="display: inline-block;width: 445px;">
										<label for="customer_name">시작일</label>
										<input type="datetime-local" name="auction_start_date" required="required" style=" width: 271px;">
									</div>
									<div style="display: inline-block;">
										<label for="customer_name">종료일</label>
										<input type="datetime-local" name="auction_end_date" required="required" style="width: 201px;">
									</div>
								</div>
								<div class="form-group">
								    <label for="comments">공지사항</label>
								    <textarea name="auction_notice" maxlength="500"></textarea>
								</div>
								<div style="display: inline-block;width: 100%">
									<label for="customer_name" style="display: inline-block;width: 121px;">이미지 등록</label>
									<div class="filebox" style="display: inline-block;    height: 80px;    width: 645px;">
									    <input class="upload-name" value="첨부파일" placeholder="상품 이미지를 등록하세요." style="width: 483px;">
									    <label for="file" style="display: inline-block;  width: 150px;line-height: 20px; text-align: center; padding-left: 18px;">파일찾기</label> 
									    <input type="file" name="file" id="file">
									</div>
								</div>
								<div>
									<input id="submitBtn" type="submit" value="등록" style="border: 1px solid #8d8d8d;margin-left: 124px;width: 645px;">
								</div>
							</div>
						</form>
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
								<th data-sortable="true" style="width: 30%;"><a href="#"
									class="datatable-sorter">제목</a></th>
								<th data-sortable="true" style="width: 13%;"><a href="#"
									class="datatable-sorter">경매상태</a></th>
<!-- 								<th data-sortable="true" style="width: 30%;"><a href="#" -->
<!-- 									class="datatable-sorter">작성자</a></th> -->
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">작성일자</a></th>
<!-- 								<th data-sortable="true" style="width: 20%;"><a href="#" -->
<!-- 									class="datatable-sorter">freeBoard#</a></th> -->
								<th data-sortable="true" style="width: 8%;"><a href="#"
									class="datatable-sorter">버튼</a></th>
							</tr>
						</thead>
						<!-- 회원목록 -->
						<tbody>
							<c:forEach var="auction" items="${auction }">
								<tr>
									<td>${auction.rownum }</td>
									<td>${auction.auction_item_name }</td>
									<td>${auction.auction_type }</td>
<%-- 									<td>${oneBoard.one_subject }</td> --%>
									<td>${auction.auction_date }</td>
<%-- 									<td>${oneBoard.one_write_date }</td> --%>
									<td class="modi"><input class="btn btn-block btn-more"
										type="button" value="M O R E" onclick="location.href='admin_one_rep?one_code=${auction.auction_code }'"></td>
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
										onclick="location.href='adminAuction?pageNum=${pageNum - 1}'">
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
