package com.itwillbs.moneytto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SocialController {
	
	@RequestMapping(value = "socialBook", method = RequestMethod.GET)
	public String main() {
		
		
		
		return "socialBook/socialBookMain";
	}
	
	
	@RequestMapping(value="chatPage", method = RequestMethod.GET)
	public String socialChat() {
		
		return "socialBook/socialChat";
	}
	
}

