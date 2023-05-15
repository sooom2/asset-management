<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니또우</title>
</head>
<body>
	<div id="account_container">
	<div id="account_contents" class="">
		<!-- inner-wrap -->
		<div class="inner-wrap">
			<div class="accountBook_top">
				<h2 class="tit" style="display: inline-block;">가계부</h2>
				<div class="accountLoad">계좌연동</div>
			</div>
			<ul class="accountBookSel">
				<li class="on"><a>캘린더</a></li>
				<li><a>그래프</a></li>
				<li><a>목돈모으기</a></li>
			</ul>
		</div>
		</div>
	</div>
</body>
</html>