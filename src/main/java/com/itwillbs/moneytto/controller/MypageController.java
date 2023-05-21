package com.itwillbs.moneytto.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.moneytto.service.MarketService;
import com.itwillbs.moneytto.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MarketService MarketService;
	
	// 마이페이지 메인
	@RequestMapping(value ="mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		
//		if(id == null) {
//			model.addAttribute("msg", "로그인 후 시도해주세요.");
//			model.addAttribute("target","memLogin");
//			return "success";
//		}
		
		
		HashMap<String,String> member = memberService.getMember(id);
		model.addAttribute("member", member);
		/*
		//TODO 
		List<HashMap<String,String>> itemList = marketService.getItemList(id);
		model.addAttribute("itemList", itemList);
		*/

		List<HashMap<String,String>> wishList = memberService.getWishList(id);
		model.addAttribute("wishList", wishList);
		
		System.out.println(member);
		
		return "mypage/mypage";
	} 
		
	@GetMapping(value = "mypageFavorite")
	public String mypageFavorite() {
		return "mypage/mypage_favorite";
	}
 
	//회원정보수정
	@GetMapping(value = "mypageInfo")
	public String mypageI(HttpSession session, Model model) {
//		String id = (String)session.getAttribute("sId");
//		
//		List<HashMap<String, String>> cinemaList = service.cinemaList(id);
//		model.addAttribute("cinemaList", cinemaList);
//		
//		
//		if(id ==null) {
//			
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			return "fail_back";
//			
//		}
//		
//		MemberVO member = service.getMemberInfo(id);
//		model.addAttribute("member", member);
//		
		return "mypage/mypage_info_form";
	}
	

}