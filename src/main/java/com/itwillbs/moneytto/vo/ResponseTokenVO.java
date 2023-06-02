package com.itwillbs.moneytto.vo;

import lombok.Data;

// 엑세스토큰 요청 결과를 관리할 VO 클래스 정의
@Data
public class ResponseTokenVO {
	private String access_token;
	private String token_type;
	private String expires_in;
	private String refresh_token;
	private String scope;
	private String user_seq_no;
}
