package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.moneytto.service.BankService;
import com.itwillbs.moneytto.service.MailSendService;
import com.itwillbs.moneytto.service.MemberService;

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
	public String joinPro(@RequestParam HashMap<String, String> member
							,Model model, HttpSession session
							,@RequestParam("file") MultipartFile file) {
		
		// 1) 암호화된 비밀번호 생성 
		String securePasswd = new BCryptPasswordEncoder().encode(member.get("member_pw"));
		
		member.put("member_pw", securePasswd);
		// 2) 입력받은 주소를 위도와 경도로 변환
		String location = memberService.setLocation(member.get("member_address"));
		
		member.put("member_location",location);		
		
		member.put("member_image", "http://c3d2212t3.itwillbs.com/images/member/profile_default.jpg");
		// 3) 입력받은 사진 이미지 설정
		// 기본 이미지 설정 안하면 통과하게.. 
		if(member.get("file") != null) {
			
			// 실제 파일 저장 경로
			String uploadDir = session.getServletContext().getRealPath("/resources/upload/member");
			// 파일 확장자
	        String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
	        // 변환된 파일 이름
	        String storedFileName = UUID.randomUUID().toString().substring(0,8) + "." + fileExtension;
	        // 저장될 로컬 파일 경로
	        String filePath = uploadDir + "/" + storedFileName;
	        // DB에 저장될 이름
	        String saveDir = "http://c3d2212t3.itwillbs.com/Moneytto/resources/upload/member" + storedFileName;
	        
	        try {
				file.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				// 사진 저장 실패 
				e.printStackTrace();
				model.addAttribute("msg", "프로필 이미지 등록에 실패했습니다.\n 마이페이지에서 수정할 수 있습니다.");
			}
	        member.put("member_image", saveDir);
		}
		
		int insertCount = memberService.registMember(member);
		
		if(insertCount > 0) { // 가입 성공
			
			model.addAttribute("member", member);
			
			return "member/mem_join_success";
			
		} 
		 // 가입 실패
		model.addAttribute("msg", "회원 가입에 실패했습니다. 입력된 정보를 다시 확인해주세요.");
		
		return "fail_back";
		
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
		    	session.setAttribute("member_image", member.get("member_image"));
		        session.setAttribute("sId", member.get("member_id"));
		        session.setAttribute("token", "true");
		        session.setAttribute("nickname", member.get("member_nickname"));
		       
				// 만약, 계좌 정보가 존재할 경우(account != null)
		        HashMap<String, String> account = bankService.getAccount(member.get("member_id"));
				if(account != null) {
					// 세션 객체에 access_token, user_seq_no 저장
					System.out.println("==================================");
					System.out.println("account : " + account);
					System.out.println("==================================");
					
					session.setAttribute("access_token", account.get("access_token"));
					session.setAttribute("user_seq_no", account.get("user_seq_no"));
				}
				
				
		        return "redirect:/main";
		    }
	    
	    }

	    model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
	    return "fail_back";
	}
	
	// ******************************************************************
	//네이버 로그인 확인
	@RequestMapping(value = "naverLogin", method = {RequestMethod.GET, RequestMethod.POST})
	public String naver(@RequestParam HashMap<String, String> paramMap,  Model model,HttpSession session) {
		
		
			model.addAttribute("isClose", true);
			model.addAttribute("msg", "네이버 로그인 인증에 성공하였습니다.");
			model.addAttribute("target", "joinform");
			
		return "success";
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
	
	//알람페이지
	@GetMapping("todayAlarm")
	public String todayAlram(HttpSession session,Model model) {
		String id = (String)session.getAttribute("sId");
		List<HashMap<String, String>> chatList = memberService.getChat(id);
		List<HashMap<String, String>> report = memberService.getReport(id);
		List<HashMap<String, String>> point = memberService.getPoint(id);
		List<HashMap<String, String>> auction = memberService.getAuction(id);
		
		String opponentId = null;
		
		System.out.println(auction);
		
		System.out.println(chatList);
		model.addAttribute("opponentId",opponentId);
		model.addAttribute("chatList",chatList);
		model.addAttribute("report",report);
		model.addAttribute("point",point);
		model.addAttribute("auction",auction);
		
		return "mypage/my_alarm";
	}
}
