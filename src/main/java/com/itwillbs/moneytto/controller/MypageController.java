package com.itwillbs.moneytto.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MypageController {
	
//	@Autowired
//	private MypageService service;
//	@Autowired
//	private BoardService boardService;

	//예매내역
	@GetMapping(value = "mypage")
	public String mypage(HttpSession session) {
//		String id = (String)session.getAttribute("sId");
//		
//		if(id ==null) {
//			return "redirect:/memLogin";
//		}
//		
//		List<HashMap<String, String>> movieList = service.movieList(id);
//		model.addAttribute("movieList",movieList);
//		
//		List<HashMap<String, String>> likeList = service.likeList(id);
//		model.addAttribute("likeList",likeList);
//		
//		List<HashMap<String,String>> resList = service.resList(id);
//		model.addAttribute("resList", resList);
//		
//		member= service.getMemberInfo(id);
//		model.addAttribute("member", member);
		
		return "mypage/mypage_main";
	} 
	


	
	 
	//회원정보수정
	@GetMapping(value = "mypageI")
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
		
		return "mypage/mypage_info_form";
	}
	
	//회원정보수정
//	@PostMapping(value = "updatePro")
//	public String updatePro(@RequestParam HashMap<String, String> update, Model model, HttpSession session ) {
//		String id = (String)session.getAttribute("sId");
//		
//		// 주소 저장시 '/' 으로 구분해서 저장
//		String member_address = update.get("member_address1") + "/" + update.get("member_address2");
//		
//		update.put("member_address", member_address);
//		
//		if(id == null) {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			return "fail_back";
//		}
//		
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		String Epasswd = service.getPasswd(id);
//		
//		// 회원정보 수정시 비밀번호 일치 확인
//		if(Epasswd == null || !passwordEncoder.matches(update.get("member_pw"), Epasswd)) {
//		
//			model.addAttribute("msg", "비밀번호 확인이 필요합니다.");
//			return "fail_back";
//		}
//		
//		if(!update.get("member_pw2").equals("")) {
//			update.put("member_pw2",passwordEncoder.encode(update.get("member_pw2")));
//		}
//		
//		int updateCount = service.updateMemberInfo(update);
//		
//		if(updateCount > 0) {
//			model.addAttribute("msg", "회원정보수정성공!");
//			model.addAttribute("target", "mypageI");
//			return "success";
//			
//		} else {
//			model.addAttribute("msg", "회원정보수정 실패!");
//			return "fail_back";
//		}
		
		
//	}
	
//	//회원탈퇴
//	@PostMapping(value = "quitPro")
//	public String quitPro(@RequestParam HashMap<String, String> quit, HttpSession session, Model model ) {
//		
//		//세션아이디 저장
//		String id = (String)session.getAttribute("sId");
//		String password = quit.get("member_pw");
//		
//		//아이디와 일치하는 레코드의 패스워드 조회
//		String dbPasswd = service.getPasswd(id);
//		
//		System.out.println("평문 암호 : " + password + ", 해싱 암호 : " + dbPasswd);
//		
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		
//		if(passwordEncoder.matches(password, dbPasswd)) {	
//			int deleteCount = service.quitMember(quit);
//			
//			if(deleteCount > 0) {
//				
//				session.invalidate();
//				model.addAttribute("msg", "탈퇴가 완료되었습니다!");
//				model.addAttribute("target", "main");
//				
//				return "success";
//			} else {
//				
//				model.addAttribute("msg", "탈퇴 실패!");
//				return "fail_back";
//				
//			}
//		
//		} else {
//			
//			model.addAttribute("msg", "권한이 없습니다!");
//			return "fail_back";
//		
//		}
//		
//	}
//	
//	
//	
//	//리뷰페이지
//	@GetMapping(value = "mypageRv")
//	public String mypageRv(HttpSession session, MemberVO member, Model model) {
//		
//		String id = (String)session.getAttribute("sId");
//		member= service.getMemberInfo(id);
//		
//		List<HashMap<String, String>> movieList = service.movieList(id);
//		model.addAttribute("movieList",movieList);
//		
//		List<HashMap<String, String>> likeList = service.likeList(id);
//		model.addAttribute("likeList",likeList);
//		
//		List<HashMap<String, String>> revList = service.revList(id);
//		model.addAttribute("revList",revList);
//		
//		HashMap<String, String> resMovie = service.resMovie(id);
//		model.addAttribute("resMovie",resMovie);
//		
//		model.addAttribute("member", member);
//		
//		return "mypage/mypage_review_form";
//		
//	}
//
//	
//	@PostMapping(value="mypageRvPro")
//	public String mypageRvPro(@RequestParam HashMap<String, String> review, HttpSession session,  Model model) {
//		
//		String id = (String)session.getAttribute("sId");
//		review.put("id", id);
//		
//		// 리뷰 작성시 별점이나 후기글을 작성 하지 않으면 작성 실패!! 
//		if (review.get("rev_rating") == null || review.get("rev_content") == null) {
//			
//		    model.addAttribute("msg", "리뷰 작성에 실패했습니다. 별점을 선택하고 리뷰를 작성하세요.");
//		  
//		    return "fail_back";
//		    
//		}
//
//		HashMap<String,String> count = service.checkReview(id);
//	    System.out.println(count);
//	    // 이미 작성한 리뷰가 있다면 중복 등록 방지
//	    
//	    if (count != null) { 
//	    	
//	        model.addAttribute("msg", "이미 작성한 리뷰가 있습니다.");
//	        
//	        return "fail_back";
//	    }
//		
//	    int insertCount = service.insertReview(review);
//		
//		if(insertCount > 0 ) {
//			
//			model.addAttribute("msg", "리뷰가 등록되고 500포인트가 적립되었습니다.");
//			model.addAttribute("target", "mypageRv");
//			
//			//리뷰 등록시 포인트 등록 및 회원정보 포인트 업데이트
//			service.insertPoint(id);
//			service.updatePoint(id);
//
//			return "success";
//		
//		} else {
//			
//			model.addAttribute("msg", "리뷰 등록 실패!");
//			
//			return "fail_back";
//			
//		}
//		
//		
//	}
//	
//	@GetMapping(value="deleteReview")
//	public String deleteReview(@RequestParam("rev_code")String rev_code, HttpSession session, Model model) {
//	  
//		String id = (String)session.getAttribute("sId");
//
//	    int deleteCount = service.deleteReview(rev_code);
// 
//	    if (deleteCount > 0) {
//	    	
//	        model.addAttribute("msg", "리뷰가 삭제되었습니다.");
//	        model.addAttribute("target", "mypageRv");
//	        
//	        //리뷰 삭제시 포인트 차감 및 회원정보 포인트 업데이트
//	        service.removePoint(id); 
//	        service.updatePoint(id);
//	        
//	        return "success";
//	        
//	    } else {
//	    	
//	        model.addAttribute("msg", "리뷰 삭제 실패!");
//	        
//	        return "fail_back";
//	        
//	    }
//	    
//
//
//	    
//	}
//	
//	
//	
//	
//	
//	
}