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

}
