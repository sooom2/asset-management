 package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.socket.WebSocketMessage;
import org.apache.ibatis.annotations.*;

public interface MarketMapper {

	// 상품등록
	int insertItem(HashMap<String, String> item);

	// 채팅방 item 정보
	HashMap<String, String> getItem(String item_code);
	// 상품판매상세정보
	HashMap<String, String> sellDetail(int item_code);
	
	// item_code 없을때 
	HashMap<String, String> getAllItem();
	
	// 상대방물건판매갯수
	int sellCount(String openentId);
	

	// 채팅방개설가능한지
	int isInsertChatRoom(@Param("item_code") String item_code,@Param("id") String id);

	//채팅방 생성
	int insertChatRoom(@Param("roomCode") String roomCode,@Param("itemCode") String itemCode,@Param("messages") String messages);
	
	
	// 내채팅목록
	List<HashMap<String, String>> myChatList(String id);
	List<HashMap<String, String>> myChatAllList(String id);

	//상대방 아이디알아내기
	HashMap<String, String> opponentId(@Param("room_code") int room_code,@Param("session_id") String session_id);
	
	//아이템상세목록
	HashMap<String, String> itemList(String item_code);

	//채팅상세내용
	List<HashMap<String, String>> chatDetail(int room_code);

	// 마켓 메인 아이템 리스트	//05.27 id 추가
	List<HashMap<String, String>> marketItemList(@Param("item_category") String item_category, 
			@Param("item_tag") String item_tag, 
			@Param("item_status") String item_status, 
			@Param("item_price_min") String item_price_min,
			@Param("item_price_max") String item_price_max, 
			@Param("member_grade") String member_grade,
			@Param("sort") String sort,
			@Param("member_id") String member_id);

	int saveImage(HashMap<String, String> saveImage);

	String selectItem();

	//채팅
	HashMap<String, Integer> chatRecentList(String id);

	//상태업데이트
	int updateStatus(@Param("item_status") String item_status,@Param("item_code") String item_code);

	// 아이템코드 알아내기
	HashMap<String, String> item_code(int room_code);

	// 아이템 상세
	HashMap<String, String> marketItem(String item_code);

	
	// 거래내역업데이트
	int insertMarketPaid(@Param("item_detail") HashMap<String, String> item_detail, @Param("sellId") String sellId,@Param("buyId") String buyId,@Param("trade_date") String trade_date);
	
	// 거래내역 삭제
	int delMarketPaid(@Param("item_detail") HashMap<String, String> item_detail, @Param("sellId") String sellId);

	//업데이트 가능한지
	int isUpdate(String item_detail);

	HashMap<String, Integer> itemDetail(String item_code);

	// 상품수정
	int updateItem(HashMap<String, String> item);

	HashMap<String, String> selectBuyItem(@Param("member_id")String id, @Param("item_code")String item_code);
	// 리뷰 추가 05.28
	int insertReview(HashMap<String, String> review);

	int updateReview(HashMap<String, String> review);
	
	// 다음방번호찾기
	int nextRoomCode();


	//판매자아이디 찾기
	HashMap<String, String> sellId(String item_code);
	
	// 마지막 룸코드
	int lastRoomCode();

	// 채팅내용 insert
	int insertChatMessages(@Param("room_code") String room_code, @Param("sellId") String sellId, @Param("buyId") String buyId, @Param("messages") String message, @Param("myId") String myId);
	// 메인 아이템리스트
	List<HashMap<String, String>> selectItemList(String member_id);

	// 아이템 이미지
	List<HashMap<String, String>> selectItemImage(String item_code);

	// 신고
	int insertReport(@Param("id") String id, @Param("targetId") String targetId, @Param("reportType") String reportType, @Param("reportContent") String reportContent);

	// 아이템 이미지 삭제 
	int removeImage(String itemCode);

	//룸코드 존재하는지
	int roomCodeExists(String room_code);

	//룸테이블 업데이트
	int updateChatRoom(@Param("messages") String messages,@Param("room_code") String room_code);

	HashMap<String, String> recentlyMsg(String room_code);

	//대화방있을때 룸코드 찾기
	int roomCode(@Param("item_code") String item_code,@Param("id") String id);

	int deleteItem(HashMap<String, String> item);

	// 거래일정 업데이트
	int tradeDateUpdate(@Param("trade_date") String trade_date,@Param("room_code") int room_code);

	// 거래일정 찾기
	HashMap<String, String> tradeDate(int room_code);

	int updateTradeEnd();


}
