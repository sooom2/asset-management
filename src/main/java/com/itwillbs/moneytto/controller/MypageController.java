package com.itwillbs.moneytto.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String mypage(@RequestParam(name ="itemList" , defaultValue = "sellItem") String itemType
						,HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			model.addAttribute("msg", "로그인 후 시도해주세요.");
			model.addAttribute("target","memLogin");
			return "success";
		}
		
		List<HashMap<String,String>> itemList = null;
		
		HashMap<String,String> member = memberService.getMember(id);
		System.out.println(member);
		System.out.println(member.get("member_X") +" " + member.get("member_Y"));
		model.addAttribute("member", member);
		
		System.out.println("itemType : " + itemType);

	    switch (itemType) {
		    case "sellItem" : itemList  = memberService.getSellItemList(id); break;
		    case "wishItem" : itemList  = memberService.getWishItemList(id); break;
	        case "buyItem" 	: itemList  = memberService.getBuyItemList(id); break;
	    }
	    
	    System.out.println(itemType);
	    System.out.println(itemList);
	    
	    model.addAttribute("itemList", itemList);

		return "mypage/mypage";
	} 
 
	//회원정보수정
	@GetMapping(value = "mypageInfo")
	public String mypageI(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		
		if(id ==null) {
			
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
			
		}
//		
//		MemberVO member = service.getMemberInfo(id);
//		model.addAttribute("member", member);
//		
		return "mypage/mypage_info_form";
	}
// 계좌인증
	@GetMapping(value = "memberAuth")
	public String memberAuth(@RequestParam Map<String, String> authResponse, Model model, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		if(id ==null) {
			
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
			
		}
		String code = authResponse.get("code").toString();
		
		System.out.println(authResponse.toString());
		
		System.out.println("code: "+ code);
		
		int updateCount = memberService.setAuth(id);
		if(updateCount > 0) {
			model.addAttribute("msg", "인증이 완료되었습니다.");
			return "mypage/close_redirect";
		}else {
			model.addAttribute("msg", "인증에 실패하였습니다.\n 다시 시도해주세요.");
			return "mypage/close_redirect";
		}
	}
		// 결제
		@RequestMapping(value = "pay", method = {RequestMethod.GET, RequestMethod.POST})
		public String store_pay(HttpSession session, Model model) {
//			HashMap<String, String> item = service.selectCode(item_code);
			String id = (String)session.getAttribute("sId");
//			HashMap<String, String> member = service.selectMemberId(id);
//			model.addAttribute("item", item);
//			model.addAttribute("item_price", item_price);
//			model.addAttribute("member", member);
//			
//			// 포인트 조회
//			String point = service.selectPoint(id);
//			model.addAttribute("point", point);
//			model.addAttribute("item_count", item_count);
//			if(id == null) {
//				model.addAttribute("msg", "로그인 후 이용가능합니다.");
//				model.addAttribute("target", "memLogin");
//				return "success";
//			} else {
//				return "store/store_pay";
//			}
			return "mypage/mypage_pay";
		}
		
	
	@GetMapping(value = "payCharge")
	public String payCharge() {
		
		return "market/market_payment";
		
	}
	

}