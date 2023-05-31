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


	// 소켓 사용한 경매 기록 저장
	public int insertAuctionLog(String id, String messages) {
		return mapper.insertAuctionLog(id, messages);
	}

	// 경매 기록 방
	public HashMap<String, String> selectAuctionRoom(String auction_code) {
		return mapper.selectAuctionRoom(auction_code);
	}

	// 경매 상세 기록 검색
	public List<HashMap<String, String>> selectAuctionLog(String id) {
		return mapper.selectAuctionLog(id);
	}

	// 경매 기록 방 저장
	public HashMap<String, String> insertAuctionRoom(String auction_code) {
		return mapper.insertAuctionRoom(auction_code);
	}

	
}
