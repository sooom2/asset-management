package com.itwillbs.moneytto.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.moneytto.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	
	// =============================================
	@RequestMapping(value = "admin")
	public String adminMain(Model model) {
			
		return "admin/admin_main";
	}
	// =============================================
	@RequestMapping(value = "adminSocialAccount")
	public String adminSocialAccount(Model model) {
		return "admin/adminSocialAccount";
	}
	@RequestMapping(value = "adminSocialChat")
	public String adminSocialChat() {
		
		return "admin/adminSocialChat";
	}
	
	@RequestMapping(value = "adminReport")
	public String adminReport() {
		
		return "admin/adminReport";
	}
	// =============================================
	@RequestMapping(value = "adminNoticeBoard")
	public String adminNoticeBoard(Model model) {
		return "admin/adminNoticeBoard";
	}
	@RequestMapping(value = "adminFreeBoard")
	public String adminFreeBoard() {
		
		return "admin/adminFreeBoard";
	}
	
	@GetMapping("/adminAuction")
	public String adminAuction() {
		
		return "admin/adminAuction";
	}
	
	
	@PostMapping("/auction_regist")
	public String auction_regist(@RequestParam Map<String, String> auction, MultipartFile file, HttpSession session, Model model) {
		
		
		String uploadDir = "/resources/upload"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : " + saveDir);
		
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String file_path = "/" + sdf.format(date);
			
			// 저장될 경로 저장
			saveDir = saveDir + file_path;
			// -----------------------------------------------------------------------
			
			// java.nio.file.Paths 클래스의 get() 메서드를 호출하여  
			// 실제 경로를 관리하는 java.nio.file.Path 타입 객체를 리턴받기(파라미터 : 실제 업로드 경로)
			Path path = Paths.get(saveDir);
			// Files 클래스의 createDirectories() 메서드를 호출하여 Path 객체가 관리하는 경로 없으면 생성
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MultipartFile mFile = file;
		
		String originalFileName = mFile.getOriginalFilename();
		
		String uuid = UUID.randomUUID().toString();
		
		String file_name = uuid.substring(0, 8) + "_" + originalFileName;
		System.out.println("실제 업로드 될 파일명 : " + file_name);
		
		
		
		// -------------------------------------------------------------------------------
		
		// auction_code 추가
		auction.put("auction_code", uuid.substring(0, 8));
		
		int insertCount = service.registAuction(auction);
		
		if(insertCount > 0) { // 성공
			
			// 이미지 테이블 추가.
			Map<String, String> images = new HashMap<String, String>();
			images.put("image_code", (new Random().nextInt(1000000) + 1) + "");
			images.put("table_code", uuid.substring(0, 8));
			images.put("image_name", file_name);
			images.put("image_path", saveDir);
			
			int insertImage = service.registImage(images);
			
			// 이미지 등록 성공
			if(insertImage > 0) {
				try {
					mFile.transferTo(new File(saveDir, file_name));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "redirect:/adminFreeBoard";
			} else {
				model.addAttribute("msg", "이미지 등록 실패!");
				return "fail_back";
			}
			
		} else { // 실패
			model.addAttribute("msg", "경매 등록 실패!");
			return "fail_back";
		}
		
	}
	
	
	
	
	
	
	@RequestMapping(value = "adminChatBot")
	public String adminChatBot() {
		
		return "admin/adminChatBot";
	}
	// =============================================
	@RequestMapping(value = "adminMember")
	public String adminMember() {
		
		return "admin/adminMember";
	}
}
