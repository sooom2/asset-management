package com.itwillbs.moneytto.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

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
		
		// 년 월 일
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		String formatedNow = now.format(formatter);
		
		model.addAttribute("formatedNow", formatedNow);
		model.addAttribute("auction", auction);
		
		
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

