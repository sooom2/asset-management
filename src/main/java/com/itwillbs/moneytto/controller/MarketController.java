package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.moneytto.service.BankApiService;
import com.itwillbs.moneytto.service.BankService;
import com.itwillbs.moneytto.service.MarketChatService;
import com.itwillbs.moneytto.service.MarketService;
import com.itwillbs.moneytto.service.MemberService;
import com.itwillbs.moneytto.vo.AccountDetailVO;
import com.itwillbs.moneytto.vo.ResponseUserInfoVO;




@Controller
public class MarketController {
	
	@Autowired
	private BankApiService apiService;
	
	@Autowired
	private MarketService service;
	
	@Autowired
	private MarketChatService marketChatService;
	
	@Autowired
	private BankService bankService;
	
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
		
		return "market/market_list";
	}
	
	@GetMapping(value = "nav_market_list")
	public String marketList(Model model,HttpSession session, String navSearch) {
		
		//session아이디로 닉네임 얻기
		String id = (String)session.getAttribute("sId");
		if (id != null) {
		    HashMap<String, String> member = memberService.getMember(id);
		    String nickname = member.get("member_nickname");
		    model.addAttribute("nickname",nickname);
		}
		
		return "market/nav_market_list";
	}
	
	
	@ResponseBody
	@GetMapping(value = "navMarketItemList")
	public String selectListNav(Model model, 
			@RequestParam(defaultValue = "") String navSearch, 
			@RequestParam(defaultValue = "default") String sort, 
			HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		
		
		List<HashMap<String, String>> navMarketItemList = service.getNavMarketItemList(navSearch, sort, id);
		model.addAttribute("navMarketItemList", navMarketItemList);
		JSONArray ja = new JSONArray(navMarketItemList);
			
		
		return ja.toString();
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
	
	@ResponseBody
	@GetMapping(value = "tagList")
	public String selectTagList(Model model) {
		List<HashMap<String, String>> tagList = service.getTagList();
		model.addAttribute("tagList", tagList);
		JSONArray ja = new JSONArray(tagList);
		
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
		
	    Set<String> viewedItems = (Set<String>) session.getAttribute("viewed_items");
	    
	    if (viewedItems == null) {
	        viewedItems = new HashSet<>();
	    }

		
		// 상품 조회수 증가 처리
	    if (!viewedItems.contains(item_code)) {
	        service.increaseViews(item_code);
	        viewedItems.add(item_code);
	        session.setAttribute("viewed_items", viewedItems);
	    }
		
		// 아이템 상세
		HashMap<String, String> marketItem = service.getMarketItem(item_code);
		model.addAttribute("marketItem", marketItem);
		
		// 아이템 이미지
		List<HashMap<String, String>> itemImage = service.getItemImage(item_code);
		model.addAttribute("itemImage", itemImage);
		
		List<HashMap<String, String>> itemWish = memberService.getWishItem(id, item_code);
		model.addAttribute("itemWish", itemWish);
		
		HashMap<String, String> grade= memberService.getMemberGrade(marketItem.get("member_id"));
		System.out.println(grade);
		model.addAttribute("grade", grade);
		
		// 탈퇴한 회원의 상품 조회 불가
		if(marketItem.get("member_delete_status").equals("Y")) {
			model.addAttribute("msg", "탈퇴한 회원입니다.");
			return "fail_back";
		}

		return "market/market_detail";
	}
	
	// 신고하기
	@ResponseBody
	@GetMapping(value = "report")
	public boolean report(Model model, HttpSession session, @RequestParam HashMap<String, String> map) {
		String id = (String)session.getAttribute("sId");
		map.put("id", id);
		// view 에 보낼 결과
		boolean result = false;
		
		int insertReport = service.insertReport(map);
		if(insertReport > 0 ) {
			result = true;
		}
		return result;
	}
	
	
	@GetMapping(value = "itemRegist")
	public String itemRegist(Model model,HttpSession session) {
		
		//session아이디로 닉네임 얻기
		String id = (String)session.getAttribute("sId");
		HashMap<String, String> member = memberService.getMember(id);
		
		if(id==null) {
			model.addAttribute("msg","로그인이 필요합니다.");
			return "fail_back";
		}
		    String nickname = member.get("member_nickname");
		    model.addAttribute("nickname",nickname);
		
		return "market/market_itemRegist";
	}
	

	   // 아이템상태 업데이트
	   @GetMapping("itemStatus_update")
	   @ResponseBody
	   public void itemStatusUpdate(int room_code, String item_status,String trade_date,Model model,HttpSession session) {
	      
	      //거래 일정 시간이 지나서 거래완료로 바꿔야할때
	      // 거래일정이 지나면 상태를 거래완료로 바꾸게하기
	      int updateTradEnd = marketChatService.updateTradeEnd(); 
	      
	      
	      // 1. 버튼을누르면 해당상대로 변경되야함  ok
	      // 2. 거래완료 버튼을 누르면  2-1 item에서 상품의 상태가 update 2-2 market_paid 에 insert되야함
	      // 3. 거래완료에서 다른버튼을 누르면 ex)다시 판매중이나 거래중으로바뀌면 market_paid에서 삭제되야함
	      
	      // 1-1 상품코드를 알아냄
	      HashMap<String, String> item_code = marketChatService.getItem_code(room_code);
	      
	      // 1-2 알아낸 상품코드로 아이템 상태를 업데이트함
	      int updateStatus = marketChatService.updateStatus(item_status,item_code.get("item_code"));

	      
	      // 1-3 market_chat_rooms 의 trade_date 업데이드함
	      int tradeDateUpdate = marketChatService.getTradeDateUpdate(trade_date,room_code);
	      
	      
	      
	      // item_status 가 '거래완료'일시 > market_paid 에 insert
	      HashMap<String, String> item_detail = marketChatService.getItemList(item_code.get("item_code")); 
	      String get_item_status = item_detail.get("item_status");
	      HashMap<String, String> opponentId= marketChatService.getOpponentId(room_code, (String)session.getAttribute("sId"));
	      
	      //물건판매자
	      HashMap<String, String> sellDetail = marketChatService.getSellID(item_code.get("item_code"));
	      String sellId = null;
	      // session 이랑 비교해서 파는사람이 나면 내가판매자
	      if((String)session.getAttribute("sId") == sellDetail.get("member_id")) {
	         sellId = (String)session.getAttribute("sId");
	      } else {
	         //상대방이 판매자
	         sellId = sellDetail.get("member_id").toString();
	      }
	      
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
	            System.out.println("사는사람 ==================================");
	            System.out.println(sellId);
	            System.out.println("==================================");
	            String str ="직접거래";
	            int insertMarketPaid = marketChatService.insertMarketPaid(item_detail,sellId,(String)session.getAttribute("sId"),trade_date,str);
	            
	         }
	         
	         
	      } else {
	         // market_paid 에서 삭제되야함
	         int delMarketPaid = marketChatService.deltMarketPaid(item_detail,sellId);
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
	         model.addAttribute("createRoom", createRoom);
	         if (createRoom > 0) { // 방이있을때()
	            
	            // 대화한 내역
	            chatList = marketChatService.getMyChatRecentList(id);


	            //아이템코드에 해당하는 roomcode 찾기
	            room_code = marketChatService.getRoomCode(item_code,id);

	            // 2. room_code로 채팅내용조회
	            chatDetail = marketChatService.getChatDetail(room_code);
	            model.addAttribute("chatDetail", chatDetail);
	            item_subject = chatDetail.get(0).get("item_subject");
	         
	            // 3. 상대방 판매상품갯수조회
	            // 상대방의 아이디 조회
	            opponentId = marketChatService.getOpponentId(room_code, id);
	            // 상대방의 아이디로 물건 판매개수조회 (판매완료되면 안보여야함 > 거래상태 확인)
	            sellCount = marketChatService.getSellCount(opponentId.get("opponent_id"));
	            myChatList = marketChatService.getMyChatList(id);
	            
	            item = marketChatService.getItemList(item_code);
	            sellId = item.get("member_id");

	         } else { // 방이없을때
	               
	            // 해당 상품 조회
	            chatList = marketChatService.getItemDetail(item_code);
	            myChatList = marketChatService.getMyChatList(id);
	            if (myChatList != null) {
	            room_code = marketChatService.getNextRoomCode();
	            } else {
	               room_code = 1;
	            }
	            // 상대방아이디 - 상품의 member_id
	            // 방이없을땐 보통 판매자,,
	            item = marketChatService.getItemList(item_code);
	            sellId = item.get("member_id");

	         }
	         model.addAttribute("sellId", sellId);
	      } else { // nav로들어갈때
	         
	         // 최근에 열린 채팅 내역 보이게
	         // 1. 최근 room_code 조회
	         chatList = marketChatService.getMyChatRecentList(id);
	         if (chatList != null && chatList.size() > 0) {
	            room_code = chatList.get("room_code");
	            // 2. room_code로 채팅 내용 조회
	            chatDetail = marketChatService.getChatDetail(room_code);

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
	         

	      }
	      if(chatList !=null) {
	         item = marketChatService.getItemList(item_code);
	         sellId = item.get("member_id");
	      }
	      
	      // header에는 판매자 의정보!! ㅠㅠ
	      HashMap<String, String> sellDetail = marketChatService.getSellDetail(room_code);
	      HashMap<String, String> trade_date = marketChatService.getTradeDate(room_code);
	      
	      
	      //리뷰가 있으면 후기작성 안보이게 - 후기작성까지 됬으면 거래중 판매중 disabled
	      
	      int isReview = marketChatService.isReview(item_code);
	      HashMap<String, String> market_paid = marketChatService.getMarketPaid(item_code);
		  model.addAttribute("isReview",isReview);
		  model.addAttribute("market_paid",market_paid);
	      model.addAttribute("trade_date",trade_date);
	      model.addAttribute("sellDetail",sellDetail);
	      model.addAttribute("item_subject",item_subject);
	      model.addAttribute("opponentId", opponentId);
	      model.addAttribute("myChatList", myChatList);
	      model.addAttribute("chatList", chatList);
	      model.addAttribute("sellCount", sellCount);
	      model.addAttribute("room_code", room_code);
	      model.addAttribute("item_code", item_code);
	      return "market/market_chat";

	   }// market_chat
	   
	   @RequestMapping(value = "market_payment", method = {RequestMethod.GET, RequestMethod.POST})
	   public String store_pay2(HttpSession session
								, Model model
								, @RequestParam(value = "item_code", defaultValue = "market0029") String item_code) {
			
			HashMap<String, String> item = service.getMarketItem(item_code);
			String id = (String)session.getAttribute("sId");
			if(id == null) {	
				model.addAttribute("msg","로그인해주세요");
				return "fail_back";
			}
			HashMap<String, String> member = memberService.getMember(id);
			HashMap<String, String> account = bankService.getAccount(id);
			// 세션에 저장된 엑세스 토큰 및 사용자 번호 변수에 저장
			String access_token = (String)session.getAttribute("access_token");
			String user_seq_no =  (String)session.getAttribute("user_seq_no");
			// access_token 이 null 일 경우 "계좌 인증 필수" 메세지 출력 후 이전페이지로 돌아가기
			if(access_token == null) {
				model.addAttribute("msg", "계좌 인증이 필요합니다.");
				model.addAttribute("target","mypage");
				model.addAttribute("isClose", true);
				return "success";
			}
			
			// 사용자 정보 조회(REST API 요청)		
			// BankApiService - requestUserInfo() 메서드 호출
			// => 파라미터 : 엑세스토큰, 사용자번호   리턴타입 : ResponseUserInfoVO(userInfo)
			ResponseUserInfoVO userInfo = apiService.requestUserInfo(access_token, user_seq_no);
			
		
			HashMap<String, String> accountInfo = bankService.getAccount((String)session.getAttribute("sId"));
			
			String fintech_use_num = accountInfo.get("fintech_use_num");
			model.addAttribute("fintech_use_num",fintech_use_num);
			
			
			//아이템이미지
			List<HashMap<String, String>> itemImage = service.getItemImage(item_code);
			// Model 객체에 ResponseUserInfoVO 객체 저장
			model.addAttribute("userInfo", userInfo);
			System.out.println("==================================");
			System.out.println("/bank_userInfo : " + userInfo);
			System.out.println("==================================");
			
			String itemImg = itemImage.get(0).get("image_name");
			
			
			System.out.println("======================================================");
			System.out.println("item : " + item.toString());
			System.out.println("item_image : " + itemImage.toString());
			System.out.println("member : " + member.toString());
			System.out.println("account : " + account);
			System.out.println("======================================================");
			model.addAttribute("itemImg", itemImg);
			model.addAttribute("member", member);
			model.addAttribute("item", item);
			model.addAttribute("account", account);
			return "market/market_payment";
			
			
		}
	   
		// 계좌 상세정보 조회(2.3.1. 잔액조회 API)
		// /balance/fin_num
		@PostMapping(value="bank_accountDetail_pay", produces = "application/text; charset=UTF-8")
		@ResponseBody
		public String getAccountDetail(
				@RequestParam Map<String, String> map, HttpSession session, Model model) throws JsonProcessingException {

			
			// 미로그인 또는 엑세스토큰 없을 경우 "fail_back" 페이지를 통해
			// "권한이 없습니다!" 출력 후 이전페이지로 돌아가기
			if(session.getAttribute("sId") == null || session.getAttribute("access_token") == null) {
				model.addAttribute("msg", "권한이 없습니다!");
				return "fail_back";
			}
			
			// 세션 객체의 엑세스 토큰을 Map 객체에 추가
			map.put("access_token", (String)session.getAttribute("access_token"));
			
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
			
			//AccountDetailVO 객체 저장
			model.addAttribute("account", account);
			model.addAttribute("account_num_masked", map.get("account_num_masked"));
			model.addAttribute("access_token", map.get("access_token"));
			model.addAttribute("user_name", map.get("user_name"));
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(account);
			
			return jsonStr;
			
		}
		
		@GetMapping("pointTrade")
		@ResponseBody
		public void pointTrade(HttpSession session,Model model , @RequestParam("item_price") int itemPrice, @RequestParam("my_point") int my_point,@RequestParam(defaultValue = "") String item_code,String sellId,String trade_date) {
		    String id = (String) session.getAttribute("sId");
		    System.out.println(id);
		    System.out.println(itemPrice);
		    System.out.println(my_point);
		    
		    int updatePoint = marketChatService.pointWithDraw(id,itemPrice);
		    HashMap<String, String> item = marketChatService.getItemList(item_code);
	        sellId = item.get("member_id");
		    if(updatePoint > 0 ) {
			    HashMap<String, String> item_detail = marketChatService.getItemList(item_code); 
			    
			    
			    int updateOpponentPoint = marketChatService.pointDeposit(sellId,itemPrice);
			    
			    int updateTrade = marketChatService.updateTradeSuccess(item_code);
			    
			    String str ="안전결제";
	            int insertMarketPaid = marketChatService.insertMarketPaid(item_detail,sellId,(String)session.getAttribute("sId"),trade_date,str);

		    }
		    
		}
		
		@GetMapping("marketPaid")
		@ResponseBody
		public String marketPaid(int room_code) {
			HashMap<String, String> item = marketChatService.getItem_code(room_code);
			String item_code = item.get("item_code");
			
			
			HashMap<String, String> marketPaid = marketChatService.getMarketPaid(item_code);
			HashMap<String, String> tradeDate = marketChatService.getTradeDate(room_code);
			
			
			JSONObject result = new JSONObject();
			result.put("marketPaid", marketPaid);
			result.put("tradeDate", tradeDate);
			
			return result.toString();
		}
		@GetMapping("isReview")
		@ResponseBody
		public int isReview(int room_code) {
			HashMap<String, String> item = marketChatService.getItem_code(room_code);
			String item_code = item.get("item_code");
			int isReview = marketChatService.isReview(item_code);
			return isReview;
		}
	   
		
		@GetMapping("getTradeDate")
		@ResponseBody
		public String getTradeDate(int room_code) {
			HashMap<String, String> tradeDate = marketChatService.getTradeDate(room_code);
			JSONObject arrTradeDate = new JSONObject(tradeDate);
		   
			return arrTradeDate.toString();
	   }
	   
	   @GetMapping("getTarget")
	   @ResponseBody
	   public String getTarget(int room_code,HttpSession session) {
	      String id = (String)session.getAttribute("sId");
	            
	      HashMap<String, String> opponentId = marketChatService.getOpponentId(room_code, id);
	      JSONObject arrOpponent = new JSONObject(opponentId);
	      
	      return arrOpponent.toString();
	   }

	   @GetMapping("chatDetail")
	   @ResponseBody
	   public String chatDetail(Model model, @RequestParam(defaultValue="0") int room_code,HttpSession session) {
	      
	      String sId = (String)session.getAttribute("sId");
	      
	      List<HashMap<String, String>> chatDetail = marketChatService.getChatDetail(room_code);
	      HashMap<String, String> opponentId = marketChatService.getOpponentId(room_code, sId);
	      JSONObject result = new JSONObject();
	      result.put("chatDetail", chatDetail);
	      result.put("opponentId", opponentId);
	      
	      return result.toString();
	   }
	   
	   
	   @PostMapping("exitChatRoom")
	   @ResponseBody
	   public String exitChatRoom(String room_code,HttpSession session) {
	      
	      int updateCount = marketChatService.updateExistStatus(room_code);
	      JSONObject result = new JSONObject();
	      if(updateCount > 0) {
	    	  result.put("result", "채팅방 나가기 성공");
	      }else {
	    	  result.put("result", "채팅방 지박령 성공ㅋ");
	      }
	      return result.toString();
	     
	   }
	
	@GetMapping("reviewForm")
	public String marketReview(HttpSession session, Model model, String item_code) {
		
		String id = (String)session.getAttribute("sId");
		// 거래 내역에서 내가 산 물건 조회		
		HashMap<String, String> item= service.getBuyItem(id ,item_code);
		System.out.println(item);
		if(item == null) {	//거래 내역이 없을때
			
			model.addAttribute("msg", "권한이 없습니다.");
			model.addAttribute("isClose", true);
			return "fail_back";
		
		}
		
		if(item.get("review_code")==null) {
			
			model.addAttribute("review_type", "insert");	//작성된 리뷰가 없을때 추가
			
		}else {
			HashMap<String,String> review = memberService.getReview(id ,item_code);
			model.addAttribute("review", review);
			model.addAttribute("review_type", "update");	//작성된 리뷰가 있을때 수정
		}
		
		model.addAttribute("item", item);
		return "market/market_review";
		
	}
	
	@RequestMapping(value = "reviewRegist", method = RequestMethod.POST)
	public String reviewRegist(@RequestParam HashMap<String, String> review,HttpSession session, Model model) {
		
		switch (review.get("review_type")) {
			case "insert":	int insertCount = service.writeReview(review);
				
				if(insertCount > 0) {				//insert 성공
					model.addAttribute("msg", "리뷰가 등록되었습니다. 			회원 등급 포인트가 5점 적립되었습니다.");
					
					
				}else {								//insert 실패
					model.addAttribute("msg", "리뷰 작성에 실패하였습니다.");
					
				}
			break;
			case "update":	int updateCount = service.modifyReview(review);
				
				if(updateCount > 0) {				//insert 성공
					
					model.addAttribute("msg", "리뷰가 수정 되었습니다.");
					
				}else {								//insert 실패
					model.addAttribute("msg", "리뷰 작성에 실패하였습니다.");
					
				}
			break;
		}
		
		model.addAttribute("isClose", true);
		model.addAttribute("isReload", true);
		
		return"fail_back";
		
	}
	@RequestMapping(value = "reviewHide", method = RequestMethod.GET)
	public String reviewHide(@RequestParam HashMap<String, String> review,HttpSession session, Model model) {
		
		int updateCount = service.hideReview(review);
		
		if(updateCount > 0) {	
			//insert 성공
			model.addAttribute("msg", "리뷰를 숨겼습니다.");
		}else {								//insert 실패
			model.addAttribute("msg", "ERROR 리뷰 숨기기에 실패하였습니다.");
		}
		model.addAttribute("target", "mypage");
		return"success";
		
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

	                    String saveFileName = "http://c3d2212t3.itwillbs.com/Moneytto/resources/upload/" + storedFileName;
	                    
	                    
	                    
	                    
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
		    String originalItemTag = service.getItemTag(itemCode);
	        item.put("id", id);
	        
	        // 가격에서 쉼표 제거
	        String itemPrice = item.get("item_price");
	        itemPrice = itemPrice.replace(",", "");
	        item.put("item_price", itemPrice);
	        
	        // 아이템 수정 시 item_tag 값이 비어있으면 원래 저장된 item_tag 값을 유지
	        String itemTag = item.get("item_tag");
	        if (itemTag == null || itemTag.isEmpty()) {
	            // 원래 저장된 태그 값을 가져와서 설정
	            itemTag = originalItemTag;
	            item.put("item_tag", itemTag);
	        }


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

	                        String saveFileName = "http://c3d2212t3.itwillbs.com/Moneytto/resources/upload/" + storedFileName;
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


	// 상품 삭제
	@PostMapping(value = "itemDeletePro")
	@ResponseBody
	public String itemDeletePro(@RequestParam("item_code") String itemCode, HttpSession session) {
	    String id = (String) session.getAttribute("sId");
	    
	    if (id == null) {
	        return "fail_back";
	    }
	    
	    HashMap<String, String> item = new HashMap<>();
	    item.put("item_code", itemCode);
	    item.put("id", id);
	    
	    int deleteCount = service.deleteItem(item);
	    
	    if (deleteCount > 0) {
	        service.removeImage(itemCode);
	        return "success";
	    } else {
	        return "fail_back";
	    }
	}
	
	@RequestMapping(value = "deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam Map<String, String> paramMap
								,HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("sId");
	    
	    if (id == null) {
	    	model.addAttribute("msg", "권한이 없습니다.");
	        return "fail_back";
	    }
		
	    paramMap.put("id", id);
	    
		int deleteCount = service.deleteReview(paramMap);
		if(deleteCount > 0) {
			model.addAttribute("msg", "리뷰가 삭제되었습니다.");
		}else {
			model.addAttribute("msg", "리뷰 삭제에 실패하였습니다.");
		}
		
		return "fail_back";
	}


}
