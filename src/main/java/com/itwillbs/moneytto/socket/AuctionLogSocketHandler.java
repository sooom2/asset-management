package com.itwillbs.moneytto.socket;

import java.util.*;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.itwillbs.moneytto.service.*;


public class AuctionLogSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private AuctionService service;

	private static final Logger logger = LoggerFactory.getLogger(AuctionLogSocketHandler.class);
	
	List<WebSocketSession> sessionList = new ArrayList<>();
	
	private static int i;
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
//		System.out.println(session);
		i++;
		
	}

	@Override  
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
		String msg = (String)message.getPayload();
		JSONObject jObject = new JSONObject(msg);
		String id = jObject.getString("id");
	    String name = jObject.getString("name");
	    String messages = jObject.getString("message");
//	    String enrollCode = jObject.getString("enrollCode");
	    String auctionCode = jObject.getString("auctionCode");
//	    System.out.println("id : " + id);
//		System.out.println("name : " + name);
//		System.out.println("logSocket - messages : " + messages);
//		System.out.println(session.getAttributes());
//		System.out.println(session);
//		System.out.println("sessionList : " + sessionList);
	    
	    // DB저장 방코드와 채팅코드도 넘겨야 하고 그건 컨트롤러에서 받을꺼고 페이지 들어올때
        int insertCount = service.insertAuctionLog(id, messages, auctionCode);
        if(insertCount > 0) {
        	for(WebSocketSession sess: sessionList) {
        		sess.sendMessage(new TextMessage(id + ":" + name + ":" + messages));
        	}
		} 
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		i--;
		sessionList.remove(session);
//		System.out.println(session);
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}

	

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

}
