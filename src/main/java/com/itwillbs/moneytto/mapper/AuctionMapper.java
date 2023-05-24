package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

public interface AuctionMapper {

	// 경매 메인페이지
	List<HashMap<String, String>> selectAuction();

	// 실시간 경매
	HashMap<String, String> selectAuctionCode(String auction_code);

}
