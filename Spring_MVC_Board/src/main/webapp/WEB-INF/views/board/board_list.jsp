<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- JSTL 에서 표시 방식(날짜 등) 변경하려면 JSTL 의 fmt(format) 라이브러리 필요 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#listForm {
		width: 1024px;
		max-height: 610px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 1024px;
	}
	
	#tr_top {
		background: orange;
		text-align: center;
	}
	
	table td {
		text-align: center;
	}
	
	#subject {
		text-align: left;
		padding-left: 20px;
		
		/* 제목 길이 제한 (잘린 부분은 ... 으로 표시) */
		max-width: 450px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#name {
		/* 작성자 길이 제한 (잘린 부분은 ... 으로 표시) */
		max-width: 100px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#pageList {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#buttonArea {
		margin: auto;
		width: 1024px;
		text-align: right;
	}
	
	/* 하이퍼링크 밑줄 제거 */
	a {
		text-decoration: none;
	}
</style>
<!-- css/main.css 파일 불러오기 -->
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	// AJAX + JSON 을 활용한 게시물 목록 무한 스크롤 구현
	// 페이지 번호값 미리 저장
	let pageNum = 1;
	
	$(function() {
		// 게시물 목록 조회를 처음 수행하기 위해 문서 로딩 시 load_list() 함수 호출
		// => 검색타입과 검색어를 파라미터로 전달
		// => 단, 검색타입과 검색어를 가져와서 변수에 저장하여 사용
		let searchType = $("#searchType").val();
		let searchKeyword = $("#searchKeyword").val();
// 		alert(searchType + ", " + searchKeyword);
		
		load_list(searchType, searchKeyword);
		
		// 무한스크롤 기능 구현
		// window 객체에서 scrolling 동작 처리를 위해 scroll() 함수 호출
		$(window).scroll(function() {
// 			console.log("window scroll");
			
			// 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져와서 제어
			// => 스크롤바의 현재 위치, 문서가 표시되는 창(window)의 높이, 문서 전체 높이
			let scrollTop = $(window).scrollTop();
			let windowHeight = $(window).height();
			let documentHeight = $(document).height();
// 			console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : " + documentHeight);

			// 2. 스크롤바 위치값 + 창 높이 + x 가 문서 전체 높이 이상일 경우
			//    다음 페이지 게시물 목록 로딩하여 화면에 추가
			if(scrollTop + windowHeight + 1 >= documentHeight) {
				// 다음 페이지 로딩을 위한 load_list() 함수 호출
				// => 이 때, 페이지 번호를 1 증가시켜 다음 페이지 목록 로딩
				pageNum++;
				load_list(searchType, searchKeyword);
			}
		});
		
	});
	
	// 게시물 목록 조회를 AJAX + JSON 으로 처리할 load_list() 함수 정의
	// => 파라미터 : 검색 기능에 사용되는 검색타입, 검색어
	function load_list(searchType, searchKeyword) {
		// BoardListJson.bo 서블릿을 AJAX 로 요청 시 페이지번호, 검색타입, 검색어 전달
		// => 리턴받을 데이터타입을 JSON 타입으로 지정
		$.ajax({
			type: "GET",
			url: "BoardListJson.bo?pageNum=" + pageNum + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword,
			dataType: "json"
		})
		.done(function(boardList) { // 요청 성공 시 게시물 목록을 JSON 형태(boardList)로 리턴받기
			for(let board of boardList) {
				let space = ""
				if(board.board_re_lev > 0) {
					for(let i = 0; i < board.board_re_lev; i++) {
						space += "&nbsp;";
					}
					space += "<img src='${pageContext.request.contextPath }/resources/images/re.gif'>";
				}
				
				
				let result = "<tr height='50'>" 
							+ "<td>" + board.board_num + "</td>"
							+ "<td id='subject'>" + space +"<a href='BoardDetail.bo?board_num=" + board.board_num +"'>" + board.board_subject + "</a></td>"
							+ "<td>" + board.board_name + "</td>"
							+ "<td>" + getFormatDate(board.board_date) + "</td>"
							+ "<td>" + board.board_readcount + "</td>"
							+ "</tr>";
				$("#listForm > table").append(result);
			}			
		})
		.fail(function() {
			$("#listForm > table").append("<tr><td colspan='5'><h3>요청 실패!</h3></td></tr>");	
		});
	}
	
	function getFormatDate(date) {
		return date.replace(/(\d\d)(\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d).(\d)/g, "$2-$3-$4 $5:$6");
	}
</script>
</head>
<body>
	<header>
		<%-- inc/top.jsp 페이지 삽입(jsp:include 액션태그 사용 시 / 경로는 webapp 가리킴) --%>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>

	<!-- 게시판 리스트 -->
	<h2>게시판 글 목록</h2>
	<section id="buttonArea">
		<form action="BoardList.bo">
			<%-- 검색타입목록, 검색창 추가 --%>
			<select name="searchType" id="searchType">
				<option value="subject" <c:if test="${param.searchType eq 'subject'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="subject_content" <c:if test="${param.searchType eq 'subject_content'}">selected</c:if>>제목&내용</option>
				<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>작성자</option>
			</select>
			<input type="text" name="searchKeyword" value="${param.searchKeyword }" id="searchKeyword">
			<input type="submit" value="검색" />
			<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.bo'" />
		</form>
	</section>
	<section id="listForm">
		<table>
			<tr id="tr_top">
				<td width="100px">번호</td>
				<td>제목</td>
				<td width="150px">작성자</td>
				<td width="150px">날짜</td>
				<td width="100px">조회수</td>
			</tr>
		</table>
	</section>
</body>
</html>













