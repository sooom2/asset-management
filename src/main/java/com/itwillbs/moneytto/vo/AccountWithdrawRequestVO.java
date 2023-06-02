package com.itwillbs.moneytto.vo;

import lombok.Data;

@Data
public class AccountWithdrawRequestVO {
	private String bank_tran_id; // 이용기관코드+U+랜덤숫자 9 자리
	private String cntr_account_type; // 'N'약정 계좌/계정 구분   주2)  n:계좌, c:계정
	private String cntr_account_num;  //약정 계좌/계정 번호      주2) 내계좌
	private String dps_print_content; //입금계좌인자내역
	private String fintech_use_num;   //출금계좌핀테크이용번호
	private String wd_print_content; // 출금계좌인자내역
	private String tran_amt;   //거래금액
	private String tran_dtime;
	private String req_client_name;
	private String req_client_bank_code;
	private String req_client_account_num; //내계좌
	private String req_client_num; //임의값
	private String transfer_purpose; //TR
	private String recv_client_name;
	private String recv_client_bank_code;
	private String recv_client_account_num;
}
