package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

public interface MarketMapper {

	int insertItem(HashMap<String, String> item);

	//채팅방 item 정보
	HashMap<String, String> getItem(String item_code);
	// 상품판매상세정보
	HashMap<String, String> sellDetail(String item_code);
	
	// item_code 없을때 
	HashMap<String, String> getAllItem();
	
	// 판매갯수
	int sellCount(String member_id);

	// 내채팅목록
	List<HashMap<String, String>> myChatList(String id);

	List<HashMap<String, String>> myChatAllList(String id);

	//아이템상세목록
	HashMap<String, String> itemList(String item_code);

	// 아이템제목
//	List<HashMap<String, String>> chatSubject(String id);

	// 마켓 메인 아이템 리스트
	List<HashMap<String, String>> marketItemList();

	void saveImage(HashMap<String, String> saveImage);

	String selectItem();


}
