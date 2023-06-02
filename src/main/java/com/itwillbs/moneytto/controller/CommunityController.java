package com.itwillbs.moneytto.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping(value = "commBoard")
	public String commBoard(Model model,HttpSession session) {
		
		
		return "board/community";
	}

}
