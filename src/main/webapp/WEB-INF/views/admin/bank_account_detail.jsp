<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${user_name } 고객님의 계좌 상세정보</h1>
	<table border="1">
		<tr>
			<th>은행명</th>
			<th>계좌번호</th>
			<th>상품명</th>
			<th>계좌잔액</th>
			<th>출금가능금액</th>
			<th></th>
		</tr>
		<tr>
			<td>${account.bank_name }</td>
			<td>${account_num_masked }</td>
			<td>${account.product_name }</td>
			<td>${account.balance_amt }</td>
			<td>${account.available_amt }</td>
			<td>
				<form action="bank_withdraw" method="post">
					<%-- 엑세스토큰, 핀테크이용번호, 계좌번호(마스킹), 예금주명 전달 --%>
<%-- 						<input type="hidden" name="access_token" value="${sessionScope.access_token }"> --%>
					<input type="hidden" name="fintech_use_num" value="${account.fintech_use_num }">
					<input type="hidden" name="bank_name" value="${account.bank_name }">
					<input type="submit" value="출금이체">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
