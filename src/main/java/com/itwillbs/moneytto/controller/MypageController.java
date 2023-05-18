package com.itwillbs.moneytto.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MypageController {
	
//	@Autowired
//	private MypageService service;
//	@Autowired
//	private BoardService boardService;

	// 마이페이지 메인
	@GetMapping(value ="mypage")
	public String mypage(HttpSession session) {
//		String id = (String)session.getAttribute("sId");
//		
//		if(id ==null) {
//			return "redirect:/memLogin";
//		}
//		
//		
//		member= service.getMemberInfo(id);
//		model.addAttribute("member", member);
		
		return "mypage/mypage_sale";
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
		
		return "mypage/mypage_info_form";
	}
	

}