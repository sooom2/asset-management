package com.itwillbs.moneytto.socket;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/echo")
public class WebSocketHandler extends TextWebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	List<WebSocketSession> sessionList = new ArrayList<>();
	
	private static int i;
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		i++;
		
	}

	@Override  
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String msg = (String)message.getPayload();
		JSONObject jObject = new JSONObject(msg);
	    String name = jObject.getString("name");
	    String messages = jObject.getString("message");
		System.out.println("name : " + name);
		System.out.println("messages : " + messages);
		
        
		
		for(WebSocketSession sess: sessionList) {
			sess.sendMessage(new TextMessage(name + ":" + messages + ":" + i));
		}
		
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		i--;
		sessionList.remove(session);
		
		
		
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}

	

	@Override
	public boolean supportsPartialMessages() {
		return false;
	}

}
