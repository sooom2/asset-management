package com.itwillbs.moneytto.vo;

import lombok.Data;

/*
account 테이블 정의 - 인증 및 계좌 관련 기본 정보 관리
---------------------------------
아이디(id) - 문자 16자, PK, FK(member 테이블의 id 참조) - ON UPDATE CASCADE, ON DELETE CASCADE
사용자번호(user_seq_no) VARCHAR(10)
접속정보(user_ci) VARCHAR(200)
엑세스토큰(access_token) VARCHAR(500)
갱신토큰(refresh_token) VARCHAR(500)
은행기관코드(bank_code_std) VARCHAR(3)
계좌번호(account_num) VARCHAR(16)
핀테크이용번호(fintech_use_num) VARCHAR(24)
현재잔고(balance_amt) INT
-------------------------------------------
CREATE TABLE account (
	id VARCHAR(16) PRIMARY KEY,
	user_seq_no VARCHAR(10),
	user_ci VARCHAR(200),
	access_token VARCHAR(500),
	refresh_token VARCHAR(500),
	bank_code_std VARCHAR(3),
	account_num VARCHAR(16),
	fintech_use_num VARCHAR(24),
	balance_amt INT,
	FOREIGN KEY (id) REFERENCES member(id) ON UPDATE CASCADE ON DELETE CASCADE
);
*/

// 인증 및 계좌 관련 기본 정보 관리
@Data
public class AccountVO {
	private String id;
	private String user_seq_no;
	private String user_ci;
	private String access_token;
	private String refresh_token;
	private String fintech_use_num;
	private String account_alias;
	private String bank_code_std;
	private String bank_code_sub;
	private String bank_name;
	private String savings_bank_name;
	private String account_num;
	private String account_num_masked;
	private String account_seq;
	private String account_holder_name;
	private String account_holder_type;
	private String inquiry_agree_yn;
	private String inquiry_agree_dtime;
	private String transfer_agree_yn;
	private String transfer_agree_dtime;
	private String account_state;
	private int balance_amt;
	
}















