package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface AuctionMapper {

	List<HashMap<String, String>> selectAuction();

	HashMap<String, String> selectAuctionCode(String auction_code);

	int insertEnroll(@Param("auction_code") String auction_code,@Param("id") String id);

	HashMap<String, String> selectAuctionEnroll(@Param("auction_code") String auction_code,@Param("id") String id);

	// 소켓 사용한 경매 기록 저장
	int insertAuctionLog(@Param("id") String id, @Param("messages") String messages, @Param("auctionCode") String auctionCode);

	// 경매 기록 방
	HashMap<String, String> selectAuctionRoom(String auction_code);

	// 경매 상세 기록 검색
	List<HashMap<String, String>> selectAuctionLog(@Param("auction_code") String auction_code);

	// 경매 기록 최고값 검색
	HashMap<String, String> selectLastLog(@Param("auction_code")String auction_code);

}
