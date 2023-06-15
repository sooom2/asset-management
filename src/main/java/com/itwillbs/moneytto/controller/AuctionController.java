package com.itwillbs.moneytto.controller;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.moneytto.service.AuctionService;
import com.itwillbs.moneytto.service.MemberService;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService service;
	
	@Autowired
	private MemberService memberService;
	
	// 경매 메인페이지
	@RequestMapping(value = "auctionMain", method = RequestMethod.GET)
	public String auctionMain(@RequestParam HashMap<String, String> map, Model model) { 
		// 이미지 코드와 경매 코드를 찾아서 목록 뿌리기
		List<HashMap<String, String>> auction = service.selectAuction(map);
		model.addAttribute("auction", auction);
		
		return "auction/auctionMain";
	}
	
	// 실시간 경매
	@RequestMapping(value="auction", method = RequestMethod.GET)
	public String auction(@RequestParam String auction_code, Model model, HttpSession session) { // 이미지 코드와 경매 코드를 받아서 목록 상세
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
		HashMap<String, String> member = memberService.getMember(id);
		model.addAttribute("auction", auction);
		model.addAttribute("member", member);
		
		// 년 월 일
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		String formatedNow = now.format(formatter);
		
		model.addAttribute("formatedNow", formatedNow);
		
		// 경매 등록 확인
		HashMap<String, String> auctionEnroll = service.selectAuctionEnroll(auction_code, id);
		
		// 방 번호 대신 방에 등록이 되었는지 저장해서 그걸로 확인
		boolean result = auctionEnroll != null ? true : false;
		model.addAttribute("auctionEnroll", result);
		
		// 경매 로그===============================================================================
		
		// 경매 기록(상세 내용) 검색
		List<HashMap<String, String>> auctionLog = service.selectAuctionLog(auction_code, auction.get("auction_type"));
		// 경매 기록 최고값 검색
		HashMap<String, String> lastLog = service.selectLastLog(auction_code);
		// 내가 입찰한 가격
		HashMap<String, String> myLog = service.selectMyLog(id, auction_code);
		boolean lastLogYN = lastLog != null ? true : false; 
		model.addAttribute("auctionLog", auctionLog);
		model.addAttribute("lastLog", lastLog);
		model.addAttribute("lastLogYN", lastLogYN);
		model.addAttribute("myLog", myLog);
		
		// 시작 가격 - 이건 계속 바뀌는 거 그래도 필요하네
		String price = Integer.parseInt(auction.get("auction_present_price").replace(",", "")) + "";
		model.addAttribute("price", price);
		// 보증금 계산 - 고정
		String deposit = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.1) + "";
		// 물건 호가 계산 - 고정
		String askingPrice = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.01) + "";
		// 즉시 구매 - 고정
		String purchase = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 1.8) + "";
//		int purchase = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 1.8);
		model.addAttribute("deposit", deposit);
		model.addAttribute("askingPrice", askingPrice);
		model.addAttribute("purchase", purchase);
		//================================================================================
		if(id == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "fail_back";
		}
		
		
		return "auction/auction";
	}
	
	// 기간 경매
	@RequestMapping(value="auctionPeriod", method = RequestMethod.GET)
	public String auctionPeriod(@RequestParam String auction_code, HttpSession session, Model model) { // 이미지 코드와 경매 코드를 받아서 목록 상세
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
		HashMap<String, String> member = memberService.getMember(id);
		model.addAttribute("auction", auction);
		model.addAttribute("member", member);
		// 년 월 일
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		String formatedNow = now.format(formatter);
		
		model.addAttribute("formatedNow", formatedNow);
		
		// 경매 등록 확인
		HashMap<String, String> auctionEnroll = service.selectAuctionEnroll(auction_code, id);
		
		// 방 번호 대신 방에 등록이 되었는지 저장해서 그걸로 확인
		boolean result = auctionEnroll != null ? true : false;
		model.addAttribute("auctionEnroll", result);
		
		// 경매 로그===============================================================================
		
		// 경매 기록(상세 내용) 검색
		List<HashMap<String, String>> auctionLog = service.selectAuctionLog(auction_code, auction.get("auction_type"));
		// 경매 기록 최고값 검색
		HashMap<String, String> lastLog = service.selectLastLog(auction_code);
		// 내가 입찰한 가격
		HashMap<String, String> myLog = service.selectMyLog(id, auction_code);
		boolean lastLogYN = lastLog != null ? true : false;
		model.addAttribute("auctionLog", auctionLog);
		model.addAttribute("lastLog", lastLog);
		model.addAttribute("lastLogYN", lastLogYN);
		model.addAttribute("myLog", myLog);
		
		// 시작 가격 - 이건 계속 바뀌는 거 그래도 필요하네
		String price = Integer.parseInt(auction.get("auction_present_price").replace(",", "")) + "";
		model.addAttribute("price", price);
		// 보증금 계산 - 고정
		String deposit = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.1) + "";
		// 물건 호가 계산 - 고정
		String askingPrice = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.01) + "";
		// 즉시 구매 - 고정
		String purchase = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 1.8) + "";
//		int purchase = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 1.8);
		model.addAttribute("deposit", deposit);
		model.addAttribute("askingPrice", askingPrice);
		model.addAttribute("purchase", purchase);
		//================================================================================
		if(id == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "fail_back";
		}
				
		
		return "auction/auctionPeriod";
	}
	
	// 완료된 경매
	@RequestMapping(value="auctionFinish", method = RequestMethod.GET)
	public String auctionFinish(@RequestParam String auction_code, Model model, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
		HashMap<String, String> member = memberService.getMember(id);
		model.addAttribute("auction", auction);
		model.addAttribute("member", member);
		
		// 경매 기록(상세 내용) 검색
		List<HashMap<String, String>> auctionLog = service.selectAuctionLog(auction_code, auction.get("auction_type"));
		// 경매 기록 최고값 검색
		HashMap<String, String> lastLog = service.selectLastLog(auction_code);
		model.addAttribute("auctionLog", auctionLog);
		model.addAttribute("lastLog", lastLog);
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "fail_back";
		}
		
		
		
		return "auction/auctionFinish";			
	}
	
	
	
	// 경매 입찰 등록
	@RequestMapping(value="auctionDeposit", method = RequestMethod.GET)
	public String auctionDeposit(@RequestParam HashMap<String, String> deposit, HttpSession session, Model model) {
		System.out.println(deposit);
		String id = (String)session.getAttribute("sId");
		String auction_code = deposit.get("auction_code");
		HashMap<String, String> member = memberService.getMember(id);
		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
		System.out.println(member);
		
		model.addAttribute("member", member);
		model.addAttribute("auction", auction);
		model.addAttribute("deposit", deposit.get("deposit"));
		
		
		return "auction/auctionDeposit";
	};
	
	@RequestMapping(value="auctionEnroll", method = RequestMethod.GET)
	public String auctionEnroll(@RequestParam String auction_code, @RequestParam String deposit, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		
		// 현재 포인트
		int member_point = Integer.parseInt(member.get("member_point"));
		
		// 보증금 차감
		int updatePoint = memberService.updatePoint(id, (member_point - Integer.parseInt(deposit)) + "");
		if(updatePoint > 0) {
			// 경매 등록
			int insertCount = service.insertEnroll(auction_code, id);
		}
		
		model.addAttribute("auction_code", auction_code);
		
		return "redirect:/auctionMain";
	};
	
	// 경매 결제 창
	@RequestMapping(value="auctionPay", method = RequestMethod.GET)
	public String auctionPay(@RequestParam Map<String, String> auctionPay, Model model, HttpSession session) {
		String id = (String)session.getAttribute("sId");
		DecimalFormat formatter = new DecimalFormat("###,###");
		HashMap<String, String> member = memberService.getMember(id);
		HashMap<String, String> auction = service.selectAuctionCode(auctionPay.get("auction_code"));
		// 경매 기록 최고값 검색
		HashMap<String, String> lastLog = service.selectLastLog(auctionPay.get("auction_code"));
		System.out.println(auction);
		model.addAttribute("member", member);
		model.addAttribute("auction", auction);
		model.addAttribute("lastLog", lastLog);
		
		// 결제 금액(낙찰가 - 보증금)
		int deposit = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.1);
		int payPrice = Integer.parseInt(lastLog.get("log_content")) - deposit;
		model.addAttribute("deposit", deposit);
		model.addAttribute("payPrice", formatter.format(payPrice));
		
//		model.addAttribute("deposit", payMap.get("deposit"));
		
//		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
//		model.addAttribute("auction", auction);
		System.out.println("auctionPay에서" + auction);
		System.out.println("auctionPay에서2" + member);
		
		return "auction/auctionPay";
	}
	
	// 결제 완료 
	@PostMapping("/auctionPayResult")
	public String auctionPayResult(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		// pay_code 생성, 추가
		String uuid = UUID.randomUUID().toString().substring(0, 8);
		map.put("pay_code", uuid);
		map.put("member_id", id);
		map.put("member_name", member.get("member_name"));
		// 결제 등록
		int insertCount = service.insertPayResult(map);
		
		// 포인트 차감
		int updateCount = memberService.updateMemberPoint(id, Integer.parseInt(map.get("pay_price")));
		
		if(insertCount > 0 && updateCount > 0) {
			return "redirect:/auctionMain";
		} else {
			model.addAttribute("msg", "결제에 실패하였습니다.");
			return "fail_back";
		}
		
	}
	
	// 결제 정보 페이지.
	@GetMapping("/auctionPayDetail")
	public String auctionPayDetail(@RequestParam Map<String, String> map, Model model) {
		HashMap<String, String> auction = service.selectAuctionPaid(map.get("auction_code"));
		model.addAttribute("auction", auction);
		
		return "auction/auctionPayDetail";
	}
	
	
	// 경매 종료 낙찰자 업데이트
	@RequestMapping(value="auctionUpdateFinish", method = RequestMethod.GET)
	@ResponseBody
	public void auctionUpdateFinish(@RequestParam Map<String, String> auction) {
		System.out.println(auction);
		// 경매 종료 낙찰자 -> '판매 완료', 낙찰자 이름 업데이트
		int updateCount = service.updateAuctionFinish(auction.get("auction_code"), auction.get("success_id"), auction.get("success_price"));
		
		// 보증금 입금
		int updatePoint = memberService.updateDeposit(auction.get("auction_code"), auction.get("success_id"), Integer.parseInt(auction.get("deposit")));
		
	}
	
	
	// 0524 test 여기서==========================
//	@Controller
//	public class ChatController {
		@RequestMapping(value = "/chat.action", method = { RequestMethod.GET })
		public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			return "auction/chat";
		}
//	}
	
	// 0524 test 여기까지==========================
	
}

