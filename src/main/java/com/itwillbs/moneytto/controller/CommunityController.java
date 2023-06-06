package com.itwillbs.moneytto.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.moneytto.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	@GetMapping(value = "commBoard")
	public String commBoard(@RequestParam HashMap<String, String> board, Model model, HttpSession session) {
	    List<HashMap<String, String>> boardList = service.boardList(board);

	    model.addAttribute("boardList", boardList); // boardList를 모델에 추가

	    return "board/community";
	}

	
	
	@GetMapping(value = "commBoardWrite")
	public String commBoardWrite(Model model,HttpSession session) {
		
		
		return "board/commBoardWrite";
	}

	
	@PostMapping(value = "BoardWritePro")
	public String BoardWritePro(@RequestParam HashMap<String, String> board, Model model, HttpSession session) {
	    String id = (String) session.getAttribute("sId");
	    board.put("id", id); // "id" 키와 세션에서 가져온 아이디 값을 추가

	    int insertCount = service.insertBoard(board);

	    if (insertCount > 0) {
	        model.addAttribute("msg", "게시물이 등록되었습니다.");
	        model.addAttribute("target", "main");
	        return "success";
	    } else {
	        // 게시물 삽입 중 오류가 발생했습니다
	        model.addAttribute("msg", "게시물 등록에 실패했습니다."); // 오류 메시지를 모델에 추가
	        return "fail_back";
	    }
	}

	
	
	@GetMapping(value = "commBoardView")
	public String commBoardView(@RequestParam HashMap<String, String> board, Model model,HttpSession session) {
		
		
		return "board/commBoardView";
	}
	

}
