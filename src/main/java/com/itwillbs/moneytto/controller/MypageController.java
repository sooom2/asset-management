package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

import com.itwillbs.moneytto.service.BankService;
import com.itwillbs.moneytto.service.MarketService;
import com.itwillbs.moneytto.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MarketService marketService;
	
	@Autowired
	private BankService bankService;
	
	
	
	// 마이페이지 메인
	@RequestMapping(value ="mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam(name ="itemList" , defaultValue = "sellItem") String itemType
						,HttpSession session, Model model, String member_id) {
		String id = (String)session.getAttribute("sId");
		
		// 입력받은 member_id가 없고 sId도 없으면
		// 널체크
		if(id == null && member_id == null) {					// 나가
			model.addAttribute("msg", "잘못된 접근입니다.");
		}
		// 입력받은 member_id 가 sId랑 같을때
		if(id == member_id) {	// 마이페이지

		}
		// 입력받은 member_id 가 없고 sId가 있으면   
		if(member_id == null || id != null) {	// 마이페이지
			
		}
		// 입력받은 member_id가 sId랑 다를때 유어페이지
		if(member_id != id) {	// 타인페이지
			
		}
		
		
		
		List<HashMap<String,String>> itemList = null;
		
		HashMap<String,String> member = memberService.getMember(id);
		
		HashMap<String, String> account = bankService.getAccount(id);
		
		System.out.println(member);
		
		System.out.println("itemType : " + itemType);

	    switch (itemType) {
		    case "sellItem" : itemList  = memberService.getSellItemList(id); break;
		    case "wishItem" : itemList  = memberService.getWishItemList(id); break;
	        case "buyItem" 	: itemList  = memberService.getBuyItemList(id); break;
	    }
	    
	    System.out.println(itemType);
	    System.out.println(itemList);
	    
	    model.addAttribute("member", member);
	    model.addAttribute("itemList", itemList);
	    //TODO
//	    if(account.get("balance_amt") == null) {
//	    	model.addAttribute("balance_amt", account.get("balance_amt"));
//	    }
	    
	    
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
		// 결제
		@RequestMapping(value = "pay", method = {RequestMethod.GET, RequestMethod.POST})
		public String store_pay(HttpSession session, Model model) {
//			HashMap<String, String> item = service.selectCode(item_code);
//			String id = (String)session.getAttribute("sId");
//			HashMap<String, String> member = service.selectMemberId(id);
//			model.addAttribute("item", item);
//			model.addAttribute("item_price", item_price);
//			model.addAttribute("member", member);
//			
//			if(id == null) {
//				model.addAttribute("msg", "로그인 후 이용가능합니다.");
//				model.addAttribute("target", "memLogin");
//				return "success";
//			} else {
//				return "store/store_pay";
//			}
			return "naver";
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
		
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		//기존 정보
		/*
		 * TODO itemRegist 이미지 파일 prameter 확인
		 * 
		{file=KakaoTalk_20211001_141932875.jpg, member_nickname=꾸꾸꾸, member_pw=12345678, member_pw3=12345678
		, member_name=꾸꾸펀치, member_address=부산 부산진구 동성로 2, member_address_detail=포동포동, member_email=test@test.com
		, member_bday=19900101, member_tel=01011112456}
		KakaoTalk_20211001_141932875.jpg
		*/

		//입력한 정보
		System.out.println(paramMember);
		
		String member_pw = paramMember.get("member_pw");
		String member_pw2 = paramMember.get("member_pw3");	//css 상으로 member_pw3이 들어와서
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedMember_pw = member.get("member_pw");
					
		if(member_pw == null || !passwordEncoder.matches(member_pw2, encodedMember_pw)){
			
			model.addAttribute("msg", "정보를 수정하려면 기존의 비밀번호와 일치해야 합니다!");
			return "fail_back";
		}
		
		paramMember.put("member_pw2", passwordEncoder.encode(member_pw2));
		// 입력한 주소로 location 설정
		paramMember.put("member_location", memberService.setLocation(paramMember.get("member_address")));
		
		member.putAll(paramMember);
		// 파일 업로드
		String uploadDir = session.getServletContext().getRealPath("/resources/upload/member");
		
        String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
        
        String uuid = UUID.randomUUID().toString();
        
        String storedFileName = uuid.substring(0,8) + "." + fileExtension;
        
        String filePath = uploadDir + "/" + storedFileName;
        String saveDir = "http://c3d2212t3.itwillbs.com/images/member/" + storedFileName;
        // 사진을 저장하는 경로
        // /resources/upload/member
        // 사진을 읽어오는 절대 경로
        // "http://c3d2212t3.itwillbs.com/images/member/profile_default.jpg"
        member.put("member_image", saveDir);
        
        System.out.println(filePath);
        
        int updateCount = memberService.updateMember(member);
        
        if(updateCount > 0) {
        	
	        try {
	        	// 본인 서버 /resources/upload/member 내부에 저장
				file.transferTo(new File(filePath));		// 이 이름으로 저장
				// 사진 정보를 저장
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
	        model.addAttribute("msg", "회원정보수정성공!");
			model.addAttribute("target", "mypage");
			session.setAttribute("member_image", member.get("member_image"));
			
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