package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.moneytto.service.MarketService;
import com.itwillbs.moneytto.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MarketService marketService;
	
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
	@RequestMapping(value = "memberUpdateForm" , method = RequestMethod.GET)
	public String memberUpdate(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
			
		}
		HashMap<String, String>member = memberService.getMember(id);
		
		model.addAttribute("member", member);
		
		return "mypage/mypage_info_form";
	}
	// 계좌인증
	@RequestMapping(value = "memberAuth", method = RequestMethod.GET)
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
	//회원정보수정
	@PostMapping(value = "memberUpdatePro")
	public String updatePro(@RequestParam HashMap<String, String> paramMember,
							Model model, HttpSession session
							,@RequestParam("file") MultipartFile file) {
		//기존 정보
		/*
		 * TODO itemRegist 이미지 파일 prameter 확인
		 * 
		{file=KakaoTalk_20211001_141932875.jpg, member_nickname=꾸꾸꾸, member_pw=12345678, member_pw3=12345678
		, member_name=꾸꾸펀치, member_address=부산 부산진구 동성로 2, member_address_detail=포동포동, member_email=test@test.com
		, member_bday=19900101, member_tel=01011112456}
		KakaoTalk_20211001_141932875.jpg
		*/
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);

		//입력한 정보
		System.out.println(paramMember);
		System.out.println(file);
		
		String member_pw = paramMember.get("member_pw");
		String member_pw2 = paramMember.get("member_pw3");
		

		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedMember_pw = member.get("member_pw");
		
					
		if(member_pw == null || !passwordEncoder.matches(member_pw2, encodedMember_pw)){
			
			model.addAttribute("msg", "정보를 수정하려면 기존의 비밀번호와 일치해야 합니다!");
			return "fail_back";
		}
		// 비밀번호 검증 끝
		// 수정되는 항목 : 닉네임 & 비밀번호 & 주소 & location & 생년월일 & 휴대번호
		// 2. member_pw2를 새 비밀번호로  
		paramMember.put("member_pw2", passwordEncoder.encode(member_pw2));
		// 입력한 주소로 location 설정
		paramMember.put("member_location", memberService.setLocation(paramMember.get("member_address")));
		
		member.putAll(paramMember);
		
		String uploadDir = session.getServletContext().getRealPath("/resources/upload");
		
		String item_code = "member"+id;
        String fileName = file.getOriginalFilename();
        String fileExtension = FilenameUtils.getExtension(fileName);
        String storedFileName = UUID.randomUUID().toString() + "." + fileExtension;
        String filePath = uploadDir + "/" + storedFileName;
        
        
        System.out.println(filePath);
        
        
        try {
			file.transferTo(new File(filePath));
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        // 사진 정보를 저장
        HashMap<String, String> saveImage = new HashMap<>();
        saveImage.put("image_code", UUID.randomUUID().toString());
        saveImage.put("item_code", item_code);
        saveImage.put("image_name", fileName);

        // 사진 정보 저장 메서드 호출
        marketService.saveImage(saveImage);
        //이거 왜 void..?
		
		int updateCount = memberService.updateMember(member);
		
		if(updateCount > 0) {
			model.addAttribute("msg", "회원정보수정성공!");
			model.addAttribute("target", "mypage");
			return "success";
			
		} else {
			model.addAttribute("msg", "회원정보수정 실패!");
			return "fail_back";
		}
		
	}
	
	//회원탈퇴
	@RequestMapping(value = "memberQuitPro", method = RequestMethod.POST)
	public String quitPro(@RequestParam HashMap<String, String> member, HttpSession session, Model model ) {
		
		//세션아이디 저장
		String id = (String)session.getAttribute("sId");
		System.out.println(member);
//		String password = quit.get("member_pw");
//		
//		//아이디와 일치하는 레코드의 패스워드 조회
//		String dbPasswd = service.getPasswd(id);
//		
//		System.out.println("평문 암호 : " + password + ", 해싱 암호 : " + dbPasswd);
//		
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		
//		if(passwordEncoder.matches(password, dbPasswd)) {	
//			int deleteCount = service.quitMember(quit);
//			
//			if(deleteCount > 0) {
//				
//				session.invalidate();
//				model.addAttribute("msg", "탈퇴가 완료되었습니다!");
//				model.addAttribute("target", "main");
//				
//				return "success";
//			} else {
//				
//				model.addAttribute("msg", "탈퇴 실패!");
//				return "fail_back";
//				
//			}
//		
//		} else {
//			
//			model.addAttribute("msg", "권한이 없습니다!");
//			return "fail_back";
//		
//		}
		return "";
	}

}