package com.itwillbs.moneytto.socket;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.itwillbs.moneytto.service.MarketChatService;

public class MarketChatSocketHandler extends TextWebSocketHandler {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MarketChatSocketHandler.class);
	
	private Map<String, ArrayList<WebSocketSession>> marketList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();

	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	
	private static int i;
	
	@Autowired
	MarketChatService marketChatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		
	}

	@Override  
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String msg = (String)message.getPayload();
		JSONObject jObject = new JSONObject(msg);
	    String name = jObject.getString("name");
	    String messages = jObject.getString("message");
	    String target = jObject.getString("target");
	    String room_code = jObject.getString("room_code");
	    String item_code = jObject.getString("item_code");
	    System.out.println("===========================");
	    System.out.println("상대방 id : "+ target);
		System.out.println("name : " + name); // 
		System.out.println("messages : " + messages);
		System.out.println("room_code : " + room_code);
		System.out.println("item_code : " + item_code);
		System.out.println("===========================");
		
		// 채팅 세션 목록에 채팅방이 존재 X
		
		if(marketList.get(room_code) == null && messages.contains(name)) {
			System.out.println("===========================");
			System.out.println("채팅방 생성됬니");
			System.out.println("marketList.get(room_code) == null");
            // 채팅방에 들어갈 sessionList 생성
            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
            // session 추가
            sessionTwo.add(session);
            // sessionList에 추가
            sessionList.put(session, room_code);
            // RoomList에 추가
            marketList.put(room_code, sessionTwo);
            
            System.out.println(marketList);
            
		}
            // 채팅방이 존재 할 때
		else if(marketList.get(room_code) != null && messages.contains(name)) {
	            // RoomList 코드 확인
			marketList.get(room_code).add(session);
	            // sessionList에 추가
			sessionList.put(session, room_code);
			System.out.println("===========================");
			System.out.println("생성된 "+room_code+"번 채팅방으로 입장");
			System.out.println("===========================");
	            	
     
		}

		// 채팅 메세지 입력 시
		else if(marketList.get(room_code) != null && !messages.contains(name)) {
			// 채팅 출력
			
			System.out.println("===========================");
			System.out.println(room_code);
			System.out.println("===========================");
			TextMessage textMessage = new TextMessage(name + ":" + messages);
                
			int sessionCount = 0;
     
			// 해당 코드에 session에 뿌려줌.
			for(WebSocketSession sess : marketList.get(room_code)) {
				sess.sendMessage(textMessage);
				sessionCount++;
			}
                
            String sellId = target;
            System.out.println("===============================");
            System.out.println(room_code+", "+sellId+", "+name+", "+messages+", "+name);
            System.out.println("===============================");
            
           
            int insertChatMessages = marketChatService.insertChatMessages(room_code,sellId,name,messages,name);
    	}

	}
            
        
       
		
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		i--;
//		System.out.println(session.getId() + " 연결 종료 / 총 접속 인원 : " + i + "명");
        // sessionList에 session이 있다면
        if(sessionList.get(session) != null) {
            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
        	marketList.get(sessionList.get(session)).remove(session);
            sessionList.remove(session);
        }
		
		
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}

	

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

}
