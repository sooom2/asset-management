<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>머니또</title>
</head>
<link
	href="${pageContext.request.contextPath }/resources/css/common.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc.css"
	rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css"
	rel="stylesheet">
<!-- 본문 -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css"
	rel="stylesheet">
<script type="text/javascript">

function search(idx) {
	idx = parseInt(idx);
	document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
	document.querySelector("input[name=startNum]").value = Number(idx)*10;
	document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
	let form = document.querySelector('#iForm');
	form.action = 'notice_board';
	form.method = 'post';
	form.submit();
}
</script>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container">
	<div id="con_wrap" style="width: 1200px">
		<div id="contents">
			<form id="iForm">
				<h2 class="tit">공지사항</h2>
				<div class="board-list-util">
					<p class="result-count">
						<strong>전체 <em class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</em>건
						</strong>
					</p>

					<div class="dropdown bootstrap-select" >
						<div class="form-floating mb-3 mb-md-0 selectbox" >
							<div class="cinema_name">
								<label for="cinema_name"></label>
								<select name="cinema_name" onchange="search('0');" style="margin-top: 0px; !important"> 
									<option value="전체공지" selected="selected" >전체공지</option>
									<c:forEach var="cinema" items="${cinemaList }">
										<option value="${cinema.cinema_name}" ${paramMap.cinema_name == cinema.cinema_name ? 'selected' : ''}>${cinema.cinema_name}</option>
									</c:forEach>
								</select>
								<c:forEach var="cinema" items="${cinemaList }">
									<input type="hidden" name="location_code"
										value="${cinema.get('location_code') }">
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="board-search">
						<input type="text" id="searchTxt" name="searchKeyword"  title="검색어를 입력해 주세요."
							placeholder="검색어를 입력해 주세요." class="input-text" value="${paramMap.searchKeyword}"
							maxlength="15">
						<button type="button" id="searchBtn" class="btn-search-input" onclick="search('0');">검색</button>
					</div>
				</div>

				<div class="table-wrap">
					<table class="board-list">
						<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
<%-- 						<colgroup> --%>
<%-- 							<col style="width: 70px;"> --%>
<%-- 							<col style="width: 180px;"> --%>
<%-- 							<col style="width: 400px;"> --%>
<%-- 							<col> --%>
<%-- 							<col style="width: 1px;"> --%>
<%-- 						</colgroup> --%>
						<thead>
							<tr>
								<th scope="col" style="width: 7%">번호</th>
								<th scope="col">극장</th>
								<th scope="col" style="width: 50%">제목</th>
								<th scope="col" style="width: 15%">등록일</th>
							</tr>
						</thead>
						<tbody>
							<input type="hidden" name="memberName" value="${paramMap.memberName}">
							<input type="hidden" name="memberTel" value="${paramMap.memberTel}">
							<input type="hidden" name="memberEmail" value="${paramMap.memberEmail}">
							<input type="hidden" name="startNum" value="${paramMap.startNum}">
							<input type="hidden" name="endNum" value="${paramMap.endNum}">
							<input type="hidden" name="pageNum" value="${paramMap.pageNum}">
							<input type="hidden" name="notice_board" value="">
							<input type="hidden" name="notice_code" value="">
							<c:forEach var="noticeBoard" items="${noticeBoardList }">
								<tr data-index="0">
									<td>${noticeBoard.rownum }</td>
									<td>${noticeBoard.cinema_name }</td>
									<td id="notice_subject"><a
										href="notice_detail?notice_code=${noticeBoard.notice_code }&prevNum=${noticeBoard.prevNum }&nextNum${noticeBoard.nextNum }">${noticeBoard.notice_subject }</a>
									</td>
									<td>${noticeBoard.notice_write_date }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- pagination -->
				<nav class="pagination">
						<c:if test="${1 < paramMap.pageNum }">
							<a title="처음 페이지 보기" href="javascript:search('0')" class="control first" pagenum="1">first</a>
							<a title="이전 페이지 보기" href="javascript:search('${paramMap.pageNum-2}')" class="control prev" pagenum="1">prev</a>
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
							<a title="이후 페이지 보기" href="javascript:search('${paramMap.pageNum}')" class="control next" pagenum="11">next</a> 
							<a title="마지막 페이지 보기" href="javascript:search('${paramMap.totalCnt/10 + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}')" class="control last" pagenum="586">last</a>
						</c:if>
					</nav>
				<!--// pagination -->
				</form>
			</div>	
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>