package com.itwillbs.moneytto.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	// 관리자 페이지
	@RequestMapping(value = "admin", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminMain(Model model,HttpSession session) {
			

			
		return "admin/admin_main";
	}
	
	
	
	
	

}
