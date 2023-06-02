package com.itwillbs.moneytto.vo;

import java.util.List;

import lombok.Data;

// 2.2.1. 사용자정보조회 API 응답 데이터
@Data
public class ResponseUserInfoVO {
	private String api_tran_id;
	private String api_tran_dtm;
	private String rsp_code;    // 요청에 대한 결과 응답 코드
	private String rsp_message; // 요청에 대한 결과 응답 메세지
	private String user_seq_no; // 사용자 번호(고객마다 다른 고정값)
	private String user_ci;     // 사용자 연결 정보(고객마다 다른 고정값)
	private String user_name;
	private String user_info;
	private String user_gender;
	private String user_cell_no;
	private String user_email;
	private String res_cnt;
	private List<AccountVO> res_list; // 사용자 계좌 목록(AccountVO 객체의 배열 형태(JSON)로 전달됨)
}




















