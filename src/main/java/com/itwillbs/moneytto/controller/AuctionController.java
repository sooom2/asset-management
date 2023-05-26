package com.itwillbs.moneytto.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.moneytto.service.*;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService service;
	
	// 경매 메인페이지
	@RequestMapping(value = "auctionMain", method = RequestMethod.GET)
	public String auctionMain(Model model) { 
		// 이미지 코드와 경매 코드를 찾아서 목록 뿌리기
		List<HashMap<String, String>> auction = service.selectAuction();
		System.out.println(auction);
		model.addAttribute("auction", auction);
		
		
		return "auction/auctionMain";
	}
	
	// 실시간 경매
	@RequestMapping(value="auction", method = RequestMethod.GET)
	public String auction(@RequestParam String auction_code, Model model) { // 이미지 코드와 경매 코드를 받아서 목록 상세
		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
		System.out.println(auction);
		model.addAttribute("auction", auction);
		String price = Integer.parseInt(auction.get("auction_present_price").replace(",", "")) + "";
		model.addAttribute("price", price);
		// 보증금 계산
		String deposit = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.1) + "";
		// 물건 호가 계산
		String askingPrice = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.01) + "";
		// 즉시 구매
		String purchase = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 1.8) + "";
		model.addAttribute("deposit", deposit);
		model.addAttribute("askingPrice", askingPrice);
		model.addAttribute("purchase", purchase);
		
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
	
	
	
	// 0524 test 여기서==========================
//	@Controller
//	public class ChatController {
		@RequestMapping(value = "/chat.action", method = { RequestMethod.GET })
		public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			return "auction/chat";
		}
//	}
	
	// 0524 test 여기까지==========================
	
}

