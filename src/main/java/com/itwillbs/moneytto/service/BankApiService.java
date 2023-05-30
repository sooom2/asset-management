package com.itwillbs.moneytto.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.vo.ResponseTokenVO;

@Service
public class BankApiService {
	
	@Autowired
	BankApiClient apiClient;

	// 토큰 요청
	public ResponseTokenVO requestToken(Map<String, String> authResponse) {
		// BankApiClient - requestToken() 메서드 호출 후 결과값 리턴
		return apiClient.requestToken(authResponse);
//		return null;
	}
	
}











