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
import org.springframework.web.bind.annotation.*;
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
	public String selectList(Model model, 
			@RequestParam(defaultValue = "") String item_category, 
			@RequestParam(defaultValue = "") String item_status, 
			@RequestParam(defaultValue = "0") String item_price_min, 
			@RequestParam(defaultValue = "") String item_price_max,
			@RequestParam(defaultValue = "") String member_grade,
			@RequestParam(defaultValue = "default") String sort,
			HttpSession session) {
		System.out.println("item_category : " + item_category);
		System.out.println("item_status : " + item_status);
		System.out.println("item_price_min : " + item_price_min);
		System.out.println("item_price_max : " + item_price_max);
		System.out.println("member_grade : " + member_grade);
		
		String id = (String)session.getAttribute("sId");
		
			// 05.27 getMarketItemList에 id 파라미터 추가
			// 마켓 메인 아이템 리스트
			List<HashMap<String, String>> marketItemList = service.getMarketItemList(item_category, item_status, item_price_min, item_price_max, member_grade, sort, id);
			model.addAttribute("marketItemList", marketItemList);
			JSONArray ja = new JSONArray(marketItemList);
			
		
		return ja.toString();
	}
	
	@GetMapping(value = "market_detail")
	public String marketDetail(Model model, HttpSession session, String item_code) {
		
		//session아이디로 닉네임 얻기
		String id = (String)session.getAttribute("sId");
		if (id != null) {
		    HashMap<String, String> member = memberService.getMember(id);
		    String nickname = member.get("member_nickname");
		    model.addAttribute("nickname",nickname);
		}
		
		// 아이템 상세
		HashMap<String, String> marketItem = service.getMarketItem(item_code);
		model.addAttribute("marketItem", marketItem);
		
		
		
		return "market/market_detail";
	}
	@GetMapping(value = "market_payment")
	public String marketPayment() {
		
		return "market/market_payment";
	}
	
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
	
	// 아이템상태 업데이트
	@GetMapping("itemStatus_update")
	@ResponseBody
	public void itemStatusUpdate(int room_code, String item_status,Model model,HttpSession session) {
		
		// 1. 버튼을누르면 해당상대로 변경되야함  ok
		// 2. 거래완료 버튼을 누르면  2-1 item에서 상품의 상태가 update 2-2 market_paid 에 insert되야함
		// 3. 거래완료에서 다른버튼을 누르면 ex)다시 판매중이나 거래중으로바뀌면 market_paid에서 삭제되야함
		
		// 1-1 상품코드를 알아냄
		HashMap<String, String> item_code = marketChatService.getItem_code(room_code);
		
		// 1-2 알아낸 상품코드로 아이템 상태를 업데이트함
		int updateStatus = marketChatService.updateStatus(item_status,item_code.get("item_code"));
		
		// item_status 가 '거래완료'일시 > market_paid 에 insert
		HashMap<String, String> item_detail = marketChatService.getItemList(item_code.get("item_code")); 
		String get_item_status = item_detail.get("item_status");
		HashMap<String, String> oppenentId= marketChatService.getOppenentId(room_code, (String)session.getAttribute("sId"));
		
		String get_item_code = item_detail.get("item_code");
		//여기까진됨
		if(get_item_status.equals("거래완료")) {
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			int updateCount = marketChatService.isUpdate(get_item_code);
			System.out.println("==================================");
			System.out.println(updateCount);
			System.out.println("==================================");
			if(updateCount > 0) {
				System.out.println("거래내역에 이미있음");
			}else { //거래내역에없을때 
				// market_paid insert 작업
				// 거래코드, 판매자아이디, 아이템코드, 산사람, 판사람, 가격 , 판매방법 , 날짜
				int insertMarketPaid = marketChatService.insertMarketPaid(item_detail,oppenentId.get("oppenent_id"));
			}
			
			
			
		} else {
			// market_paid 에서 삭제되야함
			int delMarketPaid = marketChatService.deltMarketPaid(item_detail,oppenentId.get("oppenent_id"));
		}
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
		
		
		System.out.println("===============================");
		System.out.println(item_code+" 가있나요 ");
		System.out.println("===============================");
		
		
		//마지막 채팅 내역 
		List<HashMap<String, String>> myChatList = null;
		HashMap<String, Integer> chatList = null;
		List<HashMap<String, String>> chatDetail = null;
		int sellCount = 0;
		
		//디테일에서 들어갈때
		if(!item_code.equals("")) {
			System.out.println("item_code있음"+item_code);
			// 아이템선택후 들어가야함
			// 채팅방이있는지 조회한후 채팅방 생성 //
			int createRoom = marketChatService.insertChatRoom(item_code,id);
			System.out.println(createRoom);
			
			
			
			
			
			
			if(createRoom > 0 ) { //방이있을때
				
				//최근에 열린 채팅 내역 보이게
				//1. 최근 room_code조회
				chatList = marketChatService.getMyChatRecentList(id);	
				System.out.println("1 ==========================================");
				System.out.println(chatList);
				System.out.println("1 ==========================================");
				
				
				int room_code = chatList.get("room_code");
				model.addAttribute("room_code",room_code);
				//2. room_code로 채팅내용조회
				chatDetail = marketChatService.getChatDetail(room_code);
				model.addAttribute("chatDetail",chatDetail);
				System.out.println("2 ==========================================");
				System.out.println(chatDetail);
				System.out.println("2 ==========================================");
				
				//3. 상대방 판매상품갯수조회
				//상대방의 아이디 조회
				HashMap<String, String> oppenentId = marketChatService.getOppenentId(room_code, id);
				// 상대방의 아이디로 물건 판매개수조회 (판매완료되면 안보여야함 > 거래상태 확인)
				sellCount = marketChatService.getSellCount(oppenentId.get("oppenent_id"));
				
				myChatList = marketChatService.getMyChatList(id);
				
				System.out.println(myChatList);
			} else { // 방이없을때 
				
				
				System.out.println(myChatList);
			}
		} else {  //nav로들어갈때
			
			
			//최근에 열린 채팅 내역 보이게
			//1. 최근 room_code조회
			chatList = marketChatService.getMyChatRecentList(id);	
			System.out.println("1 ==========================================");
			System.out.println(chatList);
			System.out.println("1 ==========================================");
			
			
			int room_code = chatList.get("room_code");
			model.addAttribute("room_code",room_code);
			//2. room_code로 채팅내용조회
			chatDetail = marketChatService.getChatDetail(room_code);
			model.addAttribute("chatDetail",chatDetail);
			System.out.println("2 ==========================================");
			System.out.println(chatDetail);
			System.out.println("2 ==========================================");
			
			//3. 상대방 판매상품갯수조회
			//상대방의 아이디 조회
			HashMap<String, String> oppenentId = marketChatService.getOppenentId(room_code, id);
			// 상대방의 아이디로 물건 판매개수조회 (판매완료되면 안보여야함 > 거래상태 확인)
			sellCount = marketChatService.getSellCount(oppenentId.get("oppenent_id"));
			
			
			
			
			myChatList = marketChatService.getMyChatList(id);
			
			
			
		}
		
		
		model.addAttribute("myChatList",myChatList);
		model.addAttribute("chatList",chatList);
		model.addAttribute("sellCount",sellCount);
		
		
		
		return "market/market_chat";
		
	}// market_chat
	
	@GetMapping("market_review")
	public String marketReview() {
		return "market/market_review";
	}
	
	@GetMapping("chatDetail")
	@ResponseBody
	public String chatDetail(Model model, @RequestParam(defaultValue="0") int room_code,HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> chatDetail = marketChatService.getChatDetail(room_code);
		
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
	        item.put("id", id);
	        
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
