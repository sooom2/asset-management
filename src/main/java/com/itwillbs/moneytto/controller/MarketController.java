package com.itwillbs.moneytto.controller;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.moneytto.service.MarketService;


@Controller
public class MarketController {
	
	@Autowired
	private MarketService service;
	
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
	
	
	@PostMapping(value="itemRegistPro")
	public String itemRegistPro(@RequestParam HashMap<String, String> item, Model model) {
		int insertCount = service.insertItem(item);
		
		if(insertCount > 0) {
			
			model.addAttribute("msg", "상품이 등록되었습니다.");
			model.addAttribute("target", "main");
			
			return "success";
		} else {
			model.addAttribute("msg", "상품 등록에 실패하였습니다.");
			
			return "fail_back";
		}
		
	}
	
}