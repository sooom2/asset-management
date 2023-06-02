package com.itwillbs.moneytto.controller;

import java.util.HashMap;
import java.util.List;

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

import com.itwillbs.moneytto.service.BankService;
import com.itwillbs.moneytto.service.MailSendService;
import com.itwillbs.moneytto.service.MemberService;
import com.itwillbs.moneytto.vo.AccountVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BankService bankService;
	
	@Autowired
	private MailSendService mailService;
	
// 회원가입==========================================================================================================================	
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
	@RequestMapping(value = "joinPro", method = RequestMethod.POST)
	public String joinPro(@RequestParam HashMap<String, String> member, Model model) {
		
		String securePasswd = new BCryptPasswordEncoder().encode(member.get("member_pw"));
		
		// 좌표
		String location = memberService.setLocation(member.get("member_address"));
		member.put("member_location",location);
		
		member.put("member_pw", securePasswd);
		int insertCount = memberService.registMember(member);
		
		if(insertCount > 0) { // 가입 성공
			model.addAttribute("member", member);
			return "member/mem_join_success";
			
		} else { // 가입 실패
			model.addAttribute("msg", "회원 가입 실패!");
			
			return "member/fail_back";
		}
	}
// 카카오 회원가입
	@PostMapping(value = "kakaoJoin")
	public String kakaoJoin(@RequestParam HashMap<String, String> kakao, Model model) {
		
		if(kakao.get("email") != null) {
			model.addAttribute("email", kakao.get("email"));	
		}
		
		System.out.println(kakao);
		return "member/mem_join_form";
	}
// ==============================================================================================================================	
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
		        session.setAttribute("nickname", member.get("member_nickname"));
		       
				// 만약, 계좌 정보가 존재할 경우(account != null)
		        AccountVO account = bankService.getAccount(member.get("member_id"));
				if(account != null) {
					// 세션 객체에 access_token, user_seq_no 저장
					session.setAttribute("access_token", account.getAccess_token());
					session.setAttribute("user_seq_no", account.getUser_seq_no());
				}
				
				
		        return "redirect:/";
		    }
	    
	    }

	    model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
	    return "fail_back";
	}
	
	// ******************************************************************
	//네이버 로그인 확인
	@RequestMapping(value = "naverLogin", method = {RequestMethod.GET, RequestMethod.POST})
	public String naver(@RequestParam HashMap<String, String> authResponse) {
		 //{code=3HMEvZRJNVlJr4pbpw, state=63fbad94-92d6-45b2-9eb3-b879e454a289}
//		HashMap<String, String> responseToken = memberService.requestToken(authResponse);
		
//		System.out.println("authResponse : " + authResponse);
		return "member/mem_join_form";
	}
	
	// 카카오 로그인 확인
	@PostMapping(value = "kakaoLogin")
	public String kakao(@RequestParam HashMap<String, String> kakao, Model model, HttpSession session) {
		
		HashMap<String, String> member = memberService.kakaoMember(kakao.get("email"));
		session.setAttribute("token", kakao.get("accessToken"));
		System.out.println(member);
		
		// 회원 판별
		if(member == null) {
			model.addAttribute("msg", "회원이 아닙니다. 회원가입 페이지로 이동합니다.");
			model.addAttribute("target", "joinform?email=" + kakao.get("email"));
			
			return "success";
			
		} else {
			session.setAttribute("sId", member.get("member_id"));
			
			return "redirect:/main";
		}
		
	}

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
		
		return mailService.joinEmail(email);
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
	// 비밀번호 찾기
	@GetMapping(value = "findPw")
	public String findPw() {
		
		return "member/mem_find_pw";
		
	}
	
	// SMS 인증
	@GetMapping(value = "phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam String phone) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		memberService.certifiedPhoneNumber(phone, randomNumber);
		
		return Integer.toString(randomNumber);
	}
	
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
	public String renewPwPro(@RequestParam String member_id
							,@RequestParam String member_pw
							,Model model) {
							 
		// 해싱 -> success 페이지 -> memLogin
		
		HashMap<String, String> member = memberService.getMember(member_id);
		
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    String hashedPassword = member.get("member_pw");
		String securePasswd = passwordEncoder.encode(member_pw);
		
		
	   if (passwordEncoder.matches(member_pw, hashedPassword)) {
		   	model.addAttribute("msg", "기존 비밀번호와 동일하게 설정할 수 없습니다.");
			return "fail_back";
	    }
		   
		member.put("member_pw", securePasswd);
		int updateCount = memberService.renewPw(member);
		if(updateCount > 0) {
			model.addAttribute("msg", "비밀번호 재설정이 완료되었습니다.");
			model.addAttribute("target", "memLogin");
			return "success";
		}else {
			model.addAttribute("msg", "비밀번호를 확인해주세요.");
			return "fail_back";
		}
		
	}
	
	// 아이디 사용 조회
	@GetMapping(value = "MemberCheckId")
	@ResponseBody
	public boolean memberCheckId(@RequestParam String id) {
		boolean result = false;
		
		HashMap<String, String> member = memberService.checkId(id);
		
		if(member != null)	{
			result = true; 
		}
		
		return result;
	}
	
	@PostMapping(value = "clickWish")
	@ResponseBody
	public boolean clickWish(@RequestParam("item_code") String item_code, HttpSession session) {
		boolean result = false;
		String id = (String)session.getAttribute("sId");
		System.out.println("컨트롤러 확인");
		System.out.println(item_code);
		List<HashMap<String, String>> wishitem = memberService.getWishItem(id,item_code);
		System.out.println(wishitem);
		if(wishitem.isEmpty()) {
			memberService.insertWish(id, item_code);
			System.out.println("성공");
			result = true;
		}else {
			memberService.deleteWish(id, item_code);
			System.out.println("삭제");
			result = true;
		}
		
		
		return result; 
	}
}
