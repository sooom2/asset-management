package com.itwillbs.moneytto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
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
	
	@RequestMapping(value = "adminChatBot")
	public String adminChatBot() {
		
		return "admin/adminChatBot";
	}
	// =============================================
	@RequestMapping(value = "adminMember")
	public String adminMember() {
		
		return "admin/adminMember";
	}
}
