package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketMessage;

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
//	public List<HashMap<String, String>> getMyChatAllList(String id) {
//		return mapper.myChatAllList(id);
//	}
	
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
	// 최근 채팅내역
	public HashMap<String, Integer> getMyChatRecentList(String id) {
		return mapper.chatRecentList(id);
	}
	
	//  roomcode로 아이템코드 알아내기 얻기
	public HashMap<String, String> getItem_code(int room_code) {
		return mapper.item_code(room_code);
	}
	
	//판매상태관리
	public int updateStatus(String item_status, String item_code) {
		return mapper.updateStatus(item_status,item_code);
	}
	
	// 채팅방 생성 가능한지 유무확인
	public int insertChatRoom(String item_code, String id) {
		return mapper.isInsertChatRoom(item_code,id);
	}
	
	
	//거래내역업데이트
	public int insertMarketPaid(HashMap<String, String> item_detail, String oppenentId) {
		return mapper.insertMarketPaid(item_detail,oppenentId);
	}
	// 거래내역삭제
	public int deltMarketPaid(HashMap<String, String> item_detail, String oppenentId) {
		return mapper.delMarketPaid(item_detail,oppenentId);
	}
	
	// 거래내역업데이트가능한지확인
	public int isUpdate(String item_code) {
		return mapper.isUpdate(item_code);
	
	}
	public HashMap<String, Integer> getItemDetail(String item_code) {
		return mapper.itemDetail(item_code);
	}
	
	//다음 룸코드
	public int getNextRoomCode() {
		return mapper.nextRoomCode();
	}
	
	//채팅방생성
	public int insertChatRoom(String roomCode, String itemCode, String messages) {
		return mapper.insertChatRoom(roomCode,itemCode,messages);
	}
	
	//판매자아이디찾기
	public HashMap<String, String> getSellID(String item_code) {
		return mapper.sellId(item_code);
	}
	
	//채팅내용 insert
	public int insertChatMessages(String room_code, String sellId, String buyId, String messages, String myId) {
		return mapper.insertChatMessages(room_code,sellId,buyId,messages,myId);
	}
	
	//마지막룸코드
	public int lastRoomCode() {
		return mapper.lastRoomCode();
	}


}
