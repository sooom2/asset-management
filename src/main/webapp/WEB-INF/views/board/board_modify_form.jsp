<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<!-- css/main.css 파일 불러오기 -->
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/subpage.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	function deleteFile() {
// 		let board_num = ${board.board_num};
// 		let board_file = "${board.board_file}";
// 		alert(board_num + ", " + board_file); // 59, 2dd12f61_Hello.java
		// -------------------------------------------------------------
		// 파일 삭제를 AJAX 로 처리하기
		// BoardDeleteFile.bo 서블릿 요청(파라미터 : 글번호, 파일명, 업로드경로)
		$.ajax({
			type: "POST",
			url: "BoardDeleteFile.bo",
			data: {
				"board_num" : ${board.board_num},
				"board_file" : "${board.board_file}",
				"board_file_path" : "${board.board_file_path}"
			},
			success: function(result) {
				// 삭제 성공/실패 여부 판별(result 값 "true"/"false" 판별 => 주의! 문자열이다!)
				if(result == "true") {
					// 삭제 성공 시 파일명 표시 위치의 기존 항목을 제거하고
					// 파일 업로드를 수행할 수 있도록 "파일 선택" 버튼 표시
					$("#fileBtnArea").html("<input type='file' name='file'/>")
				} else {
					alert("일시적인 오류로 파일 삭제에 실패했습니다!");
				}
			}
		});
	}
</script>
</head>
<body>
	<header>
		<%-- inc/top.jsp 페이지 삽입(jsp:include 액션태그 사용 시 / 경로는 webapp 가리킴) --%>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 글 수정 -->
	<section id="modifyForm">
		<h1>게시판 글 수정</h1>
		<form action="BoardModifyPro.bo" name="boardForm" method="post" enctype="multipart/form-data">
			<!-- 입력받지 않은 파라미터 데이터(글번호, 페이지번호)는 "hidden" 속성으로 전달 -->
			<input type="hidden" name="board_num" value="${param.board_num }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				<tr>
					<td class="write_td_left"><label for="board_name">글쓴이</label></td>
					<td class="write_td_right"><input type="text" name="board_name" value="${board.board_name }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="write_td_left"><label for="board_subject">제목</label></td>
					<td class="write_td_right"><input type="text" id="board_subject" name="board_subject" value="${board.board_subject }" required="required" /></td>
				</tr>
				<tr>
					<td class="write_td_left"><label for="board_content">내용</label></td>
					<td class="write_td_right">
						<textarea id="board_content" name="board_content" required="required">${board.board_content }</textarea>
					</td>
				</tr>
				<tr>
					<td class="write_td_left"><label for="board_file">파일 첨부</label></td>
					<!-- 파일 첨부 형식은 input 태그의 type="file" 속성 사용(파일 업로드 옵션) -->
					<td class="write_td_right">
						<%-- 
						업로드 한 파일이 존재할 경우 파일명과 삭제버튼 표시하고
						아니면, 파일 등록을 위한 파일 버튼 표시
						--%>
						<div id="fileBtnArea">
							<c:choose>
								<c:when test="${empty board.board_file }">
										<input type="file" name="file"/>
								</c:when>
								<c:otherwise>
									<c:set var="length" value="${fn:length(board.board_file) }" />
									<c:set var="index" value="${fn:indexOf(board.board_file, '_') }" />
									<c:set var="fileName" value="${fn:substring(board.board_file, index + 1, length) }" />
									<a href="${pageContext.request.contextPath }/resources/upload/${board.board_file_path}/${board.board_file}" download="${fileName }">${fileName }</a>
									<%-- 삭제버튼 클릭 시 deleteFile() 함수 호출(파라미터로 글번호, 파일명 전달) --%>
									<input type="button" value="삭제" onclick="deleteFile()">
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="수정">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
			</section>
		</form>
	</section>
</body>
</html>








