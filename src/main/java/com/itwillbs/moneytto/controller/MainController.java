package com.itwillbs.moneytto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.moneytto.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model) {
		List newsList = mainService.getNewsInfo();
		model.addAttribute("newsList", newsList);
		
		return "main";
	}
	
	@GetMapping("/chat")
	public String chat() {
		
		return "chat/chat";
	}
	

	
	
}
