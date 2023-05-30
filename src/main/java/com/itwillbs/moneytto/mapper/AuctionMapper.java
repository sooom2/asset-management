package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.*;

public interface AuctionMapper {

	// 경매 메인페이지
	List<HashMap<String, String>> selectAuction();

	// 실시간 경매
	HashMap<String, String> selectAuctionCode(String auction_code);

	// 소켓 사용한 경매 기록 저장
	int insertAuctionLog(@Param("id") String id, @Param("messages") String messages);

	// 경매 기록 검색
	HashMap<String, String> selectAuctionLog(String id);

}
