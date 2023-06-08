package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;

import com.itwillbs.moneytto.mapper.AuctionMapper;

@Service
public class AuctionService {
	@Autowired
	private AuctionMapper mapper;
	
	
	public List<HashMap<String, String>> selectAuction(HashMap<String, String> map) {
		return mapper.selectAuction(map);
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
	public int insertAuctionLog(String id, String messages, String auctionCode) {
		return mapper.insertAuctionLog(id, messages, auctionCode);
	}

	// 경매 상세 기록 검색
	public List<HashMap<String, String>> selectAuctionLog(String auction_code) {
		return mapper.selectAuctionLog(auction_code);
	}
	
	// 경매 기록 최고값 검색
	public HashMap<String, String> selectLastLog(String auction_code) {
		return mapper.selectLastLog(auction_code);
	}

	// 나의 경매 기록
	public HashMap<String, String> selectMyLog(String id, String auction_code) {
		return mapper.selectMyLog(id, auction_code);
	}

	public int updateAuctionFinish(String auction_code, String success_id, String success_price) {
		return mapper.updateAuctionFinish(auction_code, success_id, success_price);
	}



}
