package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.itwillbs.moneytto.mapper.AuctionMapper;

@Service
public class AuctionService {
	@Autowired
	private AuctionMapper mapper;
	
	// 경매 메인페이지
	public List<HashMap<String, String>> selectAuction() {
		return mapper.selectAuction();
	}

	// 실시간 경매
	public HashMap<String, String> selectAuctionCode(String auction_code) {
		return mapper.selectAuctionCode(auction_code);
	}

}
