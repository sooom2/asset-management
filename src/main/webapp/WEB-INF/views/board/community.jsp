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
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">

<body>
	<jsp:include page="../nav.jsp" />
	<form id="iForm">
    <h2 class="tit">머니또 커뮤니티</h2>
    <table>
        <tr>
            <th id="board-header">글번호</th>
            <th id="board-header">제목</th>
            <th id="board-header">작성자</th>
            <th id="board-header">날짜</th>
            <th id="board-header">조회수</th>
        </tr>
        <%-- 예시 데이터 --%>
        <tr>
            <td id="board-data">1</td>
            <td id="board-data"><a href="글상세페이지URL">게시글 제목</a></td>
            <td id="board-data">작성자 이름</td>
            <td id="board-data">2023-06-01</td>
            <td id="board-data">100</td>
        </tr>
        <tr>
            <td id="board-data">2</td>
            <td id="board-data"><a href="글상세페이지URL">게시글 제목</a></td>
            <td id="board-data">작성자 이름</td>
            <td id="board-data">2023-05-31</td>
            <td id="board-data">50</td>
        </tr>
        <%-- 여기에 반복문을 통해 실제 데이터를 출력하는 로직을 추가하세요 --%>
    </table>
</form>

	<jsp:include page="../footer.jsp" />
</body>
</html>