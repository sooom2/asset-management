package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.moneytto.vo.ResponseTokenVO;

public interface BankMapper {
	
	// 토큰 정보 저장
	int insertToken(@Param("id") String id, @Param("token") ResponseTokenVO responseToken);

	// 계좌 인증 상태 변경
	int updateAccountAuthStatus(String member_id);

	// 계좌 정보 조회
	HashMap<String, String> selectAccount(String member_id);
	
	// 핀테크 번호 등록
	int updateAccount(Map<String, String> map);
	// 포인트 충전 했을 때
	int insertAccountHistory(Map<String, String> map);

	int updatePointAmount(Map<String, String> map);

}
