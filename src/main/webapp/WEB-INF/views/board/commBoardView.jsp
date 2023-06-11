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
<!-- <script type="text/javascript" src="../js/main.js"></script> -->
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
    border: none !important;
    padding: 8px !important;
    text-align: center !important;
    position: relative;
}

.comment-table th {
    background-color: transparent !important;
    color: #333333 !important;
    font-weight: bold;
    font-family: Arial, sans-serif;
}

.comment-table tbody tr:first-child td {
    padding-top: 12px !important;
    border-top: 1px solid #ddd !important; /* 행의 위쪽 선 추가 */
}

.comment-table tbody tr:last-child td {
    padding-bottom: 12px !important;
}

.comment-table td.comment {
    width: 60%;
    text-align: left;
    padding-left: 10px;
    word-wrap: break-word;
}

.comment-table td.nickname,
.comment-table td.date {
    width: 20%;
    text-align: center;
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

.comment-table td .delete-button {
    position: absolute;
    left: -10px;
    top: 50%;
    transform: translateY(-50%);
}

.comment-table td .delete-button .delete-btn {
    border: none;
    background: transparent;
    font-size: 12px;
    color: #999;
    cursor: pointer;
}

.comment-table td .delete-button .delete-btn:hover {
    color: #ff0000;
}

.comment-table:before,
.comment-table:after {
    content: "";
    display: table;
    clear: both;
}

.comment-table {
    border: 1px solid #ddd !important;
    border-spacing: 0; /* 선이 보이도록 border-spacing 추가 */
}

.comment-table th,
.comment-table td {
    border-bottom: 1px solid #ddd !important; /* 행의 아래쪽 선 추가 */
    border-right: none !important;
}

.comment-table tr:last-child td {
    border-bottom: none !important;
}

</style>

<body>
    <input type="hidden" id="commCode" name="comm_code" value="${param.comm_code}">


	<jsp:include page="../nav.jsp" />

	<article id="writeForm">
		<form action="addComment" method="post" name="viewForm" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title</label> <input type="text"
					class="form-control" id="title" value="${boardDetail.comm_title}"
					readonly>
			</div>

			<div class="form-group">
				<label for="content">Content</label>
				<textarea class="form-control summernote" rows="5" cols=""
					id="content" readonly>${boardDetail.comm_content}</textarea>
			</div>

			<div>
				<section id="btnArea"
					style="display: flex; justify-content: center;">
					<input type="button" value="뒤로가기" onclick="window.location.href='commBoard'">
					<c:if test="${boardDetail.member_id eq sessionScope.sId}">
						<input type="button" value="글삭제"
							onclick="deleteBoard(${boardDetail.comm_code})">
					</c:if>
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
							<th></th>
							<!-- 삭제 버튼을 위한 빈 열 추가 -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reply" items="${replyList}">
							<tr>
								<td>${reply.member_nickname}</td>
								<td>${reply.comment}</td>
								<td>${reply.reply_date}</td>
								<td><c:choose>
										<c:when test="${empty sessionScope.sId}">
										</c:when>
										<c:otherwise>
											<a href="#" class="delete-comment"
												data-reply-code="${reply.reply_code}">&#9746;</a>
											<input type="hidden" class="reply-code"
												value="${reply.reply_code}">
										</c:otherwise>
									</c:choose></td>

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
<!-- 				<div class="form-group"> -->
<!-- 					<input type="hidden" id="commCode" name="comm_code" -->
<%-- 						value="${param.comm_code}"> --%>
<!-- 					<button type="submit" class="btn btn-primary">댓글 작성</button> -->
<!-- 				</div> -->
				<div class="form-group">
					<input type="hidden" id="commCode" name="comm_code"
						value="${param.comm_code}">
					<button type="button" class="btn btn-primary" id="submitComment">댓글
						작성</button>
				</div>

			</form></article>

<!-- 	<script> -->
<!-- // $(document).ready(function() { -->
<!-- //     $('.summernote').summernote({ -->
<!-- //         tabsize: 2, -->
<!-- //         height: 300 -->
<!-- //     }); -->
<script>
    $(document).ready(function() {
        $('.summernote').summernote({
            tabsize: 2,
            height: 300
        });
     // 댓글 작성 폼 제출 이벤트 처리
        $("#submitComment").click(function(event) {
            event.preventDefault(); // 클릭 이벤트의 기본 동작 방지

            // 입력된 내용 가져오기
            var content = $("#commentContent").val();
            var commCode = $("#commCode").val();

            // AJAX를 사용하여 서버로 데이터 전송
            $.ajax({
                type: "POST",
                url: "addComment",
                data: {
                    content: content,
                    comm_code: commCode
                },
                dataType: "json", // 반환되는 데이터 형식을 JSON으로 지정
                success: function(response) {
                    if (response.status === "success") {
                        swal("댓글이 등록되었습니다.", "", "success");
                        clearCommentForm(); // 댓글 작성 폼 초기화
                    } else {
                        swal("댓글 등록에 실패했습니다.", "", "error");
                    }
                },
                error: function() {
                    swal("댓글 등록에 실패했습니다.", "", "error");
                }
            });
        });


        // 댓글 삭제 링크 클릭 이벤트 처리
        $(document).on("click", ".delete-comment", function(event) {
            event.preventDefault(); // 링크의 기본 동작 방지

            var replyCode = $(this).data("reply-code");

            $.ajax({
                url: "deleteComment",
                type: "POST",
                data: { reply_code: replyCode },
                success: function(response) {
                    if (response === "success") {
                        swal("댓글이 삭제되었습니다.", "", "success").then(function() {
                            $("#comment-" + replyCode).remove();
                            location.reload(); // 페이지 새로고침
                        });
                    } else {
                        swal("댓글 삭제에 실패했습니다.", "", "error");
                    }
                },
                error: function() {
                    swal("댓글 삭제에 실패했습니다.", "", "error");
                }
            });
        });
    });

    function deleteBoard(comm_code) {
        swal({
            title: "게시글 삭제",
            text: "정말로 게시글을 삭제하시겠습니까?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then(function(confirmDelete) {
            if (confirmDelete) {
                $.ajax({
                    url: "deleteBoard",
                    type: "POST",
                    data: { comm_code: comm_code },
                    success: function(response) {
                        if (response === "success") {
                            swal("게시글이 삭제되었습니다.", "", "success").then(function() {
                                location.href = "commBoard";
                            });
                        } else {
                            swal("게시글 삭제에 실패했습니다.", "", "error");
                        }
                    },
                    error: function() {
                        swal("서버와의 통신에 문제가 발생했습니다.", "", "error");
                    }
                });
            }
        });
    }
</script>

	<jsp:include page="../footer.jsp" />

</body>
</html>