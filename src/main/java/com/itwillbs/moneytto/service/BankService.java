package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.BankMapper;
import com.itwillbs.moneytto.vo.ResponseTokenVO;

@Service
public class BankService {
	@Autowired
	private BankMapper mapper;
	
	// 토큰 정보 저장
	public int writeToken(String id, ResponseTokenVO responseToken) {
		// 토큰 정보 저장 요청
		int insertCount = mapper.insertToken(id, responseToken);
		if(insertCount > 0) { // 토큰 정보 저장 성공 시
			// 계좌 인증 상태 변경 요청
			return mapper.updateAccountAuthStatus(id); 
		} else {
			return 0;
		}
	}
	// 계좌 정보 조회
	public HashMap<String, String> getAccount(String member_id) {
		
		return mapper.selectAccountById(member_id);
	}
	// 계좌 정보 조회
	public HashMap<String, String> getAccount(HashMap<String, String> member) {
		
		return mapper.selectAccountByMember(member);
	}
	
	
	
	public int updateAccount(Map<String, String> map) {

		return mapper.updateAccount(map);
	}
	// 포인트 충전 내역 작성 
	public int writeHistory(Map<String, String> map) {
		
		int insertCount = mapper.insertAccountHistory(map);
		if(insertCount > 0) {
			return mapper.updatePointAmount(map);
		}
		return 0;
	}
	
	
// 관리자 계좌 내역들=========================================================================
	// 계좌 내역 조회
	public List<HashMap<String, String>> selectAccountHistory(HashMap<String, String> map) {
		return mapper.selectAccountHistory(map);
	}
	
	// 포인트 내역 조회
	public List<HashMap<String, String>> selectPointHistory(HashMap<String, String> map) {
		return mapper.selectPointHistory(map);
	}
	
	
}















