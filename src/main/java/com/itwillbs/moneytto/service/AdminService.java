package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public int registAuction(Map<String, String> auction) {
		return mapper.registAuction(auction);
	}

	public int registImage(Map<String, String> images) {
		return mapper.registImage(images);
	}

	// 1. 거래량 조회
	public List<HashMap<String, String>> selectTradeChart(HashMap<String, String> map) {
		return mapper.selectTradeChart(map);
	}

	// 2. 관리자 카테고리별 차트
	public List<HashMap<String, String>> selectCategoryChart(HashMap<String, String> map) {
		return mapper.selectCategoryChart(map);
	}

	// 3. 관리자 직거래, 안전거래 비교 차트
	public List<HashMap<String, String>> selectPayTypeChart(HashMap<String, String> map) {
		return mapper.selectPayTypeChart(map);
	}


	
}
