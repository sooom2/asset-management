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
	public int getSellCount(String member_id) {
		return mapper.sellCount(member_id);
	}

	//내 채팅목록
	public List<HashMap<String, String>> getMyChatList(String id) {
		return mapper.myChatList(id);
	}
	public List<HashMap<String, String>> getMyChatAllList(String id) {
		return mapper.myChatAllList(id);
	}
	
	//아이템 상세 리스트
	public HashMap<String, String> getItemList(String item_code){
		return mapper.itemList(item_code);
	}
	// 마켓 메인 아이템 리스트
	public List<HashMap<String, String>> getMarketItemList() {
		return mapper.marketItemList();
	}




}
