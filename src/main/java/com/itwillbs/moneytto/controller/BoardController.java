package com.itwillbs.moneytto.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.moneytto.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 공지사항 목록
	@RequestMapping(value = "notice_board", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeBoard(@RequestParam HashMap<String, String> map, Model model) {
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		} // map 에 번호만 들어 있음
		// 공지 목록 List에 저장
		List<HashMap<String, String>> noticeBoardList = boardService.getNoticeBoardList(map);
		if(noticeBoardList.size() > 0) {	// List 존재시 목록 카운트 한 값 저장
			HashMap<String, String> countMap = noticeBoardList.get(0);
			map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
		}
		model.addAttribute("paramMap", map);//paramMap={pageNum=1, startNum=0, endNum=10, totalCnt=17}
		model.addAttribute("noticeBoardList", noticeBoardList);
		System.out.println("noticeBoard 컨트롤러" + model);
		
		return "board/notice_board";
	}
	
	// 공지사항 상세
	@RequestMapping(value = "notice_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeDetail(@RequestParam HashMap<String, String> map, Model model) {
		model.addAttribute("paramMap", map);
		System.out.println("noticeDetail:"+map);//noticeDetail:{notice_code=17, prevNum=0, nextNum16=}
		map = boardService.getNoticeDetail(map);
		model.addAttribute("map", map);
		
//			List<BoardVO> lostBoardList = boardService.getLostBoardList();
//			model.addAttribute("lostBoardList", lostBoardList);
		
		System.out.println("공지사항 상세 " + model);
		
		return "board/notice_detail";
	}

	// 1:1 문의
	@RequestMapping(value = "oneOnOne", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneOnOne(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id != null) {
//			HashMap<String, String> member = storeService.selectMemberId(id);
//			model.addAttribute("member", member);
		}
		
		return "board/oneOnOne";
	}
	
	// 1:1 문의 등록
	@RequestMapping(value = "oneWritePro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneWritePro(@RequestParam HashMap<String, String> map, Model model) {
		System.out.println("controller: " + map);
		int insertCount = boardService.registOneBoard(map);
		if(insertCount > 0) {
			model.addAttribute("memberName", map.get("one_name"));
			model.addAttribute("memberEmail", map.get("one_email"));
			model.addAttribute("memberTel", map.get("one_tel"));
			System.out.println("1:1 문의 등록 모델" + model);
			return "redirect:/one_list";
		} 
		else {
			model.addAttribute("msg", "등록 실패");
			return "fail_back";
		}
	}
	
	// 내가 문의한 내용 목록
	@RequestMapping(value = "free_board", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneList(@RequestParam HashMap<String, String> map, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		System.out.println("one_list 시작 map : " + map);
//		if(id == null || "".equals(id) || map.isEmpty()) {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			return "fail_back";
//		}
//		if(id != null && !id.equals("")) {
//			HashMap<String, String> member = storeService.selectMemberId(id);
//			model.addAttribute("paramMap", member);
//			map.put("memberName", member.get("member_name")); 
//			map.put("memberTel", member.get("member_tel"));
//			map.put("memberEmail", member.get("member_email"));
//		}
		
		if(map.get("startNum") == null || "".equals(map.get("startNum"))) {
			map.put("pageNum", "1");
			map.put("startNum", "0");
			map.put("endNum", "10");
		}
		List<HashMap<String, String>> oneBoardList = boardService.getBoardList(map);
		if(oneBoardList.size()>0) {
			HashMap<String, String> countMap = oneBoardList.get(0);
			map.put("totalCnt",String.valueOf(countMap.get("totalCnt")));
		}
		System.out.println("paramMap " + model.getAttribute("paramMap"));	// ID있을떄 !null, id없을때 null
		model.addAttribute("paramMap", map);
		model.addAttribute("oneBoardList", oneBoardList);
		System.out.println("oneList 컨트롤러" + model);
		
		
		return "board/free_board";
	}
	
	
	// 내가 문의한 페이지 목록 -> 비밀번호 조회
	@ResponseBody	
	@RequestMapping(value = "one_detail_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean oneDetailPro(@RequestParam HashMap<String, String> map, HttpServletResponse response , Model model) {
//		response.setCharacterEncoding("UTF-8");
		
		model.addAttribute("map", map);
		System.out.println("-==================================="+map);
		List<HashMap<String, String>> isCorrect = boardService.checkOnePasswd(map);
		List<HashMap<String, String>> oneBoardList = null;
		System.out.println("=====문의 목록" + isCorrect);
		System.out.println(!isCorrect.isEmpty());
		
		
		if(!isCorrect.isEmpty()) {
			
			// 글 번호
			oneBoardList = boardService.getBoardList(map);
			if(oneBoardList.size() > 0) {
				HashMap<String, String> countMap = oneBoardList.get(0);
				map.put("totalCnt", String.valueOf(countMap.get("totalCnt")));
			}
			model.addAttribute("paramMap", map);
			
			model.addAttribute("oneBoardList", oneBoardList);
			System.out.println("문의 프로 map" + map);
			System.out.println("문의 프로 oneBoardLiost" + oneBoardList);
			System.out.println(model);
//					model.addAttribute("cinemaDetailJson", cinemaDetailJson);
		}
//		JSONArray arr = new JSONArray(oneBoardList);
//		return arr.toString();
		return !isCorrect.isEmpty();
	}
	
	
	// 내가 문의한 내역 상세
	@RequestMapping(value = "one_detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneDetail(@RequestParam HashMap<String, String> map, Model model) {
		model.addAttribute("paramMap", map);
		map = boardService.getDetail(map);
		model.addAttribute("map", map);
		System.out.println("내가 문의 상세 컨트롤러" + model);
		
		return "board/one_detail";
	}
	
	// 내가 문의한 내역 삭제
	@RequestMapping(value = "one_deletePro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		System.out.println("문의 내역 삭제 전" + map);
		model.addAttribute("map", map);
		int deleteCount = boardService.getDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			model.addAttribute("memberName", map.get("memberName"));
			model.addAttribute("memberEmail", map.get("memberEmail"));
			model.addAttribute("memberTel", map.get("memberTel"));
			System.out.println("문의 상세 삭제" + model);
			return "redirect:/one_list";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}
	
	//관리자게시판============================================================================================

	// 관리자 공지 등록
	@RequestMapping(value = "notice_register_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeRegisterPro(@RequestParam HashMap<String, String> map, Model model) {
		
		int insertCount = boardService.registNoticeBoard(map);
		System.out.println("여기" + map);
		System.out.println(model);
		if(insertCount > 0) {
			return "redirect:/admin_notice_board";
		} else {
			model.addAttribute("msg", "등록 실패!");
			return "fail_back";
		}
	}
	
	
	// 관리자 공지 수정
	@RequestMapping(value = "notice_update_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeUpdatePro(@RequestParam HashMap<String, String> map, Model model) {
		int updateCount = boardService.registNoticeUpdate(map);
		System.out.println(updateCount);
		if(updateCount > 0) {
			return "redirect:/admin_notice_board";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "notice_delete_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		int deleteCount = boardService.getNoticeDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			return "redirect:/admin_notice_board";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
		
	}
	
	
	// 관리자 1:1 답변 등록
	@RequestMapping(value = "one_update_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneUpdatePro(@RequestParam HashMap<String, String> map, Model model) {
		int updateCount = boardService.registOneUpdate(map);
		System.out.println(updateCount);
		if(updateCount > 0) {
			return "redirect:/admin_oneOnOne";
		} else {
			model.addAttribute("msg", "수정 실패!");
			return "fail_back";
		}
	}
	
	// 관리자 1:1 삭제
	@RequestMapping(value = "one_delete_pro", method = {RequestMethod.GET, RequestMethod.POST})
	public String oneAdminDeletePro(@RequestParam HashMap<String, String> map, Model model) {
		int deleteCount = boardService.getOneDelete(map);
		System.out.println(deleteCount);
		if(deleteCount > 0) {
			return "redirect:/admin_oneOnOne";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
	}	
	
}
