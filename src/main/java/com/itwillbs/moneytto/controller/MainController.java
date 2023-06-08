package com.itwillbs.moneytto.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
		
		String id = (String)session.getAttribute("sId");
		
		// 파라미터 없이 LIMIT 10만 넣어서 대충 만들어둔 상태
		List<HashMap<String,String>> itemList = mainService.getMainItemList(id);
		
		model.addAttribute("itemList", itemList);
		
		System.out.println("==================================");
		System.out.println("메인 아이템 : ");
		System.out.println("==================================");
		
		return "main";
	}
	
	@GetMapping("/myAlarm")
	public String chat(Model model,HttpSession session) {
		
		//session아이디로 닉네임
		String id = (String)session.getAttribute("sId");
		if (id != null) {
		    HashMap<String, String> member = memberService.getMember(id);
		    String nickname = member.get("member_nickname");
		    model.addAttribute("nickname",nickname);
		}
		
		
		return "mypage/my_alarm";
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
