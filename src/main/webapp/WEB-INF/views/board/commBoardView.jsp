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

<body>
	<jsp:include page="../nav.jsp" />
	<!-- 게시글 보기 -->
	<article id="writeForm">
		<form action="commBoardView" name="viewForm" 
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title</label> 
				<input type="text" class="form-control" placeholder="글 제목을 입력해 주세요" id="title" value="${boardDetail.comm_title}" readonly>
			</div>

			<div class="form-group">
				<label for="content">Content</label>
				<textarea class="form-control summernote" rows="5" cols=""
					id="content" readonly>${boardDetail.comm_content}</textarea>
			</div>
		<div>
		<section id="btnArea"style="display: flex; justify-content: center;">
		<input type="button" value="뒤로가기" onclick="history.back()">
		</section>
		</div>
		</form>
	</article>

	<script>
		$('.summernote').summernote({
			tabsize : 2,
			height : 300
		});
	</script>


	<jsp:include page="../footer.jsp" />

</body>
</html>




