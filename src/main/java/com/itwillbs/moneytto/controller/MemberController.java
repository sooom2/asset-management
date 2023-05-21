package com.itwillbs.moneytto.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.moneytto.service.MailSendService;
import com.itwillbs.moneytto.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailSendService mailService;
	
	
	//회원인증폼
	@GetMapping(value = "memAuth")
	public String memAuth() {
		return "member/join_auth_form";
	}
	
	// 회원가입폼
	@GetMapping(value = "joinform")
	public String joinform(String email, Model model) {
		System.out.println(email);
		
		model.addAttribute("email", email);
		return "member/mem_join_form";
	}
	
	// 회원가입
	@PostMapping(value = "joinPro")
	public String joinPro(@RequestParam HashMap<String, String> member, Model model) {
		
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(member.get("member_pw"));
		
		String member_address = member.get("member_address1") + "/" + member.get("member_address2");
		// 좌표
		HashMap<String, String> coord = memberService.setCoord(member.get("member_address"));
		member.putAll(coord);
		
		member.put("member_pw", securePasswd);
		member.put("member_email", "test@test.com");
		int insertCount = memberService.registMember(member);
		
		System.out.println(member);
		if(insertCount > 0) { // 가입 성공
			//memberService.insertPoint(member.get("member_id"));
			model.addAttribute("member", member);
			return "member/mem_join_success";
		} else { // 가입 실패
			model.addAttribute("msg", "회원 가입 실패!");
			return "member/fail_back";
		}
//		return "member/mem_join_success";
	}
	
	//회원 로그인 확인 
	@RequestMapping(value = "loginPro", method = RequestMethod.POST)
	public String loginPro(@RequestParam String member_id, @RequestParam String member_pw
							, Model model, HttpSession session) {

	    HashMap<String, String> member = memberService.getMember(member_id);
	    
	    if (member != null) {
	        String hashedPassword = member.get("member_pw");
		    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		    if (passwordEncoder.matches(member_pw, hashedPassword)) {
		        session.setAttribute("sId", member.get("member_id"));
		        session.setAttribute("token", "true");
		        return "redirect:/main";
		    }
	    
	    }

	    model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
	    return "fail_back";
	}
	
// ******************************************************************
// 네이버 로그인 확인
//		@RequestMapping(value = "naverLogin", method = {RequestMethod.GET, RequestMethod.POST})
//		public String naver(@RequestParam HashMap<String, String> naver) {
//			System.out.println(naver);
//			return "";
//		}
	
/*	
// 카카오 로그인 확인
	@PostMapping(value = "kakaoLogin")
	public String kakao(@RequestParam HashMap<String, String> kakao, Model model, HttpSession session) {
		
		HashMap<String, String> member = memberService.kakaoMember(kakao.get("email"));
		session.setAttribute("token", kakao.get("accessToken"));
		
		// 회원 판별
		if(member == null) {
			model.addAttribute("msg", "회원이 아닙니다. 회원가입 페이지로 이동합니다.");
			model.addAttribute("target", "joinform?email=" + kakao.get("email"));
			
			return "member/success";
			
		} else {
			session.setAttribute("sId", member.get("member_id"));
			
			return "redirect:/main";
		}
		
	}
// 카카오 회원가입
	@PostMapping(value = "kakaoJoin")
	public String kakaoJoin(@RequestParam HashMap<String, String> kakao, Model model) {
		model.addAttribute("email", kakao.get("email"));
		
		return "member/mem_join_form";
	}
*/
// ******************************************************************	
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
		return email;	//밑에걸로 수정 할 예정
//		return mailService.joinEmail(email);
	}
	
	// 아이디 찾기
	@GetMapping(value = "findId")
	public String findId() {
		
		return "member/mem_find_id";
	}
	
	// 아이디 찾기pro
	@PostMapping(value = "findIdPro")
	public String findIdPro(@RequestParam HashMap<String, String> member, Model model) {
		HashMap<String, String> success = memberService.findId(member);
		
		if(success == null) {
			model.addAttribute("msg", "회원정보가 일치하지 않습니다");
			return "fail_back";
		} else {
			model.addAttribute("member_id", success.get("member_id"));
			return "member/mem_find_idSuccess";
		}
	}
/*
	// SMS 인증
	@GetMapping(value = "phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam String phone) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		service.certifiedPhoneNumber(phone, randomNumber);
		
		return Integer.toString(randomNumber);
	}
*/
	
	// 비밀번호 재설정
	@RequestMapping(value = "renewPw", method = {RequestMethod.GET, RequestMethod.POST})
	public String renewPw(@RequestParam HashMap<String, String> member, Model model) {
		HashMap<String, String> result = memberService.phoneCheck(member);
		
		if(result == null) {
			model.addAttribute("msg", "회원정보가 일치하지 않습니다");
			return "member/fail_back";
		} else {
			model.addAttribute("member_id", member.get("member_id"));
			return "member/mem_find_renewPw";
		}
		
	}
	// 비밀번호 재설정pro
	@RequestMapping(value = "renewPwPro", method = {RequestMethod.GET, RequestMethod.POST})
	public String renewPwPro(@RequestParam HashMap<String, String> member, Model model) {
		// 해싱 -> success 페이지 -> memLogin
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(member.get("member_pw"));
		member.put("member_pw", securePasswd);
		int updateCount = memberService.renewPw(member);
		
		model.addAttribute("msg", "비밀번호 재설정이 완료되었습니다.");
		model.addAttribute("target", "memLogin");
		return "success";
	}
	
	// 아이디 사용 조회
	@GetMapping(value = "MemberCheckId")
	@ResponseBody
	public boolean memberCheckId(@RequestParam String id) {
		boolean result = false;
		
		HashMap<String, String> member = memberService.checkId(id);
		if(member == null) {
			result = false;
		} else {
			result = true;
		}
		
		return result;
	}
	
	// 로그아웃
	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}
	
}
