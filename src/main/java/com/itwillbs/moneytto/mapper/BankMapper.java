package com.itwillbs.moneytto.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.moneytto.vo.AccountVO;
import com.itwillbs.moneytto.vo.ResponseTokenVO;

public interface BankMapper {
	
	// 토큰 정보 저장
	int insertToken(@Param("id") String id, @Param("token") ResponseTokenVO responseToken);

	// 계좌 인증 상태 변경
	int updateAccountAuthStatus(String member_id);

	// 계좌 정보 조회
	HashMap<String, String> selectAccount(String member_id);
	
	// 핀테크 번호 등록
	int updateAccount(@Param("member_id")String member_id,
						@Param("fintech_use_num")String fintech_use_num
						,@Param("balance_amt") String balance_amt);

}
