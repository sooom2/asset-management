<%@ page language="java" contentType="text/html; charset=UTF-생8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/b2ab45b73f.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>머니또우</title>
</head>
<body>
	<div id="account_container">
	<div id="account_contents" class="">
		<!-- inner-wrap -->
		<div class="inner-wrap">
			<a href="chatPage">생성후채팅방</a>
			<div class="accountBook_top">
				<h2 class="tit" style="display: inline-block;">소셜가계부</h2>
				<div class="accountLoad"><a href=""><i class="fas fa-list" aria-hidden="true"></i>&nbsp;머니또방 생성</a></div>
			</div>
			<ul class="accountBookSel">
				<li class="on"><a href="">모집머니또</a></li>
				<li><a href="">참여머니또</a></li>
				<li><a href="">종료머니또</a></li>
			</ul>
		</div>
		</div>
	</div>
</body>
</html>