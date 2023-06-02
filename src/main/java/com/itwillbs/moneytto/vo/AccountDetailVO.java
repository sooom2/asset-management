package com.itwillbs.moneytto.vo;

import lombok.Data;

@Data
public class AccountDetailVO {
	private String api_tran_id;
	private String api_tran_dtm;
	private String rsp_code;
	private String rsp_message;
	private String bank_tran_id;
	private String bank_tran_date;
	private String bank_code_tran;
	private String bank_rsp_code;
	private String bank_rsp_message;
	private String bank_name;
	private String savings_bank_name;
	private String fintech_use_num;
	private long balance_amt; // 계좌잔액(부호있음) - 13자리 => long 타입(int 불가)
	private long available_amt; // 출금가능액 - 12자리 => long 타입(int 불가)
	private String account_type;
	private String product_name;
	private String account_issue_date;
	private String maturity_date;
	private String last_tran_date;
}










