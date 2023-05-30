package com.itwillbs.moneytto.service;

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
	
}















