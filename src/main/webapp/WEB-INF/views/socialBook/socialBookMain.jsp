<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<link href="${path }/resources/css/socialBook.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="socialBookTop.jsp"></jsp:include>
	<jsp:include page="../footer.jsp" />
</body>
</html>