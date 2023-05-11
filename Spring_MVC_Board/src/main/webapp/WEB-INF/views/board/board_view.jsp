<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<!-- 외부 CSS 가져오기 -->
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#articleForm {
		width: 500px;
		height: 500px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		border: 1px solid black;
		border-collapse: collapse; 
	 	width: 500px;
	}
	
	th {
		text-align: center;
	}
	
	td {
		width: 150px;
		text-align: center;
	}
	
	#basicInfoArea {
		height: 70px;
		text-align: center;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
		white-space: pre-line;
	}
	
	#commandList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
	
	/* ------ 댓글 ------ */
	#replyArea {
		width: 500px;
		height: 150px;
		margin: auto;
		margin-top: 20px;
	}
	
	#replyArea textarea {
		width: 400px;
		height: 50px;
		vertical-align: middle;
		resize: none;
	}
	
	#replyArea input {
		width: 80px;
		height: 55px;
		vertical-align: middle;
	}
	
	#replyContentArea {
		width: 500px;
		height: 100px;
		font-size: 12px;
		/* 텍스트 표시 한 줄 이내로 제한(넘치는 부분은 생략되도록 처리) */
/* 		white-space: nowrap; */
/* 		overflow: hidden; */
/* 		text-overflow: ellipsis; */
	}
	
	#replyContentArea table, tr, td {
		border: none;
	}
	
	.replyContent {
		width: 350px;
		text-align: left;
	}
	.replyWriter {
		width: 60px;
	}
	.replyDate {
		width: 90px;
	}
	
	.replyContent img {
		width: 10px;
		height: 10px;
	}
	
	/* 대댓글 */
	#reReplyTextarea {
		width: 350px;
		height: 40px;
		vertical-align: middle;
		resize: none;
	}
	
	#reReplySubmit {
		width: 80px;
		height: 45px;
		vertical-align: middle;
	}
	
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	function confirmDelete(board_num, pageNum) {
		// confirm() 함수를 통해 "삭제하시겠습니까?" 확인받아 
		// true 일 경우 "BoardDelete.bo" 서블릿 요청(파라미터 : 글번호, 페이지번호)
		let result = confirm("삭제하시겠습니까?");
		
		if(result) {
			location.href="BoardDelete.bo?board_num=" + board_num + "&pageNum=" + pageNum;
		}
	}
	
	function confirmReplyDelete(board_num, reply_num) {
		let result = confirm("삭제하시겠습니까?");
		
		if(result) {
			location.href="BoardTinyReplyDelete.bo?board_num=" + board_num + "&reply_num=" + reply_num;
		}
	}
	
	function reReplyWrite(board_num, reply_num, reply_re_ref, reply_re_lev, reply_re_seq) {
		if("${sessionScope.sId}" == "") { // 세션 아이디가 없을 경우
			alert("로그인 후 사용 가능한 기능입니다!");
		} else {
			// 다른 대댓글 영역 제거
			$(".reReplyTr").remove();
			
			// 대댓글 영역 추가
			$("#replyTr" + reply_num).after(
					'<tr class="reReplyTr"><td colspan="3">'
					+ '<form action="BoardTinyReReplyWrite.bo" method="post">'
					+ '	<input type="hidden" name="board_num" value="' + board_num + '">'
					+ '	<input type="hidden" name="reply_name" value="${sessionScope.sId}">'
					+ '	<input type="hidden" name="reply_num" value="' + reply_num + '">'
					+ '	<input type="hidden" name="reply_re_ref" value="' + reply_re_ref + '">'
					+ '	<input type="hidden" name="reply_re_lev" value="' + reply_re_lev + '">'
					+ '	<input type="hidden" name="reply_re_seq" value="' + reply_re_seq + '">'
					+ '	<textarea id="reReplyTextarea" name="reply_content"></textarea>'
					+ '	<input type="submit" value="댓글쓰기" id="reReplySubmit">'
					+ '</form>'			
			);
		}
	}
</script>
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 상세내용 보기 -->
	<section id="articleForm">
		<h2>글 상세내용 보기</h2>
		<section id="basicInfoArea">
			<table border="1">
			<tr><th width="70">제 목</th><td colspan="3" >${board.board_subject }</td></tr>
			<tr>
				<th width="70">작성자</th><td>${board.board_name }</td>
				<th width="70">작성일</th>
				<td><fmt:formatDate value="${board.board_date }" pattern="yy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<th width="70">첨부파일</th>
				<td>
					<%--
					[ 업로드 된 파일명에서 실제 파일명 추출하기 ]
					=> JSTL 의 함수를 활용(JSTL functions 라이브러리 추가 필요)
					1. 파일명 길이 계산(fn:length(문자열))
					2. 파일명에서 구분자의 인덱스 알아내기(fn:indexOf(대상문자열, 찾을문자열))
					3. 구분자의 인덱스 + 1 위치부터 마지막 인덱스(= 파일명 길이)까지를 추출하기
					   (fn:substring(대상문자열, 시작인덱스, 끝인덱스))
					--%>   
					<c:set var="length" value="${fn:length(board.board_file) }" />
					<c:set var="index" value="${fn:indexOf(board.board_file, '_') }" />
					<c:set var="fileName" value="${fn:substring(board.board_file, index + 1, length) }" />
					<%--					   
					[ 첨부파일 다운로드 ]
					- 하이퍼링크를 사용하여 컨텍스트경로/resources/upload 디렉토리 내의 파일 지정
					  (단, 업로드 시 현재 날짜를 폴더 구조로 사용했으므로 board_file_path 도 경로에 포함)
					- download 속성 설정 시 파일 다운로드가 자동으로 수행됨(HTML5 에서 지원)
					  => download 속성값으로 다운로드 될 파일명 지정하면 해당 이름으로 다운로드 됨
					--%>
					<a href="${pageContext.request.contextPath }/resources/upload/${board.board_file_path}/${board.board_file}" download="${fileName }">${fileName }</a>
				</td>
				<th width="70">조회수</th>
				<td>${board.board_readcount }</td>
			</tr>
			</table>
		</section>
		<section id="articleContentArea">
			${board.board_content }
		</section>
	</section>
	<section id="commandList">
		<input type="button" value="답변" onclick="location.href='BoardReplyForm.bo?board_num=${board.board_num}&pageNum=${param.pageNum}'">
		<input type="button" value="수정" onclick="location.href='BoardModifyForm.bo?board_num=${board.board_num}&pageNum=${param.pageNum}'">
		<input type="button" value="삭제" onclick="confirmDelete(${board.board_num}, ${param.pageNum })">
		<input type="button" value="목록" onclick="location.href='BoardList.bo?pageNum=${param.pageNum}'">
	</section>
	<section id="replyArea">
		<form action="BoardTinyReplyWrite.bo" method="post">
			<input type="hidden" name="board_num" value="${board.board_num}">
			<input type="hidden" name="reply_name" value="${sessionScope.sId}">
			<%-- 세션 아이디가 없을 경우(미로그인) 댓글 작성 차단 --%>
			<c:choose>
				<c:when test="${empty sessionScope.sId }">
					<textarea id="replyTextarea" name="reply_content" placeholder="로그인 한 사용자만 작성 가능합니다." disabled="disabled"></textarea>
					<input type="submit" value="댓글쓰기" disabled="disabled">
				</c:when>
				<c:otherwise>
					<textarea id="replyTextarea" name="reply_content"></textarea>
					<input type="submit" value="댓글쓰기">
				</c:otherwise>				
			</c:choose>
		</form>
		<div id="replyContentArea">
			<table>
				<c:forEach var="tinyReplyBoard" items="${tinyReplyBoardList}">
					<tr id="replyTr${tinyReplyBoard.reply_num }">
						<td class="replyContent">
							<%-- board_re_lev 값이 0보다 크면 대댓글이므로 들여쓰기 후 이미지(re.gif) 표시 --%>
							<c:if test="${tinyReplyBoard.reply_re_lev > 0 }">
								<%-- 반복문을 통해 reply_re_lev 값 만큼 공백 추가 --%>
								<c:forEach var="i" begin="1" end="${tinyReplyBoard.reply_re_lev }">
									&nbsp;&nbsp;
								</c:forEach>
								<%-- 대댓글 제목 앞에 대댓글 이미지(re.gif) 추가 --%>
								<img src="${pageContext.request.contextPath }/resources/images/re.gif">
							</c:if>
							${tinyReplyBoard.reply_content }
							<%-- 세션 아이디가 존재하고, "admin" 이거나, 세션 아이디와 작성자 아이디가 동일할 경우 삭제 버튼 표시 --%>
							<c:if test="${not empty sessionScope.sId and (sessionScope.sId eq 'admin' or sessionScope.sId eq tinyReplyBoard.reply_name) }">
								<a href="javascript:confirmReplyDelete(${tinyReplyBoard.board_num }, ${tinyReplyBoard.reply_num })"><img src="${pageContext.request.contextPath }/resources/images/delete-icon.png"></a>
							</c:if>
							<%-- 댓글 아이콘 표시(항상) --%>
							<a href="javascript:reReplyWrite(${tinyReplyBoard.board_num }, ${tinyReplyBoard.reply_num }, ${tinyReplyBoard.reply_re_ref }, ${tinyReplyBoard.reply_re_lev }, ${tinyReplyBoard.reply_re_seq })">
								<img src="${pageContext.request.contextPath }/resources/images/reply-icon.png">
							</a>
						</td>
						<td class="replyWriter">${tinyReplyBoard.reply_name }</td>
						<td class="replyDate">
							<fmt:formatDate value="${tinyReplyBoard.reply_date }" pattern="MM-dd HH:mm"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
</body>
</html>
















