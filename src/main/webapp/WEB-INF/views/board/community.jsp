<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니또</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css"rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/board.css"rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script src="resources/js/jquery-3.6.4.js"></script>
<%-- <link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet"> --%>

    <script>
 // 검색 함수
    function search() {
        var searchKeyword = document.getElementById("searchInput").value.toLowerCase();
        var tableRows = document.querySelectorAll("#board-table tr");

        for (var i = 1; i < tableRows.length; i++) { // i=0은 테이블 헤더이므로 건너뜁니다
            var title = tableRows[i].querySelector("td:nth-child(2)").innerText.toLowerCase();

            if (title.includes(searchKeyword)) {
                tableRows[i].style.display = ""; // 검색어가 포함된 제목을 가진 행을 표시합니다
            } else {
                tableRows[i].style.display = "none"; // 검색어가 포함되지 않은 제목을 가진 행은 숨깁니다
            }
        }
    }

    </script>
<style>
.comment-count {
	color: #999;
	margin-left: 5px;
}
</style>
<body>
	<jsp:include page="../nav.jsp" />

	<div class="container">
		<form id="iForm" class="form-container">
			<h2 class="tit">🍀 머니또 커뮤니티 🍀</h2>
			<div class="button-search-container">
				<!-- 글 등록 버튼 -->
				<div id="button-container">
					<button type="button" onclick="location.href='commBoardWrite'">글등록</button>
				</div>

				<!-- 검색 입력 박스와 검색 버튼 -->
				<div id="search-container">
					<input type="text" id="searchInput" name="searchKeyword"
						placeholder="검색어를 입력하세요">
					<button type="button" onclick="search()">검색</button>
				</div>
			</div>
			

			<table id="board-table">
				<tr>
					<th id="board-header">글번호</th>
					<th id="board-header">제목</th>
					<th id="board-header">작성자</th>
					<th id="board-header">날짜</th>
					<th id="board-header">조회수</th>
				</tr>
			    <%-- boardList를 반복하여 데이터를 출력 --%>
			    <c:forEach items="${boardList}" var="boardList">
			        <tr>
			            <td id="board-data">${boardList.comm_code}</td>
			           <td id="board-data">
   <div class="board-info">
      <a href="commBoardView?comm_code=${boardList.comm_code}" class="board-title">${boardList.comm_title}</a>
      <span class="comment-count">(${boardList.comment_count})</span>
   </div>
</td>
			            <td id="board-data">${boardList.member_id}</td>
			            <td id="board-data">${boardList.comm_date}</td>
			            <td id="board-data">${boardList.comm_count}</td>
			        </tr>
			    </c:forEach>
			</table>
		</form>
	</div>

	<jsp:include page="../footer.jsp" />

	<script>
		// 검색 함수
		function search() {
			var searchKeyword = document.getElementById("searchInput").value;
			// 검색 결과 페이지로 이동
			location.href = "검색결과URL?keyword=" + searchKeyword;
		}
	</script>
</body>

</html>