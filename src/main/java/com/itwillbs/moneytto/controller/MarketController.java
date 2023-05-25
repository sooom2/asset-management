package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String marketList(Model model,HttpSession session) {
		
		//session아이디로 닉네임 얻기
		String id = (String)session.getAttribute("sId");
		if (id != null) {
		    HashMap<String, String> member = memberService.getMember(id);
		    String nickname = member.get("member_nickname");
		    model.addAttribute("nickname",nickname);
		}
		
		
		
		// 마켓 메인 아이템 리스트
//		List<HashMap<String, String>> marketItemList = marketService.getMarketItemList();
//		model.addAttribute("marketItemList", marketItemList);
		return "market/market_list";
	}
	
	@ResponseBody
	@GetMapping(value = "marketItemList")
	public String selectList(Model model, @RequestParam(defaultValue = "") String item_category, @RequestParam(defaultValue = "") String item_status, 
			@RequestParam(defaultValue = "") String item_price_min, @RequestParam(defaultValue = "") String item_price_max) {
		
		System.out.println("item_category : " + item_category);
		System.out.println("item_status : " + item_status);
		System.out.println("item_price_min : " + item_price_min);
		System.out.println("item_price_max : " + item_price_max);
		// 마켓 메인 아이템 리스트
		List<HashMap<String, String>> marketItemList = service.getMarketItemList(item_category, item_status, item_price_min, item_price_max);
		model.addAttribute("marketItemList", marketItemList);
		JSONArray ja = new JSONArray(marketItemList);
		return ja.toString();
	}
	
	@GetMapping(value = "market_detail")
	public String marketDetail(Model model,HttpSession session) {
		
		//session아이디로 닉네임 얻기
		String id = (String)session.getAttribute("sId");
		if (id != null) {
		    HashMap<String, String> member = memberService.getMember(id);
		    String nickname = member.get("member_nickname");
		    model.addAttribute("nickname",nickname);
		}
		
		
		
		return "market/market_detail";
	}
	@GetMapping(value = "market_payment")
	public String marketPayment() {
		
		return "market/market_payment";
	}
	 
	// 상품 등록 페이지로 이동 
	@GetMapping(value = "itemRegist")
	public String itemRegist(Model model,HttpSession session) {
		
		//session아이디로 닉네임 얻기
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		
		if(id==null) {
			model.addAttribute("msg","로그인해주세요");
			return "fail_back";
		}
		    String nickname = member.get("member_nickname");
		    model.addAttribute("nickname",nickname);
		
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
		
		
		
		//마지막 채팅 내역 
		
		List<HashMap<String, String>> myChatList =null;
		
		//최근에 열린 채팅 내역 보이게
		//1. 최근 room_code조회
		HashMap<String, Integer> chatList = marketChatService.getMyChatRecentList(id);	
		
		int room_code = chatList.get("room_code");
		
		//2. room_code로 채팅내용조회
		List<HashMap<String, String>> chatDetail = marketChatService.getChatDetail(room_code);
		model.addAttribute("chatDetail",chatDetail);
		
		
		//3. 상대방 판매상품갯수조회
		
		

		myChatList = marketChatService.getMyChatList(id);
		model.addAttribute("myChatList",myChatList);
		model.addAttribute("chatList",chatList);
		
		
		
		
		
		return "market/market_chat";
	}
	
	@GetMapping("chatDetail")
	@ResponseBody
	public String chatDetail(Model model, @RequestParam(defaultValue="0") int room_code,HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> chatDetail = marketChatService.getChatDetail(room_code);
		
		//상대방id
//		HashMap<String, String> oppenentId  = marketChatService.getOppenentId(room_code,sId);
		
		//판매자 판매상품개수
//		int sellCount = marketChatService.getSellCount(oppenentId.get("oppenent_id"));
//		System.out.println("==============================================");
//		System.out.println(sellCount);
//		model.addAttribute("sellCount",sellCount);
//		System.out.println("==============================================");
		
		
		JSONArray arrChatDetail = new JSONArray(chatDetail);
		System.out.println(arrChatDetail);
		return arrChatDetail.toString();
	}

	// 상품등록
	@PostMapping(value = "itemRegistPro")
	public String itemRegistPro(@RequestParam HashMap<String, String> item, Model model, HttpSession session, @RequestParam("file") List<MultipartFile> files) {
		String id = (String)session.getAttribute("sId");
	    String uploadDir = session.getServletContext().getRealPath("/resources/upload");
	    System.out.println(item);
	    try {
	        // 아이템 등록 전에 아이템 코드를 생성하여 저장
	        String itemCode = service.selectItem();
	        item.put("item_code", itemCode);
	        item.put("member_id",id);
	        
	        // 가격에서 쉼표 제거
	        String itemPrice = item.get("item_price");
	        itemPrice = itemPrice.replace(",", "");
	        item.put("item_price", itemPrice);

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
