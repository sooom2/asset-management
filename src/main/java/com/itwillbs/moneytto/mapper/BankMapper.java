package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;
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
	
	HashMap<String, String> selectAccountById(String member_id);
	
	HashMap<String, String> selectAccountByMember(HashMap<String, String> member);
	
	// 포인트 충전 했을 때 Transaction
	int insertAccountHistory(Map<String, String> map);

	int updatePointAmount(Map<String, String> map);

	int insertPointHistory(Map<String, String> map);

//	int updateAccountBalance(Map<String, String> map); 
	
// 관리자 계좌 내역들=========================================================================
	// 계좌 내역 조회 
	List<HashMap<String, String>> selectAccountHistory(HashMap<String, String> map);
		
	// 포인트 내역 조회
	List<HashMap<String, String>> selectPointHistory(HashMap<String, String> map);

	

}
