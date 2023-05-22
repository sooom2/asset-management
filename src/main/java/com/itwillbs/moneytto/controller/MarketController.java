package com.itwillbs.moneytto.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.moneytto.service.MarketChatService;
import com.itwillbs.moneytto.service.MarketService;
import com.itwillbs.moneytto.service.MemberService;




@Controller
public class MarketController {
	
	@Autowired
	private MarketService service;
	
	@Autowired
	private MarketChatService marketChatservice;
	
	@Autowired
	private MemberService memberService;
	
	
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
	public String marketChat(Model model,HttpSession session,@RequestParam(defaultValue = "") String item_code) {
		System.out.println(item_code);
		
		//내닉네임
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		String nickname = member.get("member_nickname");
		model.addAttribute("nickname",nickname);
		
		
		//상대방정보
		String sellNick = "보부상";
		model.addAttribute("sellNick",sellNick);
		
		//물건조회
		HashMap<String, String> itemDetail = marketChatservice.getItem(item_code);
		
		//전체목록
		if(item_code==null) {
			
		}
		System.out.println(itemDetail);
		
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
