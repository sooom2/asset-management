package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.moneytto.service.MarketChatService;
import com.itwillbs.moneytto.service.MarketService;
import com.itwillbs.moneytto.service.MemberService;




@Controller
public class MarketController {
	
	@Autowired
	private MarketService service;
	
	@Autowired
	private MarketChatService marketChatService;
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping(value = "market_list")
	public String marketList(Model model) {
		// 마켓 메인 아이템 리스트
		List<HashMap<String, String>> marketItemList = marketChatService.getMarketItemList();
		model.addAttribute("marketItemList", marketItemList);
		return "market/market_list";
	}
	
	@GetMapping(value = "market_detail")
	public String marketDetail() {
		
		return "market/market_detail";
	}
	@GetMapping(value = "market_payment")
	public String marketPayment() {
		
		return "market/market_payment";
	}
	
	@GetMapping(value = "itemRegist")
	public String itemRegist() {
		
		return "market/market_itemRegist";
	}
	
	@GetMapping(value = "marketChat")
	public String marketChat(Model model,HttpSession session,@RequestParam(defaultValue = "") String item_code) {
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		
		if(id==null) {
			model.addAttribute("msg","로그인해주세요");
			return "fail_back";
		}
		
		//내닉네임
		String nickname = member.get("member_nickname");
		model.addAttribute("nickname",nickname);
		
		
		List<HashMap<String, String>> myChatList =null;
		
		if(item_code.equals("")) {
			System.out.println("========================================");
			myChatList = marketChatService.getMyChatAllList(id);
			System.out.println(myChatList);
		}else {
			
		
		//아이템상세정보
		HashMap<String, String> itemDetail = marketChatService.getItem(item_code);
		
		
		//판매상세정보
		HashMap<String, String> sellDetail = marketChatService.getSellDetail(item_code);
		model.addAttribute("sellDetail",sellDetail);
		model.addAttribute("itemDetail",itemDetail);
		
//		//아이템 상세정보
		HashMap<String, String> itemList = marketChatService.getItemList(item_code);
		model.addAttribute("itemList",itemList);
		
		
		
		//판매자 판매상품개수
		int sellCount = marketChatService.getSellCount(sellDetail.get("member_id"));
		model.addAttribute("sellCount",sellCount);
		
		//내채팅목록
		
		myChatList = marketChatService.getMyChatList(id);

		}

		model.addAttribute("myChatList",myChatList);
		
		
		//오늘날짜
		Date now = new Date();
		System.out.println(now);
		model.addAttribute("now",now);
		
		
		
		
		return "market/market_chat";
		 
	}
	

	
//	@PostMapping(value="itemRegistPro")
//	public String itemRegistPro(@RequestParam HashMap<String, String> item, Model model) {
//		int insertCount = service.insertItem(item);
//		
//		if(insertCount > 0) {
//			
//			model.addAttribute("msg", "상품이 등록되었습니다.");
//			model.addAttribute("target", "main");
//			
//			return "success";
//		} else {
//			model.addAttribute("msg", "상품 등록에 실패하였습니다.");
//			
//			return "fail_back";
//		}
//		
//	}
	
//	@PostMapping(value = "itemRegistPro")
//	public String itemRegistPro(@RequestParam HashMap<String, String> item, Model model, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
//	    int insertCount = service.insertItem(item);
//
//	    if (insertCount > 0) {
//	        // 파일을 저장할 경로 설정
//	        String uploadDir = "/path/to/upload/directory/";
//	        try {
//	            // 파일 저장
//	            String fileName = file.getOriginalFilename();
//	            file.transferTo(new File(uploadDir + fileName));
//
//	            // 파일 경로 DB에 저장
//	            String filePath = "http://c3d2212t3.itwillbs.com/images/" + fileName;
//	            // DB에 파일 경로를 저장하는 로직을 구현합니다.
//
//	            model.addAttribute("msg", "상품이 등록되었습니다.");
//	            model.addAttribute("target", "main");
//
//	            return "success";
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        }
//	    }
//
//	    model.addAttribute("msg", "상품 등록에 실패하였습니다.");
//
//	    return "fail_back";
//	}
	
	@PostMapping(value = "itemRegistPro")
	public String itemRegistPro(@RequestParam HashMap<String, String> item, Model model, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
	    int insertCount = service.insertItem(item);
	  
	    if (insertCount > 0) {
	        // 파일을 저장할 실제 디렉토리 경로 설정
	        String uploadDir = "/resources/upload/";

	        try {
	            // 파일 저장
	            String fileName = file.getOriginalFilename();
	            String fileExtension = FilenameUtils.getExtension(fileName); // 파일 확장자 추출
	            String storedFileName = UUID.randomUUID().toString() + "." + fileExtension; // 저장할 파일명 생성
	            String filePath = uploadDir + storedFileName; // 저장할 파일의 경로

	            File dest = new File(filePath);
	            file.transferTo(dest);

	            // 파일 URL 생성
	            String fileUrl = "http://c3d2212t3.itwillbs.com/images/" + storedFileName;
	            	
	            System.out.println(fileUrl);
	            // 파일 URL을 DB에 저장하는 로직을 구현합니다.
	            // 예: service.saveFileUrl(fileUrl);

	            model.addAttribute("msg", "상품이 등록되었습니다.");
	            model.addAttribute("target", "main");

	            return "success";
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    model.addAttribute("msg", "상품 등록에 실패하였습니다.");

	    return "fail_back";

	}
	
}
