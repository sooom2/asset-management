<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<script>
$(document).ready(function() {
	var message = "${msg}";
	swal({
		text : message,
	}).then(function(){
		window.opener.location.href = "${target}";
		if(${isClose}){
			window.close();			
		}
	});
});
</script>