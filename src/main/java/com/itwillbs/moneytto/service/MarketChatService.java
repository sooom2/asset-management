package com.itwillbs.moneytto.service;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.moneytto.mapper.BankMapper;
import com.itwillbs.moneytto.mapper.MarketMapper;

@Service
public class MarketChatService {

	@Autowired
	private MarketMapper mapper;
	
	@Autowired
	private BankMapper bankMapper;

	//채팅방 item 정보
	public HashMap<String, String> getItem(String item_code) {
		return mapper.getItem(item_code);
	}
	// 상품판매상세정보
	public HashMap<String, String> getSellDetail(int room_code) {
		return mapper.sellDetail(room_code);
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
	public HashMap<String, String> getOpponentId(int room_code,String session_id) {
		return mapper.opponentId(room_code,session_id);
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
	public int isInsertChatRoom(String item_code, String id) {
		return mapper.isInsertChatRoom(item_code,id);
	}
	
	
	//거래내역업데이트
	
	public int insertMarketPaid(HashMap<String, String> item_detail, String sellId,String buyId,String trade_date,String str) {

		return mapper.insertMarketPaid(item_detail,sellId,buyId,trade_date,str);
				
	}
	
	
	// 거래내역삭제
	public int deltMarketPaid(HashMap<String, String> item_detail, String sellId) {
		return mapper.delMarketPaid(item_detail,sellId);
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
	String dd;
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
	//룸코드있는지
	public int roomCodeExists(String room_code) {
		return mapper.roomCodeExists(room_code);
	}
	public int updateChatRoom(String messages, String room_code) {
		return mapper.updateChatRoom(messages,room_code);
	}
	//최근 메시지
	public HashMap<String, String> getRecentlyMsg(String room_code) {
		return mapper.recentlyMsg(room_code);
	}
	public int getRoomCode(String item_code,String id) {
		return mapper.roomCode(item_code,id);
	}
	public int getTradeDateUpdate(String trade_date,int room_code) {
		return mapper.tradeDateUpdate(trade_date,room_code);
	}
	public HashMap<String, String> getTradeDate(int room_code) {
		System.out.println("service : "+room_code);
		return mapper.tradeDate(room_code);
	}
	public int updateTradeEnd() {
		// TODO Auto-generated method stub
		return mapper.updateTradeEnd();
	}
	//나간방 여부
	public List<HashMap<String, String>> existChatList(String room_code,String id) {
		return mapper.existChatList(room_code,id);
	}
	//리뷰있는지 확인
	public int isReview(String item_code) {
		return mapper.isReview(item_code);
	}
	public HashMap<String, String> getMarketPaid(String item_code) {
		return mapper.marketPaid(item_code);
	}
	public int pointWithDraw(String id, int itemPrice) {
		return mapper.pointWithDraw(id,itemPrice);
	}
	public int updateTradeSuccess(String item_code) {
		return mapper.tradeSuccess(item_code);
	}
	public int pointDeposit(String sellId, int itemPrice) {
		return mapper.pointDeposit(sellId,itemPrice);
	}
	
	//TODO 06.11 19:08 채팅방 나가기 YN 설정
	public int updateExistStatus(String room_code) {
		return mapper.updateExistStatus(room_code);
	}
	
	@Transactional
	public int updateHistory(HashMap<String, String> review) {
		//TODO 포인트 내역찍기
		//TODO 멤버 포인트 충전해주기
		
		HashMap<String,String> item = mapper.marketItem(review.get("item_code"));
		System.out.println(item);  
		review.put("trade_code", UUID.randomUUID().toString().substring(0, 8));
		review.put("id", review.get("target_id"));    
		review.put("trade_type", "거래대금지급");  
		review.put("trade_amount", item.get("item_price"));
//		review.put("trade_date", item.get("item_date").toString());
		
		int insertCount1 = bankMapper.insertPointHistory(review);
		int updateCount1 = bankMapper.updatePointAmount(review);
		
		if(insertCount1 > 0 && updateCount1  > 0 ) return 1;
		return 0;
	}


}
