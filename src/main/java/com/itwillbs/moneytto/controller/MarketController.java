package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ModelAttribute;
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
		List<HashMap<String, String>> myChatSubject =null;
		
		if(item_code.equals("")) {
			
			System.out.println("========================================");
			myChatList = marketChatService.getMyChatList(id);
			System.out.println(myChatList);
			System.out.println("========================================");
		}else {
			
		
		//아이템상세정보
		HashMap<String, String> itemDetail = marketChatService.getItem(item_code);
		
		
		//판매상세정보
		HashMap<String, String> sellDetail = marketChatService.getSellDetail(item_code);
		model.addAttribute("sellDetail",sellDetail);
		model.addAttribute("itemDetail",itemDetail);
		
		//아이템 상세정보
		HashMap<String, String> itemList = marketChatService.getItemList(item_code);
		model.addAttribute("itemList",itemList);
		
		
		//판매자 판매상품개수
		int sellCount = marketChatService.getSellCount(sellDetail.get("member_id"));
		model.addAttribute("sellCount",sellCount);
		
		//내채팅목록
		myChatList = marketChatService.getMyChatList(id);
//		myChatSubject = marketChatService.getChatSubject(id);
//		System.out.println(myChatSubject);
		}

		model.addAttribute("myChatList",myChatList);
		
		
		
		
		return "market/market_chat";
		 
	}
	


	@PostMapping(value = "itemRegistPro")
	public String itemRegistPro(@RequestParam HashMap<String, String> item, Model model, HttpSession session, @RequestParam("file") List<MultipartFile> files) {
	    String uploadDir = session.getServletContext().getRealPath("/resources/upload");
	    System.out.println(item);
	    try {
	        // 아이템 등록 전에 아이템 코드를 생성하여 저장
	        String itemCode = service.selectItem();
	        item.put("item_code", itemCode);

	        // 아이템 등록
	        int insertCount = service.insertItem(item);

	        // 아이템 등록에 성공한 경우에만 사진 정보 저장
	        if (insertCount > 0) {
	            // 사진 정보를 저장
	            for (int i = 0; i < files.size(); i++) {
	                MultipartFile file = files.get(i);
	                if (!file.isEmpty()) {
	                    String fileName = file.getOriginalFilename();
	                    String fileExtension = FilenameUtils.getExtension(fileName);
	                    String storedFileName = UUID.randomUUID().toString() + "." + fileExtension;
	                    String filePath = uploadDir + "/" + storedFileName;

	                    File dest = new File(filePath);
	                    file.transferTo(dest);

	                    // 사진 정보를 저장
	                    HashMap<String, String> saveImage = new HashMap<>();
	                    saveImage.put("image_code", UUID.randomUUID().toString());
	                    saveImage.put("item_code", itemCode);
	                    saveImage.put("image_name", fileName);

	                    // 사진 정보 저장 메서드 호출
	                    service.saveImage(saveImage);
	                }
	            }

	            model.addAttribute("msg", "상품이 등록되었습니다.");
	            model.addAttribute("target", "main");
	            return "success";
	        } else {
	            model.addAttribute("msg", "상품 등록에 실패하였습니다.");
	            return "fail_back";
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	        model.addAttribute("msg", "상품 등록에 실패하였습니다.");
	        return "fail_back";
	    }
	}







	
}
