package com.itwillbs.moneytto.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.moneytto.service.BankApiService;
import com.itwillbs.moneytto.service.BankService;
import com.itwillbs.moneytto.service.MemberService;
import com.itwillbs.moneytto.vo.AccountDetailVO;
import com.itwillbs.moneytto.vo.AccountWithdrawResponseVO;
import com.itwillbs.moneytto.vo.ResponseTokenVO;
import com.itwillbs.moneytto.vo.ResponseUserInfoVO;

@Controller
public class BankController {
	@Autowired
	private BankApiService apiService;
	
	@Autowired
	private BankService bankService;
	
	private static final Logger logger = LoggerFactory.getLogger(BankController.class);
	
	// 사용자 인증 요청에 대한 응답 처리 및 엑세스 토큰 발급 요청 후 결과 처리
	@GetMapping("/memberAuth")
	public String responseAuthCode(
			@RequestParam Map<String, String> authResponse, HttpSession session, Model model) {
		logger.info(authResponse.toString());
		
		// 인증 실패 시(인증 정보 존재하지 않을 경우) 오류 메세지 출력 및 인증창 닫기
		if(authResponse == null || authResponse.get("code") == null) {
			model.addAttribute("msg", "인증 오류 발생! 다시 인증하세요!");
			model.addAttribute("isClose", true); // 창 닫기 명령
			return "fail_back";
		}
		
		// 토큰 발급 요청(REST 방식 = REST API 활용)
		// BankApiService - requestToken() 메서드를 호출하여 엑세스 토큰 발급 요청
		// => 파라미터 : 사용자 인증을 통해 전달받은 정보(Map 객체)
		// => 리턴타입 : 응답되는 엑세스토큰 관련 정보를 관리할 ResponseTokenVO 타입
		ResponseTokenVO responseToken = apiService.requestToken(authResponse);
		logger.info("★★★★★ Access Token : " + responseToken.toString());
		
		// 토큰 발급 실패 시 오류 메세지 출력 및 인증창 닫기
		if(responseToken.getAccess_token() == null) {
			model.addAttribute("msg", "토큰 발급 오류 발생! 다시 인증하세요!");
			model.addAttribute("isClose", true); // 창 닫기 명령
			return "fail_back";
		}
		
		// BankService - writeToken() 메서드를 호출하여
		// 토큰 관련 정보를 fintech3.account 테이블에 저장
		// => 파라미터 : 아이디, 토큰 정보가 저장된 ResponseTokenVO 객체
		// => 리턴타입 : int(insertCount)
		int insertCount = bankService.writeToken((String)session.getAttribute("sId"), responseToken);
		
		// 토큰 발급 실패 시 오류 메세지 출력 및 인증창 닫기
		if(insertCount == 0) {
			model.addAttribute("msg", "토큰 발급 오류 발생! 다시 인증하세요!");
			model.addAttribute("isClose", true); // 창 닫기 명령
			return "fail_back";
		}
		
		// 세션 객체에 엑세스토큰(access_token)과 사용자번호(user_seq_no) 저장
		session.setAttribute("access_token", responseToken.getAccess_token());
		session.setAttribute("user_seq_no", responseToken.getUser_seq_no());
		
		// model 객체에 target 속성으로 리다이렉트할 페이지 저장(bank_userInfo)
		model.addAttribute("target", "bank_userInfo");
		
		// 성공 처리를 위한 success.jsp 페이지로 포워딩
		// => isClose 속성값을 true 로 전달
		model.addAttribute("isClose", true);
		return "success";
	}
	
	// 사용자 정보 조회
	@GetMapping("/bank_userInfo")
	public String requestUserInfo(HttpSession session, Model model) {
		// 세션에 저장된 엑세스 토큰 및 사용자 번호 변수에 저장
		String access_token = (String)session.getAttribute("access_token");
		String user_seq_no =  (String)session.getAttribute("user_seq_no");
		System.out.println("access_token : " + access_token);
		System.out.println("user_seq_no : " + user_seq_no);
		
		// access_token 이 null 일 경우 "계좌 인증 필수" 메세지 출력 후 이전페이지로 돌아가기
		if(access_token == null) {
			model.addAttribute("msg", "계좌 인증 필수!");
			return "fail_back";
		}
		
		// 사용자 정보 조회(REST API 요청)		
		// BankApiService - requestUserInfo() 메서드 호출
		// => 파라미터 : 엑세스토큰, 사용자번호   리턴타입 : ResponseUserInfoVO(userInfo)
		ResponseUserInfoVO userInfo = apiService.requestUserInfo(access_token, user_seq_no);
		System.out.println(userInfo);
		
		// Model 객체에 ResponseUserInfoVO 객체 저장
		model.addAttribute("userInfo", userInfo);
		
		return "admin/bank_user_info";
	}
	
	// 계좌 상세정보 조회(2.3.1. 잔액조회 API)
	@PostMapping("bank_accountDetail")
	public String getAccountDetail(
			@RequestParam Map<String, String> map, HttpSession session, Model model) {
		// 미로그인 또는 엑세스토큰 없을 경우 "fail_back" 페이지를 통해
		// "권한이 없습니다!" 출력 후 이전페이지로 돌아가기
		if(session.getAttribute("sId") == null || session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "권한이 없습니다!");
			return "fail_back";
		}
		
		// 세션 객체의 엑세스 토큰을 Map 객체에 추가
		map.put("access_token", (String)session.getAttribute("access_token"));
		logger.info("★★★★★★ bank_accountDetail : " + map);
		
		// BankApiService - requestAccountDetail() 메서드를 호출하여
		// 계좌 상세정보 조회 요청
		// => 파라미터 : Map 객체   리턴타입 : AccountDetailVO(account)
		AccountDetailVO account = apiService.requestAccountDetail(map);
		
		// 응답코드(rsp_code)가 "A0000" 가 아니면 에러 상황이므로 에러 처리
		// => "정보 조회 실패!" 출력 후 이전페이지로 돌아가기(fail_bank)
		// => 출력메세지에 응답메세지(rsp_message) 도 함께 출력
		if(account == null) {
			model.addAttribute("msg", "정보 조회 실패");
			return "fail_back";
		} else if(!account.getRsp_code().equals("A0000")) {
			model.addAttribute("msg", "정보 조회 실패 - " + account.getRsp_message());
			return "fail_back";
		}
		
		System.out.println(account);
		
		//AccountDetailVO 객체 저장
		model.addAttribute("account", account);
		model.addAttribute("account_num_masked", map.get("account_num_masked"));
		model.addAttribute("user_name", map.get("user_name"));
		
		return "admin/bank_account_detail";
		
	}
	// 2.3.1 출금이체
	@PostMapping("bank_withdraw")
	public String withdraw(
			@RequestParam Map<String, String> map, HttpSession session, Model model) {
		map.put("access_token", (String)session.getAttribute("access_token"));
		
		AccountWithdrawResponseVO result = apiService.withdraw(map);
		System.out.println("result = " + result);
		
		return "bank/withdraw_result";
		
	}
	
	@PostMapping("bank_regist")
	public String bankRegist(Model model
			, HttpSession session
			, String fintech_use_num
			, String balance_amt) {
		
		String id = (String)session.getAttribute("sId");
		
		int insertCount = bankService.updateAccount(id, fintech_use_num, balance_amt);
		
		// 핀테크번호 등록 성공시 
		if(insertCount > 0) {
			
			return "redirect:/mypage";
			
		}
		
		model.addAttribute("msg", "계좌 등록에 실패하였습니다.\n 계좌정보를 확인해주세요.");
		
		return "fail_back";
		
	}
	
	
	
}
