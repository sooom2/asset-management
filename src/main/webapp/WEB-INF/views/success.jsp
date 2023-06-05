<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- 전달받은 메세지(msg 속성) 출력 후 지정된 페이지(target)로 이동 - 자바스크립트 --%>
<!-- isClose 속성값이 true 일 경우 현재 창 닫기, 아니면 target 속성에 지정된 페이지로 이동 -->
<c:choose>
	<c:when test="${isClose eq true }">
		<script>
			swal("${msg}");
			// 부모창의 페이지를 지정한 페이지로 이동시키고, 자식창 닫기
			window.opener.location.href = "${target}";
			window.close();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			swal("${msg}");
			location.href = "${target}";
		</script>
	</c:otherwise>
</c:choose>
