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
		
		String nickname = null;
		
		if (id != null) {
		    HashMap<String, String> member = memberService.getMember(id);
		    System.out.println(member);
		    nickname = member.get("member_nickname");
		}
		
		
		model.addAttribute("nickname",nickname);
		model.addAttribute("newsList", newsList);
		
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
	
	// 로그아웃
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		System.out.println("================================");
		System.out.println(session.getAttribute("sId"));
		System.out.println("================================");
		try {
	        if (session != null) {
	            session.invalidate();
	        }
	    } catch (IllegalStateException e) {
	        // 세션이 이미 만료된 경우 처리
	        e.printStackTrace();
	    }
	    return "redirect:/main";
	}
	
	
}
