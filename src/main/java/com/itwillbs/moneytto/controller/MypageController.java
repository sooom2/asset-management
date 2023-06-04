package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
	
	@Value("${client_id}")
	private String client_id;
	
	// 마이페이지 메인
	@RequestMapping(value ="mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam(name ="itemList" , defaultValue = "sellItem") String itemType
						,HttpSession session, Model model, String member_id) {
		String sId = (String)session.getAttribute("sId");
		
		if(member_id == null && sId == null ) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		if(member_id == null  ||  sId == member_id) {
			member_id = sId;
			HashMap<String, String> account = bankService.getAccount(member_id);
			model.addAttribute("client_id", client_id);
			
		}
		
		List<HashMap<String,String>> itemList = null;
		
	    switch (itemType) {
		    case "sellItem" : itemList  = memberService.getSellItemList(member_id); break;
		    case "wishItem" : itemList  = memberService.getWishItemList(member_id); break;
	        case "buyItem" 	: itemList  = memberService.getBuyItemList(member_id); break;
	    }
	    
	    HashMap<String,String> member = memberService.getMember(member_id);
	    
	    model.addAttribute("member", member);
	    
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
		
		
		// 파일 업로드
		// 3) 입력받은 사진 이미지 설정
		// 기본 파일 "http://c3d2212t3.itwillbs.com/images/member/profile_default.jpg"
		if(!file.isEmpty() ) {
			// 실제 파일 저장 경로
			String uploadDir = session.getServletContext().getRealPath("/resources/upload/member");
			// 파일 확장자
	        String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
	        // 변환된 파일 이름
	        String storedFileName = UUID.randomUUID().toString().substring(0,8) + "." + fileExtension;
	        // 저장될 로컬 파일 경로
	        String filePath = uploadDir + "/" + storedFileName;
	        // DB에 저장될 이름
	        String saveDir = "http://c3d2212t3.itwillbs.com/images/member/" + storedFileName;
	        
	        try {
				file.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				// 사진 저장 실패 
				e.printStackTrace();
				model.addAttribute("msg", "프로필 이미지 등록에 실패했습니다.\n 마이페이지에서 수정할 수 있습니다.");
				return "fail_back";
			}
	        member.put("member_image", saveDir);
		}
        
        member.putAll(paramMember);
        
        int updateCount = memberService.updateMember(member);
        
        if(updateCount > 0) {
        	
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