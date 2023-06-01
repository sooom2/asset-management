package com.itwillbs.moneytto.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.moneytto.service.*;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService service;
	
	@Autowired
	private MemberService memberService;
	
	// 경매 메인페이지
	@RequestMapping(value = "auctionMain", method = RequestMethod.GET)
	public String auctionMain(Model model) { 
		// 이미지 코드와 경매 코드를 찾아서 목록 뿌리기
		List<HashMap<String, String>> auction = service.selectAuction();
		System.out.println(auction);
		model.addAttribute("auction", auction);
		
		
		return "auction/auctionMain";
	}
	
	// 실시간 경매
	@RequestMapping(value="auction", method = RequestMethod.GET)
	public String auction(@RequestParam String auction_code, Model model, HttpSession session) { // 이미지 코드와 경매 코드를 받아서 목록 상세
		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
		model.addAttribute("auction", auction);
		
		// 년 월 일
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		String formatedNow = now.format(formatter);
		
		model.addAttribute("formatedNow", formatedNow);
		model.addAttribute("auction", auction);
		
		// 경매 등록 확인
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> auctionEnroll = service.selectAuctionEnroll(auction_code, id);
		System.out.println(auctionEnroll);
		if(auctionEnroll != null) {
			model.addAttribute("auctionEnroll", true);
		} else {
			model.addAttribute("auctionEnroll", false);
		}
		
		
		// 경매 로그===============================================================================
		HashMap<String, String> auctionRoom = service.selectAuctionRoom(auction_code);
		if(auctionRoom == null) { // 경매기록 방이 없을 경우
			// 경매 기록 방 저장
//					auctionRoom = service.insertAuctionRoom(auction_code);
		} else if(auctionRoom.get("auction_code").equals(auction_code)) { // 경매 방 있는 경우
			
		}
		
		// 경매 기록(채팅 상세 내용) 검색
		// 방번호,아이템코드, id 다 넘겨야 하나? 그렇구만
		List<HashMap<String, String>> auctionLog = service.selectAuctionLog(id);
		
//				if() { // 경매 페이지로 들어갈 때 이 아이템에 대한 경매기록이 있는지 확인해야하고 경매 기록이 없을 경우 밑에 코드 사용
//					채팅방에는 방번호, 아이템 번호, chat_content 이렇게 있고
			
			/* 여기서 아이템 번호에는 옥션_코드 들가면 되고 방번호는 내가 임의로 넣으면 되나? 
			예를 들어 구분자나 경매기록이니 'log'를 붙여서 사용하거나 다 공통된거 사용하는게 좋긴 한데 다른곳에서 쓸일이 있으려나? 
			쓸일이 있어도 /log 같은거 사용해서 구분하는게 best같은데 맞지 
			마이페이지에서도 필요할꺼고 */
//				} else if() {} // 경매 관련 기록이 있을경우 그 기록의 정보를 화면에 표시 
		
		// 시작 가격 - 이건 계속 바뀌는 거 그래도 필요하네
		String price = Integer.parseInt(auction.get("auction_present_price").replace(",", "")) + "";
		model.addAttribute("price", price);
		// 보증금 계산 - 고정
		String deposit = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.1) + "";
		// 물건 호가 계산 - 고정
		String askingPrice = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.01) + "";
		// 즉시 구매 - 고정
		String purchase = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 1.8) + "";
		model.addAttribute("deposit", deposit);
		model.addAttribute("askingPrice", askingPrice);
		model.addAttribute("purchase", purchase);
		//================================================================================
		
		
		return "auction/auction";
	}
	
	// 기간 경매
	@RequestMapping(value="auctionPeriod", method = RequestMethod.GET)
	public String auctionPeriod(@RequestParam String auction_code, HttpSession session, Model model) { // 이미지 코드와 경매 코드를 받아서 목록 상세
		//================================================================================
		// 여기서 채팅방 or 내용 검색해서 기록이 있으면 그 기록을 화면에 보여줄꺼
		// 여기서 넘길수 있는게 auction_code 고 
		String id = (String)session.getAttribute("sId");
		
		/*
		 * 경매 참가를 하면 기록이 저장되는 방이 생성되어 있는지 확인하고 
		 * 방이 없으면 새로운 방 생성할꺼고,
		 * 방이 있으면 기존의 방을 검색하여 저장된 값을 가져올꺼다 
		 * 그럼 여기서는 방을 먼저 검색하네
		 * 방 검색 옥션코드
		 * */
		// 이부분 셀렉트랑 인설트랑 같이 할 방법 없나?
		// 셀렉하고 없으면 바로 만들고 있으면 검색된 값 가져오고 ???
		// 경매기록 방 검색
		HashMap<String, String> auctionRoom = service.selectAuctionRoom(auction_code);
		if(auctionRoom == null) { // 경매기록 방이 없을 경우
			// 경매 기록 방 저장
//					auctionRoom = service.insertAuctionRoom(auction_code);
		} else if(auctionRoom.get("auction_code").equals(auction_code)) { // 경매 방 있는 경우
			
		}
		
		// 경매 기록(채팅 상세 내용) 검색
		// 방번호,아이템코드, id 다 넘겨야 하나? 그렇구만
		List<HashMap<String, String>> auctionLog = service.selectAuctionLog(id);
		
//				if() { // 경매 페이지로 들어갈 때 이 아이템에 대한 경매기록이 있는지 확인해야하고 경매 기록이 없을 경우 밑에 코드 사용
//					채팅방에는 방번호, 아이템 번호, chat_content 이렇게 있고
			
			/* 여기서 아이템 번호에는 옥션_코드 들가면 되고 방번호는 내가 임의로 넣으면 되나? 
			예를 들어 구분자나 경매기록이니 'log'를 붙여서 사용하거나 다 공통된거 사용하는게 좋긴 한데 다른곳에서 쓸일이 있으려나? 
			쓸일이 있어도 /log 같은거 사용해서 구분하는게 best같은데 맞지 
			마이페이지에서도 필요할꺼고 */
//				} else if() {} // 경매 관련 기록이 있을경우 그 기록의 정보를 화면에 표시 
		
		// 이것도 바뀔건 아니고
		HashMap<String, String> auction = service.selectAuctionCode(auction_code);
		System.out.println(auction);
		model.addAttribute("auction", auction);
		// 시작 가격 - 이건 계속 바뀌는 거 그래도 필요하네
		String price = Integer.parseInt(auction.get("auction_present_price").replace(",", "")) + "";
		model.addAttribute("price", price);
		// 보증금 계산 - 고정
		String deposit = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.1) + "";
		// 물건 호가 계산 - 고정
		String askingPrice = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 0.01) + "";
		// 즉시 구매 - 고정
		String purchase = (int)(Integer.parseInt(auction.get("auction_present_price").replace(",", "")) * 1.8) + "";
		model.addAttribute("deposit", deposit);
		model.addAttribute("askingPrice", askingPrice);
		model.addAttribute("purchase", purchase);
		//================================================================================
				
		
		return "auction/auctionPeriod";
	}
	
	// 완료된 경매
	@RequestMapping(value="auctionFinish", method = RequestMethod.GET)
	public String auctionFinish() { // 이미지 코드와 경매 코드를 받아서 목록 상세
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
		
		
		model.addAttribute("member", member);
		model.addAttribute("auction", auction);
		model.addAttribute("deposit", deposit.get("deposit"));
		
		
		return "auction/auctionDeposit";
	};
	
	@RequestMapping(value="auctionEnroll", method = RequestMethod.GET)
	public String auctionEnroll(@RequestParam String auction_code, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		int insertCount = service.insertEnroll(auction_code, id);
		
		model.addAttribute("auction_code", auction_code);
		
		return "redirect:/auction";
	};
	
	@RequestMapping(value="auctionPay", method = RequestMethod.GET)
	public String auctionPay() {
		
		return "auction/auctionPay";
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

