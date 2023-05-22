package com.itwillbs.moneytto.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.moneytto.service.MainService;
import com.itwillbs.moneytto.service.MemberService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model,HttpSession session) {
		List newsList = mainService.getNewsInfo();
		
		String id = (String)session.getAttribute("sId");
		System.out.println(id);
//		HashMap<String, String> member = memberService.getMember(id);
//		System.out.println(member);
//		String nickname = member.get("member_nickname");
		
		
//		model.addAttribute("nickname",nickname);
//		model.addAttribute("newsList", newsList);
		
		return "main";
	}
	
	@GetMapping("/myAlarm")
	public String chat() {
		
		return "mypage/my_alarm";
	}
	
	@GetMapping("/adminAuction")
	public String adminAuction() {
		
		return "adminAuction";
	}
	
	
}
