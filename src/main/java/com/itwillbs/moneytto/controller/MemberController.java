package com.itwillbs.moneytto.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberController {
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String main() {
//		
//		
//		
//		return "";
//	}
	
	//회원인증폼
	@GetMapping(value = "memAuth")
	public String memAuth() {
		return "member/join_auth_form";
	}
	
	// 회원가입폼
	@GetMapping(value = "joinform")
	public String joinform() {
		return "member/mem_join_form";
	}
}
