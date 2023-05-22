package com.itwillbs.moneytto.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.moneytto.service.*;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService service;
	
	// 경매 메인페이지
	@RequestMapping(value = "auctionMain", method = RequestMethod.GET)
	public String auctionMain() { 
		// 이미지 코드와 경매 코드를 찾아서 목록 뿌리기
		
		return "auction/auctionMain";
	}
	
	// 실시간 경매
	@RequestMapping(value="auction", method = RequestMethod.GET)
	public String auction() { // 이미지 코드와 경매 코드를 받아서 목록 상세
		
		
		
		return "auction/auction";
	}
	
	// 기간 경매
	@RequestMapping(value="auctionPeriod", method = RequestMethod.GET)
	public String auctionPeriod() { // 이미지 코드와 경매 코드를 받아서 목록 상세
		return "auction/auctionPeriod";
	}
	
	// 완료된 경매
	@RequestMapping(value="auctionFinish", method = RequestMethod.GET)
	public String auctionFinish() { // 이미지 코드와 경매 코드를 받아서 목록 상세
		return "auction/auctionFinish";
	}
	
	
}

