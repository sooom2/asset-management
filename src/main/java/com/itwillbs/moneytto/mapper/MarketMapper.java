 package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.*;

public interface MarketMapper {

	int insertItem(HashMap<String, String> item);

	//채팅방 item 정보
	HashMap<String, String> getItem(String item_code);
	// 상품판매상세정보
	HashMap<String, String> sellDetail(String item_code);
	
	// item_code 없을때 
	HashMap<String, String> getAllItem();
	
	//상대방물건판매갯수
	int sellCount(String openentId);
	// 채팅방개설가능한지
	int isInsertChatRoom(@Param("item_code") String item_code,@Param("id") String id);

	// 내채팅목록
	List<HashMap<String, String>> myChatList(String id);
	List<HashMap<String, String>> myChatAllList(String id);

	//상대방 아이디알아내기
	HashMap<String, String> opponentId(@Param("room_code") int room_code,@Param("ssesion_id") String ssesion_id);
	
	//아이템상세목록
	HashMap<String, String> itemList(String item_code);

	//채팅상세내용
	List<HashMap<String, String>> chatDetail(int room_code);

	// 마켓 메인 아이템 리스트	//05.27 id 추가
	List<HashMap<String, String>> marketItemList(@Param("item_category") String item_category, 
			@Param("item_status") String item_status, 
			@Param("item_price_min") String item_price_min,
			@Param("item_price_max") String item_price_max, 
			@Param("member_grade") String member_grade,
			@Param("sort") String sort,
			@Param("member_id") String member_id);

	void saveImage(HashMap<String, String> saveImage);

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
	int insertMarketPaid(@Param("item_detail") HashMap<String, String> item_detail, @Param("oppenentId") String oppenentId);
	
	// 거래내역 삭제
	int delMarketPaid(@Param("item_detail") HashMap<String, String> item_detail, @Param("oppenentId") String oppenentId);

	//업데이트 가능한지
	int isUpdate(String item_detail);

	HashMap<String, Integer> itemDetail(String item_code);

	


}
