package com.itwillbs.moneytto.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.moneytto.service.*;

@Controller
public class MemberController {
	@Autowired
	private MailSendService mailService;
	
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String main() {
//		
//		
//		
//		return "";
//	}
	
	//회원인증폼
	@GetMapping(value = "memAuth")
	public String memAuth() {
		return "member/join_auth_form";
	}
	
	// 회원가입폼
	@GetMapping(value = "joinform")
	public String joinform() {
		return "member/mem_join_form";
	}
	
	// 회원가입
	@PostMapping(value = "joinPro")
	public String joinPro(@RequestParam HashMap<String, String> member, Model model) {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		String securePasswd = passwordEncoder.encode(member.get("member_pw"));
//		String member_address = member.get("member_address1") + "/" + member.get("member_address2");
//		member.put("member_pw", securePasswd);
//		member.put("member_address", member_address);
//		
//		int insertCount = service.registMember(member);
//		if(insertCount > 0) { // 가입 성공
//			service.insertPoint(member.get("member_id"));
			return "member/mem_join_success";
//		} else { // 가입 실패
//			model.addAttribute("msg", "회원 가입 실패!");
//			return "member/fail_back";
		}
			
	//회원로그인
	@GetMapping(value = "memLogin")
	public String memLogin() {
		return "member/mem_login_form";
	}
	
	// 이메일 인증
	@GetMapping(value = "mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println(email);
		return mailService.joinEmail(email);
	}
}
