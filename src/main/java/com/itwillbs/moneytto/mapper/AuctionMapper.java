package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface AuctionMapper {

	List<HashMap<String, String>> selectAuction(HashMap<String, String> map);

	HashMap<String, String> selectAuctionCode(String auction_code);

	int insertEnroll(@Param("auction_code") String auction_code,@Param("id") String id);

	HashMap<String, String> selectAuctionEnroll(@Param("auction_code") String auction_code,@Param("id") String id);

	// 소켓 사용한 경매 기록 저장
	int insertAuctionLog(@Param("id") String id, @Param("messages") String messages, @Param("auctionCode") String auctionCode);

	// 경매 기록 방
	HashMap<String, String> selectAuctionRoom(String auction_code);

	// 경매 상세 기록 검색
	List<HashMap<String, String>> selectAuctionLog(@Param("auction_code") String auction_code, @Param("auction_type") String auction_type);

	// 경매 기록 최고값 검색
	HashMap<String, String> selectLastLog(@Param("auction_code")String auction_code);

	// 나의 경매 기록
	HashMap<String, String> selectMyLog(@Param("id") String id, @Param("auction_code") String auction_code);

	int updateAuctionFinish(@Param("auction_code") String auction_code,@Param("success_id") String success_id, @Param("success_price") String success_price);
	// 내가 입찰한 경매 목록 06.08 14:41 추가 mypage에서 사용함
	// ==========================================================
	List<HashMap<String, String>> selectMyAuctionByNickname(String id);
	
	List<HashMap<String, String>> selectMyAuctionByMember(HashMap<String, String> member);
	// ==========================================================

	int insertPayResult(Map<String, String> map);

	List<HashMap<String, String>> selectMyAuctionPaid(HashMap<String, String> member);

	HashMap<String, String> selectAuctionPaid(String auction_code);

}
