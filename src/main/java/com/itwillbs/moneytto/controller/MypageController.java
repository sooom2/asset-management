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

import com.itwillbs.moneytto.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService service;

	// 마이페이지 메인
	@RequestMapping(value ="mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session) {
		String id = (String)session.getAttribute("sId");
//		
//		if(id ==null) {
//			return "redirect:/memLogin";
//		}
//		
//		
//		member= service.getMemberInfo(id);
//		model.addAttribute("member", member);
		List<HashMap<String,String>> wishList = service.getWishList(id);
		
		return "mypage/mypage";
	} 
	
	
//	@GetMapping(value = "mypageSale")
//	public String mypageSale() {
//		return "mypage/mypage_sale";
//	}
	
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