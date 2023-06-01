<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- 전달받은 오류메세지(msg 속성) 출력 후 이전 페이지로 돌아가기 - 자바스크립트 --%>
<!-- isClose 속성값이 true 일 경우 현재 창 닫기, 아니면 이전페이지로 돌아가기 -->
<c:choose>
	<c:when test="${isClose eq true }">
		<script>
			alert("${msg}");
			window.close();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("${msg}");
			history.back();
		</script>
	</c:otherwise>
</c:choose>