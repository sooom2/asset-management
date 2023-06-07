<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- 전달받은 메세지(msg 속성) 출력 후 지정된 페이지(target)로 이동 - 자바스크립트 --%>
<c:choose>
	<c:when test="${isClose eq true }">
		<script>
			alert("${msg}");
			window.opener.location.href = "${target}";
			window.close();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("${msg}");
			location.href = "${target}";
		</script>
	</c:otherwise>
</c:choose>