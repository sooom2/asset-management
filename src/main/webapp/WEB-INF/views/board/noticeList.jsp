<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니또</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/inc.css"
	rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/board.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="resources/js/jquery-3.6.4.js"></script>

<script>
  // 검색 함수
  function search() {
    var searchKeyword = document.getElementById("searchInput").value.toLowerCase();
    var tableRows = document.querySelectorAll("#board-table tr");

    var found = false; // 검색 결과 여부를 나타내는 변수

    for (var i = 1; i < tableRows.length; i++) { // i=0은 테이블 헤더이므로 건너뜁니다
      var title = tableRows[i].querySelector("td:nth-child(2)").innerText.toLowerCase();

      if (title.includes(searchKeyword)) {
        tableRows[i].style.display = ""; // 검색어가 포함된 제목을 가진 행을 표시합니다
        found = true;
      } else {
        tableRows[i].style.display = "none"; // 검색어가 포함되지 않은 제목을 가진 행은 숨깁니다
      }
    }
    // 엔터 키 이벤트 처리
    function handleEnterKey(event) {
      if (event.keyCode === 13) { 
        event.preventDefault(); 
        search(); 
      }
    }

    // 검색 결과가 없을 때 메시지를 표시합니다
    var noResultMessage = document.getElementById("noResultMessage");
    if (found) {
      noResultMessage.style.display = "none";
    } else {
      noResultMessage.style.display = "block";
    }
  }
  

  // 페이지 로드 시 URL에서 검색어 추출하여 검색 수행
  window.onload = function() {
    var urlParams = new URLSearchParams(window.location.search);
    var searchKeyword = urlParams.get('searchKeyword');
    if (searchKeyword) {
      document.getElementById("searchInput").value = decodeURIComponent(searchKeyword);
      search();
    }
  }
</script>

<style>
.comment-count {
	color: #999;
	margin-left: 5px;
}
.tit {
  position: relative;
  font-size: 27px;
  font-family: 'Arial', sans-serif;
  font-weight: bold;
  color: #303030;
  margin: 20px 0;
  text-align: center;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.emoji {
  font-size: 40px;
  color: #FFD700;
  margin-left: 3px;
}

@keyframes titleAnimation {
  0% {
    transform: scale(1.2);
  }
  50% {
    transform: scale(1);
  }
  100% {
    transform: scale(1.2);
  }
}

.tit {
  animation: titleAnimation 2s ease-in-out;
  animation-fill-mode: forwards;
}
</style>
<body>
	<jsp:include page="../nav.jsp" />

	<div class="container">
		<form id="iForm" class="form-container">
			<h2 class="tit">머니또 공지사항<span class="emoji">🍀</span></h2>
			<div class="button-search-container">
			

				<!-- 검색 입력 박스와 검색 버튼 -->
				<div id="search-container">
					<input type="text" id="searchInput" name="searchKeyword"
						placeholder="검색어를 입력하세요" onkeydown="handleEnterKey(event)">
					<button type="button" onclick="search()">검색</button>
				</div>
			</div>


			<table id="board-table">
				<tr>
					<th id="board-header">글번호</th>
					<th id="board-header">제목</th>
					<th id="board-header">날짜</th>
					<th id="board-header">조회수</th>
				</tr>
				<%-- boardList를 반복하여 데이터를 출력 --%>
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
						<td id="board-data">${boardList.formatted_date}</td>
						<td id="board-data">${boardList.comm_count}</td>
					</tr>
				</c:forEach>
			</table>
			 <p id="noResultMessage" style="display: none; color: red;">검색 결과가 없습니다.</p>
		</form>
	</div>

	<jsp:include page="../footer.jsp" />

	
</body>

</html>