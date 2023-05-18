package com.itwillbs.moneytto.controller;

import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
public class MypageController {
	
//	@Autowired
//	private MypageService service;
//	@Autowired
//	private BoardService boardService;

	// 마이페이지 메인
	@GetMapping(value ="mypage")
	public String mypage(HttpSession session) {
//		String id = (String)session.getAttribute("sId");
//		
//		if(id ==null) {
//			return "redirect:/memLogin";
//		}
//		
//		
//		member= service.getMemberInfo(id);
//		model.addAttribute("member", member);
		
		return "mypage/mypage_sale";
	} 
	
	
//	@GetMapping(value = "mypageSale")
//	public String mypageSale() {
//		return "mypage/mypage_sale";
//	}
	
	@GetMapping(value = "mypageFavorite")
	public String mypageFavorite() {
		return "mypage/mypage_favorite";
	}


	
	 
	//회원정보수정
	@GetMapping(value = "mypageInfo")
	public String mypageI(HttpSession session, Model model) {
//		String id = (String)session.getAttribute("sId");
//		
//		List<HashMap<String, String>> cinemaList = service.cinemaList(id);
//		model.addAttribute("cinemaList", cinemaList);
//		
//		
//		if(id ==null) {
//			
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			return "fail_back";
//			
//		}
//		
//		MemberVO member = service.getMemberInfo(id);
//		model.addAttribute("member", member);
		URI uri = UriComponentsBuilder.fromUriString("https://dapi.kakao.com/v2/local/search/address.json")
				 	.queryParam("query","부산시 수영구 수영로 546")
			        .encode()
			        .build()
			        .toUri();
		
	    // Spring 요청 제공 클래스 
	    RequestEntity<Void> req = RequestEntity
			        .get(uri)
			        .header("Host", "dapi.kakao.com")
			        .header("Authorization", "KakaoAK 4604b4522a19d2b6152b5213355cdb86")
			        .build();
	    // Spring 제공 restTemplate
	    ResponseEntity<String> resp = new RestTemplate().exchange(req, String.class);
	    JSONArray jsonArray = new JSONObject(resp.getBody()).getJSONArray("documents");
	    List Address = jsonArray.toList();
	    
	    model.addAttribute("Address", Address);
	    
	    System.out.println(Address);
		return "mypage/mypage_info_form";
	}
	

}