package com.itwillbs.moneytto.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.moneytto.service.AdminService;
import com.itwillbs.moneytto.service.AuctionService;
import com.itwillbs.moneytto.service.BankService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private BankService bankService;
	
	// =============================================
	@RequestMapping(value = "admin")
	public String adminMain(Model model) {
			
		return "admin/admin_main";
	}
	// =============================================
	@RequestMapping(value = "adminSocialAccount")
	public String adminSocialAccount(Model model) {
		return "admin/adminSocialAccount";
	}
	@RequestMapping(value = "adminSocialChat")
	public String adminSocialChat() {
		
		return "admin/adminSocialChat";
	}
	
	@RequestMapping(value = "adminReport")
	public String adminReport() {
		
		return "admin/adminReport";
	}
	// =============================================
	@RequestMapping(value = "adminNoticeBoard")
	public String adminNoticeBoard(Model model) {
		return "admin/adminNoticeBoard";
	}
	@RequestMapping(value = "adminFreeBoard")
	public String adminFreeBoard() {
		
		return "admin/adminFreeBoard";
	}
	// =============================================
	// 관리자 경매
	@GetMapping("/adminAuction")
	public String adminAuction(Model model) {
		
		// 경매 목록 검색
		List<HashMap<String, String>> auction = auctionService.selectAuction();
		model.addAttribute("auction", auction);
		System.out.println("adminAuction에서" + auction);
		
		return "admin/adminAuction";
	}
	
	
	@PostMapping("/auction_regist")
	public String auction_regist(@RequestParam Map<String, String> auction, HttpSession session, Model model) {
		
		// auction_code 생성, 추가
		String uuid = UUID.randomUUID().toString().substring(0, 8);
		auction.put("auction_code", uuid);
		
		int insertCount = service.registAuction(auction);
		
		if(insertCount > 0) { // 성공
			
			// 이미지 테이블 추가.
			Map<String, String> images = new HashMap<String, String>();
			images.put("image_code", (new Random().nextInt(1000000) + 1) + "");
			images.put("table_code", uuid);
			images.put("image_name", auction.get("image_name"));
			
			int insertImage = service.registImage(images);
			
			// 이미지 등록 성공
			if(insertImage > 0) {
				return "redirect:/adminAuction";
				
			} else {
				model.addAttribute("msg", "이미지 등록 실패!");
				return "fail_back";
			}
			
		} else { // 실패
			model.addAttribute("msg", "경매 등록 실패!");
			return "fail_back";
		}
		
	}
	
	
	// =============================================
	
	
	@RequestMapping(value = "adminChatBot")
	public String adminChatBot() {
		
		return "admin/adminChatBot";
	}
	// =============================================
	@RequestMapping(value = "adminMember")
	public String adminMember() {
		
		return "admin/adminMember";
	}
	
	// =============================================
	// 관리자 계좌
	@RequestMapping(value = "adminAccount")
	public String adminAccount(Model model) {
		
		// 계좌내역 조회
//		List<HashMap<String, String>> accountHistory = bankService.selectAccountHistory();
//		model.addAttribute("accountHistory", accountHistory);
//		System.out.println("adminAccount에서" + accountHistory);
		
		return "admin/adminAccount";
	}
}
