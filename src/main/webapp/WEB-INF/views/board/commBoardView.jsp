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
<script type="text/javascript" src="../js/main.js"></script>
<script src="resources/js/jquery-3.6.4.js"></script>

<!-- 썸머노트 -->
<!--  jQuery, bootstrap -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
.comment-table {
    border-collapse: collapse !important;
    width: 100% !important;
    background-color: transparent !important;
    padding: 10px !important;
    margin-bottom: 20px;
}

.comment-table th,
.comment-table td {
    border: 1px solid #ddd !important;
    padding: 8px !important;
    text-align: center !important;
}

.comment-table th {
    background-color: transparent !important;
    color: #333333 !important;
    font-weight: bold;
    font-family: Arial, sans-serif;
}

.comment-table tbody tr:first-child td {
    padding-top: 12px !important;
}

.comment-table tbody tr:last-child td {
    padding-bottom: 12px !important;
}

.comment-buttons {
    margin-top: 20px;
    margin-bottom: 20px;
}

.board-info {
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.board-title {
    margin-right: 10px;
}

.comment-count {
    background-color: transparent;
    color: #333333;
    padding: 5px 8px;
    border: 1px solid #ddd;
    border-radius: 5px;
}
</style>
<body>
    <input type="hidden" id="commCode" name="comm_code" value="${param.comm_code}">


	<jsp:include page="../nav.jsp" />
	<!-- 게시글 보기 -->
	<article id="writeForm">
		<form action="addComment" method="post" name="viewForm"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title</label>
				<input type="text" class="form-control" id="title" value="${boardDetail.comm_title}" readonly>
			</div>

			<div class="form-group">
				<label for="content">Content</label>
				<textarea class="form-control summernote" rows="5" cols="" id="content" readonly>${boardDetail.comm_content}</textarea>
			</div>

			<div>
				<section id="btnArea" style="display: flex; justify-content: center;">
					<input type="button" value="뒤로가기" onclick="history.back()">
				</section>
			</div>
			<!-- 댓글 리스트 -->
			<div id="commentList">
				<table class="comment-table">
					<thead>
						<tr>
							<th>작성자</th>
							<th>댓글</th>
							<th>일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reply" items="${replyList}">
							<tr>
								<td>${reply.member_id}</td>
								<td>${reply.comment}</td>
								<td>${reply.reply_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 댓글 작성 폼 -->
			<form id="commentForm">
				<div class="form-group">
					<label for="commentContent">Comment</label>
					<textarea class="form-control" rows="2" id="commentContent"
						name="content"></textarea>
				</div>
				<div class="form-group">
					<input type="hidden" id="commCode" name="comm_code"
						value="${param.comm_code}">
					<button type="submit" class="btn btn-primary">댓글 작성</button>
				</div>
			</form></article>
		<script>
		$('.summernote').summernote({
			tabsize : 2,
			height : 300
		});

		$(document).ready(function() {
			// 댓글 작성 폼 제출 이벤트 처리
			$("#commentForm").submit(function(event) {
				event.preventDefault(); // 폼의 기본 동작 방지

				// 입력된 내용 가져오기
				var content = $("#commentContent").val();
				var commCode = $("#commCode").val();

				// AJAX를 사용하여 서버로 데이터 전송
				$.ajax({
					type : "POST",
					url : "addComment",
					data : {
						content : content,
						comm_code : commCode
					},
					success : function(response) {
						if (response === "success") {
							alert("댓글이 등록되었습니다.");
							location.reload(); // 페이지 새로고침
						} else {
							alert("댓글 등록에 실패했습니다.");
						}
					},
					error : function() {
						alert("댓글 등록에 실패했습니다.");
					}
				});
			});
		});
		
		
		var comm_code = getUrlParameter('comm_code');

		function getUrlParameter(name) {
		    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
		    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
		    var results = regex.exec(location.search);
		    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
		}
		
	</script>

	<jsp:include page="../footer.jsp" />

</body>
</html>