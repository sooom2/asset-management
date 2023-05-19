package com.itwillbs.moneytto.controller;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.moneytto.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService marketService;
	
	@GetMapping(value = "market_list")
	public String marketList() {
		
		return "market/market_list";
	}
	@GetMapping(value = "market_detail")
	public String marketDetail() {
		
		return "market/market_detail";
	}
	@GetMapping(value = "market_payment")
	public String marketPayment() {
		
		return "market/market_payment";
	}
	
	@GetMapping(value = "itemRegist")
	public String itemRegist() {
		
		return "market/market_itemRegist";
	}
	
	@GetMapping(value = "marketChat")
	public String marketChat(Model model) {
		
		String myNick = "홍길동";
		String sellNick = "보부상";
		model.addAttribute("myNick",myNick);
		model.addAttribute("sellNick",sellNick);
		
		//오늘날짜
		
		Date now = new Date();
		System.out.println(now);
		model.addAttribute("now",now);
		return "market/market_chat";
	}
}
