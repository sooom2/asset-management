package com.itwillbs.moneytto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookController {
	
	@RequestMapping(value = "accountBook", method = RequestMethod.GET)
	public String accountBookMain() {
		
		
		return "accountBook/accountBookMain";
	}
	
	@RequestMapping(value = "goalForm", method = RequestMethod.GET)
	public String goalForm() {
		
		
		return "accountBook/goalForm";
	}
	
	@RequestMapping(value = "goalDetailForm", method = RequestMethod.POST)
	public String goalDetailForm() {
		
		
		return "accountBook/goalForm";
	}
	
	@RequestMapping(value = "graphForm", method = RequestMethod.GET)
	public String graphForm() {
		
		
		
		return "accountBook/graphForm";
	}
	
}
