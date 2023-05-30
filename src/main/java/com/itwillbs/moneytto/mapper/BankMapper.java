package com.itwillbs.moneytto.mapper;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.moneytto.vo.ResponseTokenVO;

public interface BankMapper {
	
	// 토큰 정보 저장
	int insertToken(@Param("id") String id, @Param("token") ResponseTokenVO responseToken);

	// 계좌 인증 상태 변경
	int updateAccountAuthStatus(String id);

}
