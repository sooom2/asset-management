package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.MarketMapper;

@Service
public class MarketChatService {

	@Autowired
	private MarketMapper mapper;

	//채팅방 item 정보
	public HashMap<String, String> getItem(String item_code) {
		return mapper.getItem(item_code);
	}
	// 상품판매상세정보
	public HashMap<String, String> getSellDetail(String item_code) {
		return mapper.sellDetail(item_code);
	}
	
	// item_code 없을때
	public HashMap<String, String> getItem() {
		return mapper.getAllItem();
	}


	//판매자 물건 판매갯수
//	public int getSellCount(String member_id) {
//		return mapper.sellCount(member_id);
//	}

	//내 채팅목록
	public List<HashMap<String, String>> getMyChatList(String id) {
		return mapper.myChatList(id);
	}
	public List<HashMap<String, String>> getMyChatAllList(String id) {
		return mapper.myChatAllList(id);
	}
	
	//채팅상세정보
	public List<HashMap<String, String>> getChatDetail(int room_code) {
		return mapper.chatDetail(room_code);
	}
	
	/*======================================================================*/
	
	//아이템 상세 리스트
	public HashMap<String, String> getItemList(String item_code){
		return mapper.itemList(item_code);
	}
//	public List<HashMap<String, String>> getChatSubject(String id) {
//		return mapper.chatSubject(id);
//	}
	//상대방 물건 판매개수
	public int getSellCount(String openentId) {
		return mapper.sellCount(openentId);
	}
	
	//상대방 아이디 알아내기
	public HashMap<String, String> getOppenentId(int room_code,String ssesion_id) {
		return mapper.opponentId(room_code,ssesion_id);
	}
	





}
