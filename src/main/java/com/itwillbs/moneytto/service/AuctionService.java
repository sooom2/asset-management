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
	
	
	public List<HashMap<String, String>> selectAuction() {
		return mapper.selectAuction();
	}

	public HashMap<String, String> selectAuctionCode(String auction_code) {
		return mapper.selectAuctionCode(auction_code);
	}

	public int insertEnroll(String auction_code, String id) {
		return mapper.insertEnroll(auction_code, id);
	}

	public HashMap<String, String> selectAuctionEnroll(String auction_code, String id) {
		return mapper.selectAuctionEnroll(auction_code, id);
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
//	public HashMap<String, String> insertAuctionRoom(String auction_code) {
//		return mapper.insertAuctionRoom(auction_code);
//	}

}
