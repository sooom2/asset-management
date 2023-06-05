package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
			@RequestParam(defaultValue = "") String item_tag,
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
		System.out.println("item_tag : " + item_tag);
		
		String id = (String)session.getAttribute("sId");
		
		
		// 05.27 getMarketItemList에 id 파라미터 추가
		// 마켓 메인 아이템 리스트
		List<HashMap<String, String>> marketItemList = service.getMarketItemList(item_category, item_tag, item_status, item_price_min, item_price_max, member_grade, sort, id);
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
		
		// 아이템 이미지
		List<HashMap<String, String>> itemImage = service.getItemImage(item_code);
		model.addAttribute("itemImage", itemImage);
		
		
		

		return "market/market_detail";
	}
	
	@ResponseBody
	@GetMapping(value = "report")
	public void report(Model model, HttpSession session, String targetId, String reportType, String reportContent) {
		System.out.println("값이 왔을까여");
		String id = (String)session.getAttribute("sId");
		System.out.println(id);
		System.out.println(targetId);
		System.out.println(reportType);
		System.out.println(reportContent);
		
		int insertReport = service.insertReport(id, targetId, reportType, reportContent);
		System.out.println("insertReport : " + insertReport);
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
		HashMap<String, String> opponentId= marketChatService.getOpponentId(room_code, (String)session.getAttribute("sId"));
		
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
				int insertMarketPaid = marketChatService.insertMarketPaid(item_detail,opponentId.get("opponent_id"));
			}
			
			
		} else {
			// market_paid 에서 삭제되야함
			int delMarketPaid = marketChatService.deltMarketPaid(item_detail,opponentId.get("opponent_id"));
		}
	}

	@GetMapping(value = "marketChat")
	public String marketChat(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(defaultValue = "") String item_code) {
		String id = (String) session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		if (id == null) {
			model.addAttribute("msg", "로그인해주세요");
			return "fail_back";
		}
		// 내닉네임
		String nickname = member.get("member_nickname");
		model.addAttribute("nickname", nickname);

		// 상대방아이디
		HashMap<String, String> opponentId = null;

		HashMap<String, String> item = null;
		String sellId = null;
		String item_subject = null;
		int sellCount = 0;
		int room_code = 0;

		// 마지막 채팅 내역
		List<HashMap<String, String>> myChatList = null;
		HashMap<String, Integer> chatList = null;
		List<HashMap<String, String>> chatDetail = null;
		
		// 디테일에서 들어갈때
		if (!item_code.equals("")) {
			System.out.println("item_code있음" + item_code);
			// 아이템선택후 들어가야함
			// 채팅방이있는지 조회한후 채팅방 생성 //
			int createRoom = marketChatService.isInsertChatRoom(item_code, id);
			System.out.println("1 ==========================================");
			System.out.println(createRoom);
			System.out.println("1 ==========================================");
			model.addAttribute("createRoom", createRoom);
			if (createRoom > 0) { // 방이있을때()
				
				// 대화한 내역
				chatList = marketChatService.getMyChatRecentList(id);
				System.out.println("1 ==========================================");
				System.out.println(chatList);
				System.out.println("1 ==========================================");


				//아이템코드에 해당하는 roomcode 찾기
				room_code = marketChatService.getRoomCode(item_code,id);

				// 2. room_code로 채팅내용조회
				chatDetail = marketChatService.getChatDetail(room_code);
				model.addAttribute("chatDetail", chatDetail);
				System.out.println("2 ==========================================");
				System.out.println(chatDetail);
				System.out.println("2 ==========================================");
				item_subject = chatDetail.get(0).get("item_subject");
			
				// 3. 상대방 판매상품갯수조회
				// 상대방의 아이디 조회
				opponentId = marketChatService.getOpponentId(room_code, id);
				System.out.println("3 ==========================================");
				System.out.println(opponentId.get("opponent_id"));
				System.out.println("3 ==========================================");
				// 상대방의 아이디로 물건 판매개수조회 (판매완료되면 안보여야함 > 거래상태 확인)
				sellCount = marketChatService.getSellCount(opponentId.get("opponent_id"));
				myChatList = marketChatService.getMyChatList(id);
				
				System.out.println("4 ==========================================");
				System.out.println(myChatList);
				System.out.println("4 ==========================================");
				item = marketChatService.getItemList(item_code);
				sellId = item.get("member_id");

				System.out.println("chatDetail 에서  방이있을경우" + item_code + ",룸코드: " + room_code);
			} else { // 방이없을때
					
				// 해당 상품 조회
				
				
	            chatList = marketChatService.getItemDetail(item_code);
				myChatList = marketChatService.getMyChatList(id);
				if (myChatList != null) {
				room_code = marketChatService.getNextRoomCode();
				} else {
					room_code = 1;
				}
				System.out.println("대화한적이 없다!!!!! 최근 방번호에 active 되야하는디");
				// 상대방아이디 - 상품의 member_id
//	            sellId = chatList.get("opponent_id");
				// 방이없을땐 보통 판매자,,
				item = marketChatService.getItemList(item_code);

				sellId = item.get("member_id");

			}
			model.addAttribute("sellId", sellId);
		} else { // nav로들어갈때
			
			// 최근에 열린 채팅 내역 보이게
			// 1. 최근 room_code 조회
			chatList = marketChatService.getMyChatRecentList(id);
			System.out.println("nav1 ========================================");
			System.out.println(chatList);
			System.out.println("nav1 ========================================");
			if (chatList != null && chatList.size() > 0) {
				System.out.println(chatList.get("member_id"));
				room_code = chatList.get("room_code");
				System.out.println(room_code+ "는 뭘까");
				// 2. room_code로 채팅 내용 조회
				chatDetail = marketChatService.getChatDetail(room_code);

				System.out.println("nav2 ==================================");
				System.out.println(chatDetail);
				System.out.println("nav2 ==================================");
				item_subject = chatDetail.get(0).get("item_subject");
				
				if (chatDetail != null && !chatDetail.isEmpty()) {

					model.addAttribute("chatDetail", chatDetail);
				}

				HashMap<String, String> mapItemCode = marketChatService.getItem_code(room_code);
				item_code = mapItemCode.get("item_code");
				System.out.println("nav에서 들어갔을때 " + item_code);
				// 3. 상대방 판매상품갯수조회
				// 상대방의 아이디 조회
				opponentId = marketChatService.getOpponentId(room_code, id);
				// 상대방의 아이디로 물건 판매개수조회 (판매완료되면 안보여야함 > 거래상태 확인)
				sellCount = marketChatService.getSellCount(opponentId.get("opponent_id"));
				myChatList = marketChatService.getMyChatList(id);

			}

		}//nav
		
		if (chatList != null && myChatList != null && opponentId != null) {

			// 이미지 얻어오기위해 ( 상대방 꺼 조회해야함 )
			HashMap<String, String> opponentMember = memberService.getMember(opponentId.get("opponent_id"));
			String oppProfileImg = opponentMember.get("member_image");

			model.addAttribute("oppProfileImg", oppProfileImg);
			item = marketChatService.getItemList(item_code);
			sellId = item.get("member_id");
			
			
			DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
			DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd a hh:mm");
			String chatTime = String.valueOf(chatList.get("chat_time"));
			LocalDateTime parsedDateTime = LocalDateTime.parse(chatTime, inputFormatter);
			String formattedDateTime = parsedDateTime.format(outputFormatter);
		
			model.addAttribute("chatTime",formattedDateTime);

		}
		
		System.out.println("판매자!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		item = marketChatService.getItemList(item_code);
		sellId = item.get("member_id");
		
		// header에는 판매자 의정보!! ㅠㅠ
		HashMap<String, String> sellDetail = marketChatService.getSellDetail(room_code);
		System.out.println("=헷 갈.. 린 .. 다=============================================");
		System.out.println(sellDetail);
		System.out.println("==============================================");
		
		model.addAttribute("sellDetail",sellDetail);
		model.addAttribute("item_subject",item_subject);
		model.addAttribute("opponentId", opponentId);
		model.addAttribute("myChatList", myChatList);
		model.addAttribute("chatList", chatList);
		model.addAttribute("sellCount", sellCount);
		model.addAttribute("room_code", room_code);
		model.addAttribute("item_code", item_code);
		System.out.println("===============????=========================================");
		System.out.println(chatList + ": " + myChatList + ": " + opponentId);
		System.out.println("==================????===========================================");
		return "market/market_chat";

	}// market_chat
	
	@GetMapping("chatDetail")
	@ResponseBody
	public String chatDetail(Model model, @RequestParam(defaultValue="0") int room_code,HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		List<HashMap<String, String>> chatDetail = marketChatService.getChatDetail(room_code);
		
		System.out.println("ajax ========================================================");
		System.out.println(chatDetail);
		System.out.println("ajax ========================================================");
		JSONArray arrChatDetail = new JSONArray(chatDetail);
		return arrChatDetail.toString();
	}
	

	@GetMapping("reviewForm")
	public String marketReview(HttpSession session, Model model, String item_code) {
		
		String id = (String)session.getAttribute("sId");
		// 거래 내역에서 내가 산 물건 조회		
		HashMap<String, String> item= service.getBuyItem(id ,item_code);
		
//		if(!item.isEmpty()) {	//거래 내역이 없을때
//			
//			model.addAttribute("msg", "권한이 없습니다.");
//			return "fail_back";
//		
//		}
		
		if(item.get("review_code")==null) {
			
			model.addAttribute("review_type", "insert");	//작성된 리뷰가 없을때 추가
			
		}else {
			
			model.addAttribute("review_type", "update");	//작성된 리뷰가 있을때 수정
		}
		
		model.addAttribute("item", item);
		return "market/market_review";
		
	}
	
	@RequestMapping(value = "reviewRegist", method = RequestMethod.POST)
	public String reviewRegist(@RequestParam HashMap<String, String> review,HttpSession session, Model model) {
		System.out.println("==============================");
		System.out.println(review);
		System.out.println(review.get("review_type"));
		System.out.println("==============================");
		
		switch (review.get("review_type")) {
			case "insert":	int insertCount = service.writeReview(review);
				
				if(insertCount > 0) {				//insert 성공
					model.addAttribute("msg", "리뷰가 성공적으로 등록되었습니다.");
				}else {								//insert 실패
					model.addAttribute("msg", "리뷰 작성에 실패하였습니다.");
					
				}
			break;
			case "update":	int updateCount = service.modifyReview(review);
				
				if(updateCount > 0) {				//insert 성공
					
					model.addAttribute("msg", "리뷰가 성공적으로 등록되었습니다.");
				}else {								//insert 실패
					model.addAttribute("msg", "리뷰 작성에 실패하였습니다.");
					
				}
			break;
		}
		
		//TODO 도착 위치 지정 필요
		return"fail_back";
		
	}

	@GetMapping("recentlyMessage")
	@ResponseBody
	public String recentlyMessage(@RequestParam String room_code) throws JsonProcessingException {
		
		ObjectMapper objectMapper = new ObjectMapper();
		HashMap<String, String> recentlyMsg = marketChatService.getRecentlyMsg(room_code);

		
		System.out.println(recentlyMsg);
		String msg = objectMapper.writeValueAsString(recentlyMsg);
		
		return msg;
		
	}
	// 상품등록
	@PostMapping(value = "itemRegistPro")
	public String itemRegistPro(@RequestParam HashMap<String, String> item, Model model, HttpSession session, @RequestParam("file") List<MultipartFile> files) {
	    String id = (String) session.getAttribute("sId");
	    String uploadDir = session.getServletContext().getRealPath("/resources/upload");
	    System.out.println(item);
	    System.out.println(files);
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
	                if (!file.isEmpty() && file.getSize() > 0) { // 파일이 전송되었는지 확인
	                    String fileName = file.getOriginalFilename();
	                    String fileExtension = FilenameUtils.getExtension(fileName);

	                    String uuid = UUID.randomUUID().toString();

	                    String storedFileName = uuid.substring(0, 8) + "." + fileExtension;

	                    String filePath = uploadDir + "/" + storedFileName;

	                    String saveFileName = "http://c3d2212t3.itwillbs.com/images/" + storedFileName;
	                    File dest = new File(filePath);
	                    file.transferTo(dest);

	                    // 사진 정보를 저장
	                    HashMap<String, String> saveImage = new HashMap<>();
	                    saveImage.put("image_code", uuid);
	                    saveImage.put("item_code", itemCode);
	                    saveImage.put("image_name", saveFileName);

	                    // 사진 정보 저장 메서드 호출
	                    int saveCount = service.saveImage(saveImage);
	                    System.out.println("saveCount: " + saveCount); // 디버깅용 로그

	                    if (saveCount <= 0) {
	                        // 사진 정보 저장 실패
	                        model.addAttribute("msg", "상품 수정에 실패하였습니다.");
	                        return "fail_back";
	                    }
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


	
	@GetMapping(value = "itemModify")
	public String marketModify(Model model, HttpSession session, String item_code) {
		
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
		List<HashMap<String, String>> images = service.getItemImage(item_code);
		model.addAttribute("images", images);
		
		return "market/market_itemModify";
	}
	
	//상품 수정 
	@PostMapping(value = "itemModifyPro")
	public String itemModifyPro(@RequestParam HashMap<String, String> item, Model model, HttpSession session, @RequestParam(value = "file", required = false) List<MultipartFile> files) {
	    String id = (String) session.getAttribute("sId");
	    String uploadDir = session.getServletContext().getRealPath("/resources/upload");
	    System.out.println(item);
	    try {
	        String itemCode = item.get("item_code");
	        item.put("id", id);

	        // 가격에서 쉼표 제거
	        String itemPrice = item.get("item_price");
	        itemPrice = itemPrice.replace(",", "");
	        item.put("item_price", itemPrice);

	        // 아이템 수정
	        int updateCount = service.updateItem(item);

	        // 사진 수정 여부 확인
	        boolean photoChanged = false;
	        if (files != null && !files.isEmpty()) {
	            for (MultipartFile file : files) {
	                if (!file.isEmpty()) {
	                    photoChanged = true;
	                    break;
	                }
	            }
	        }

	        // 아이템 수정에 성공한 경우에만 사진 정보 저장
	        if (updateCount > 0) {
	            // 사진 수정한 경우 기존 사진 삭제
	            if (photoChanged) {
	                int deleteCount = service.removeImage(itemCode);
	            }

	            // 새로운 사진 정보를 저장
	            if (files != null && !files.isEmpty()) {
	                for (int i = 0; i < files.size(); i++) {
	                    MultipartFile file = files.get(i);
	                    if (!file.isEmpty()) {
	                        String fileName = file.getOriginalFilename();
	                        String fileExtension = FilenameUtils.getExtension(fileName);

	                        String uuid = UUID.randomUUID().toString();

	                        String storedFileName = uuid.substring(0, 8) + "." + fileExtension;

	                        String filePath = uploadDir + "/" + storedFileName;

	                        String saveFileName = "http://c3d2212t3.itwillbs.com/images/" + storedFileName;
	                        File dest = new File(filePath);
	                        // upload 디렉토리가 없을때 생성하는 메서드
	                        dest.mkdirs();
	                        file.transferTo(dest);

	                        // 사진 정보를 저장
	                        HashMap<String, String> saveImage = new HashMap<>();
	                        saveImage.put("image_code", uuid);
	                        saveImage.put("item_code", itemCode);
	                        saveImage.put("image_name", saveFileName);

	                        // 사진 정보 저장 메서드 호출
	                        
	                        int saveCount = service.saveImage(saveImage);
	                        if(saveCount > 0) {
	                        	
	                        }else {
	            	            model.addAttribute("msg", "상품 수정에 실패하였습니다.");
	            	            return "fail_back";
	                        }
	                        
	                    }
	                }
	            }

	            model.addAttribute("msg", "상품이 수정되었습니다.");
	            model.addAttribute("target", "main");
	            return "success";
	            	
	        } else {
	            model.addAttribute("msg", "상품 수정에 실패하였습니다.");
	            return "fail_back";
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	        model.addAttribute("msg", "상품 수정에 실패하였습니다.");
	        return "fail_back";
	    }
	}


	//상품 삭제
	@PostMapping(value = "itemDeletePro")
	public String itemDeletePro(@RequestParam HashMap<String, String> item,HttpSession session, Model model) {
		int deleteCount = service.deleteItem(item);
		
		if(deleteCount > 0) {
			 model.addAttribute("msg", "상품이 삭제 되었습니다.");
            model.addAttribute("target", "main");
            
            return "success";
            
		} else {
			model.addAttribute("msg", "상품 삭제에 실패하였습니다.");
			
			return "";
		}
		
	}


	
}
