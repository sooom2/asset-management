<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>출금이체 결과</h1>
	<table border="1">
		<tr>
			<th>요청일시</th>
			<th>출금계좌번호</th>
			<th>예금주명</th>
			<th>출금금액</th>
			<th>출금가능금액</th>
		</tr>
		<tr>
			<td>${result.api_tran_dtm }</td>
			<td>${result.account_num_masked }</td>
			<td>${result.account_holder_name }</td>
			<td>${result.tran_amt } 원</td>
			<td>${result.wd_limit_remain_amt } 원</td>
		</tr>
	</table>
	<hr>
	<%-- 임시) 입금(내가 보낸 대금 받을 대상) 정보 입력 --%>
	<h1>입금 대상 정보 입력(임시)</h1>
	<form action="bank_deposit" method="post">
		<!-- 
		실제 송금 과정은 나(출금계좌예금주) -> 기관 -> 상대방(받는계좌예금주) 형태로 이루어지므로
		나의 핀테크 이용번호를 입금 과정에서 함께 사용하므로 포함해서 전달
		-->
		<input type="hidden" name="fintech_use_num" value="${fintech_use_num }">
		<table border="1">
			<tr>
				<th>예금주명</th>
				<th>은행코드</th>
				<th>계좌번호</th>
				<th>핀테크이용번호</th>
				<th>송금할 금액</th>
				<th></th>
			</tr>
			<tr>
				<td><input type="text" name="recv_client_name"></td>
				<td><input type="text" name="recv_client_bank_code"></td>
				<td><input type="text" name="recv_client_account_num"></td>
				<td><input type="text" name="recv_client_fintech_use_num"></td>
				<td><input type="text" name="tran_amt"></td>
				<td><input type="submit" value="송금(출금이체)"></td>
			</tr>
		</table>
	</form>
</body>
</html>















