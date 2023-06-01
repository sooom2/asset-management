<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 세션 아이디가 없을 경우 "로그인 후 사용 가능합니다" 출력 후 메인페이지로 이동 --%>
	<%-- 아니면, 엑세스 토큰 없을 경우 "계좌인증 후 사용 가능합니다" 출력 후 회원정보 페이지로 이동 --%>
	<c:choose>
		<c:when test="${empty sessionScope.sId }">
			<script type="text/javascript">
				alert("로그인 후 사용 가능합니다");
				location.href = "./";
			</script>
		</c:when>
		<c:when test="${empty sessionScope.access_token }">
			<script type="text/javascript">
				alert("계좌인증 후 사용 가능합니다");
				location.href = "MemberInfo.me";
			</script>
		</c:when>
	</c:choose>

	<h1>핀테크 사용자 정보</h1>
	<h3>${userInfo.user_name } 고객님의 계좌 목록(사용자 일련번호 : ${userInfo.user_seq_no })</h3>
	<table border="1">
		<tr>
			<th>계좌별칭</th>
			<th>계좌번호</th>
			<th>은행명</th>
			<th>예금주명</th>
			<th>계좌상태</th>
			<th>핀테크이용번호</th>
			<th></th>
		</tr>
		<%-- userInfo 객체의 res_list 객체 반복(account 변수에 저장) --%>
		<%-- account 객체(AccountVO)로부터 각 데이터를 꺼내서 테이블에 출력 --%>
		<c:forEach var="account" items="${userInfo.res_list }">
			<tr>
				<td>${account.account_alias }</td>
				<td>${account.account_num_masked }</td>
				<td>${account.bank_name }(${account.bank_code_std })</td>
				<td>${account.account_holder_name }</td>
				<td></td>
				<td>${account.fintech_use_num }</td>
				<td>
					<form action="bank_accountDetail" method="post">
						<%-- 엑세스토큰, 핀테크이용번호 전달 --%>
<%-- 						<input type="hidden" name="access_token" value="${sessionScope.access_token }"> --%>
						<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
						<input type="hidden" name="account_num_masked" value="${account.account_num_masked }">
						<input type="hidden" name="user_name" value="${userInfo.user_name }">						
						<input type="submit" value="상세조회">
					</form>
				</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>