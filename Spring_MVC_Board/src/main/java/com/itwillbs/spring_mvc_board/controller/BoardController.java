package com.itwillbs.spring_mvc_board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.spring_mvc_board.service.BoardService;
import com.itwillbs.spring_mvc_board.vo.BoardVO;
import com.itwillbs.spring_mvc_board.vo.PageInfo;
import com.itwillbs.spring_mvc_board.vo.TinyReplyBoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 글쓰기 폼
	// => 세션 아이디가 존재하지 않으면 "로그인 필수!", "MemberLoginForm.me" 저장 후 success 로 이동
	@GetMapping("/BoardWriteForm.bo")
	public String writeForm(HttpSession session, Model model) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("target", "MemberLoginForm.me");
			return "success";
		}
		
		return "board/board_write_form";
	}
	
	// -----------------------------------------------------------------------------------
	// 파일 업로드 기능이 포함된(enctype="multipart/form-data") 폼 파라미터 처리할 경우
	// 1) 각 파라미터를 각각의 변수로 처리하면서 
	//    업로드 파일을 매핑 메서드의 MultipartFile 타입으로 직접 처리하는 경우
//	@PostMapping("/BoardWritePro.bo")
//	public String writePro(
//			String board_name, String board_subject, String board_content, MultipartFile file) {
//		System.out.println(board_name + ", " + board_subject + ", " + board_content);
//		System.out.println("업로드 파일명 : " + file.getOriginalFilename());
//		
//		
//		return "";
//	}
	
	// 2) 파일을 제외한 나머지 파라미터를 Map 타입으로 처리하고, 파일은 MultipartFile 타입 변수로 처리
	//    => 주의! Map 타입 파라미터 선언 시 @RequestParam 어노테이션 필수!
//	@PostMapping("/BoardWritePro.bo")
//	public String writePro(
//			@RequestParam Map<String, String> map, MultipartFile file) {
//		System.out.println(map.get("board_name") + " " + map.get("board_subject") + " " + map.get("board_content"));
//		System.out.println("업로드 파일명 : " + file.getOriginalFilename());
//		
//		
//		return "";
//	}
	
	// 3) MultipartFile 타입 멤버변수를 포함하는 BoardVO 타입으로 모든 파라미터를 한꺼번에 처리
	// => BoardVO 클래스에 MultipartFile 타입 멤버변수 선언 시
	//    반드시 <input type="file"> 태그의 name 속성명과 동일한 이름의 멤버변수를 선언하고
	//    Getter/Setter 정의 필수!
	@PostMapping("/BoardWritePro.bo")
	public String writePro(BoardVO board, HttpSession session, Model model) {
//		System.out.println(board);
//		System.out.println("업로드 파일명 : " + board.getFile().getOriginalFilename());
		
		// 이클립스 프로젝트 상에 업로드 폴더(upload) 생성 필요 - resources 폴더에 생성(외부 접근용)
		// 이클립스가 관리하는 프로젝트 상의 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => request 또는 session 객체의 getServletContext() 메서드를 호출하여 서블릿 컨텍스트 객체를 얻어낸 후
		//    다시 getRealPath() 메서드를 호출하여 실제 업로드 경로 알아낼 수 있다!
		//    (JSP 일 경우 request 객체로 getRealPath() 메서드 호출이 가능함)
		String uploadDir = "/resources/upload"; // 프로젝트 상의 업로드 경로
//		String saveDir = request.getServletContext().getRealPath(uploadDir);
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		// => D:\Shared\Spring\workspace_spring3\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring_MVC_Board\resources\ upload
//		System.out.println("실제 업로드 경로 : " + saveDir);
		
		try {
			// -----------------------------------------------------------------------
			// 업로드 디렉토리를 날짜별 디렉토리로 분류하기
			// => 하나의 디렉토리에 너무 많은 파일이 존재하면 로딩 시간 길어짐
			//    따라서, 날짜별로 디렉토리를 구별하기 위해 java.util.Date 클래스 활용
			Date date = new Date();
			// SimpleDateFormat 클래스를 활용하여 날짜 형식을 "연연연연-월월-일일" 로 지정
			// => 단, 편의상 디렉토리 구조를 그대로 나타내기 위해 - 대신 / 기호 사용
			//    (가장 정확히 표현하려면 디렉토리 구분자를 File.seperator 상수로 사용)
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			board.setBoard_file_path("/" + sdf.format(date));
			
			// 기본 업로드 경로와 서브 디렉토리 경로 결합하여 저장
			saveDir = saveDir + board.getBoard_file_path();
			// -----------------------------------------------------------------------
			
			// java.nio.file.Paths 클래스의 get() 메서드를 호출하여  
			// 실제 경로를 관리하는 java.nio.file.Path 타입 객체를 리턴받기(파라미터 : 실제 업로드 경로)
			Path path = Paths.get(saveDir);
			// Files 클래스의 createDirectories() 메서드를 호출하여 Path 객체가 관리하는 경로 없으면 생성
			// => 거쳐가는 경로들 중 없는 경로는 모두 생성
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		// => 단, 복수개의 파일(파라미터)이 관리되는 경우 MultipartFile[] 타입으로 꺼내기
		MultipartFile mFile = board.getFile(); // 단일 파일
//		MultipartFile[] mFiles = board.getFiles(); // 복수 파일
		
		String originalFileName = mFile.getOriginalFilename();
//		System.out.println("원본 파일명 : " + originalFileName);
		
		// 파일명 중복 방지를 위한 대책
		// 현재 시스템(서버)에서 랜덤ID 값을 추출하여 파일명 앞에 붙여
		// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
		// => 랜덤ID 생성은 java.util.UUID 클래스 활용(UUID = 범용 고유 식별자)
		String uuid = UUID.randomUUID().toString();
//		System.out.println("UUID : " + uuid);
		
		// 생성된 UUID 값을 원본 파일명 앞에 결합(파일명과 구분을 위해 _ 기호 추가)
		// => 나중에 사용자에게 다운로드 파일명 표시할 때 원래 파일명 표시를 위해 분리할 때 사용
		//    (가장 먼저 만나는 _ 기호를 기준으로 문자열 분리하여 처리)
		// => 단, 파일명 길이 조절을 위해 UUID 중 맨 앞의 8자리 문자열만 활용
		//    (substring(0, 8) 메서드 활용)
//		originalFileName = UUID.randomUUID().toString() + "_" + originalFileName;
		// => 생성된 파일명을 BoardVO 객체의 board_file 변수에 저장
		board.setBoard_file(uuid.substring(0, 8) + "_" + originalFileName);
		System.out.println("실제 업로드 될 파일명 : " + board.getBoard_file());
		
		// -------------------------------------------------------------------------------
		
		// BoardService - registBoard() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = service.registBoard(board);
		
		// 게시물 등록 작업 결과 판별
		// => 성공 시 업로드 파일을 실제 폴더에 이동시킨 후 BoardList.bo 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지를 저장 후 fail_back.jsp 페이지로 포워딩
		if(insertCount > 0) { // 성공
			// 업로드 된 파일은 MultipartFile 객체에 의해 임시 폴더에 저장되어 있으며
			// 글쓰기 작업 성공 시 임시 위치에 저장된 파일을 실제 폴더로 옮기는 작업 필요
			// => MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(업로드)
			//    (파라미터 : java.io.File 객체 => new File(업로드 경로, 업로드 파일명))
			try {
				mFile.transferTo(new File(saveDir, board.getBoard_file()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return "redirect:/BoardList.bo";
		} else { // 실패
			model.addAttribute("msg", "글 쓰기 실패!");
			return "fail_back";
		}
		
	}
	
	// "/BoardList.bo" 서블릿 요청에 대한 글 목록 조회 비즈니스 로직 list() - GET
	// => 파라미터 : 검색타입(searchType) => 기본값 널스트링("")으로 설정
	//               검색어(searchKeyword) => 기본값 널스트링("")으로 설정
	//               현재 페이지번호(pageNum) => 기본값 1 로 설정(파라미터 없을 경우 대비)
	//               데이터 공유 객체 Model(model)
	// => 검색어를 입력하지 않고 검색버튼 클릭했을 때에도 전체 게시물 목록 조회
	//    (필요에 따라 검색어 미입력 시 경고창 출력 또는 아무 동작 수행하지 않을 수 있음)
//	@GetMapping("/BoardList.bo")
//	public String list(
//			@RequestParam(defaultValue = "") String searchType, 
//			@RequestParam(defaultValue = "") String searchKeyword, 
//			@RequestParam(defaultValue = "1") int pageNum, 
//			Model model) {
////		System.out.println("검색타입 : " + searchType);
////		System.out.println("검색어 : " + searchKeyword);
////		System.out.println("페이지번호 : " + pageNum);
//		
//		// -----------------------------------------------------------------------
//		// 페이징 처리를 위해 조회 목록 갯수 조절 시 사용될 변수 선언
//		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
//		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
//		// -----------------------------------------------------------------------
//		// BoardService - getBoardList() 메서드를 호출하여 게시물 목록 조회
//		// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수
//		// => 리턴타입 : List<BoardVO>(boardList)
//		List<BoardVO> boardList = 
//				service.getBoardList(searchType, searchKeyword, startRow, listLimit);
//		// -----------------------------------------------------------------------
//		// 페이징 처리를 위한 계산 작업
//		// 한 페이지에서 표시할 페이지 목록(번호) 갯수 계산
//		// 1. BoardListService - getBoardListCount() 메서드를 호출하여
//		//    전체 게시물 수 조회(페이지 목록 갯수 계산에 사용)
//		//    => 파라미터 : 검색타입, 검색어   리턴타입 : int(listCount)
//		int listCount = service.getBoardListCount(searchType, searchKeyword);
////		System.out.println("총 게시물 수 : " + listCount);
//		
//		// 2. 한 페이지에서 표시할 페이지 목록 갯수 설정
//		int pageListLimit = 5; // 페이지 목록 갯수를 5개로 제한
//		
//		// 3. 전체 페이지 목록 수 계산
//		// => 전체 게시물 수를 목록 갯수로 나누고, 남은 나머지가 0보다 클 경우 페이지 수 + 1
//		//    (페이지수 + 1 계산하기 위해 삼항연산자 활용)
//		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
//		
//		// 4. 시작 페이지 번호 계산
//		// => 페이지 목록 갯수가 3일 때
//		//    1 ~ 3 페이지 사이일 경우 시작 페이지 번호 : 1
//		//    4 ~ 6 페이지 사이일 경우 시작 페이지 번호 : 4
//		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
//		
//		// 5. 끝 페이지 번호 계산
//		// => 시작 페이지 번호에 페이지 목록 갯수를 더한 후 - 1
//		int endPage = startPage + pageListLimit - 1;
//		
//		// 만약, 끝 페이지 번호(endPage) 가 최대 페이지 번호(maxPage) 보다 클 경우
//		// 끝 페이지 번호를 최대 페이지 번호로 교체
//		if(endPage > maxPage) {
//			endPage = maxPage;
//		}
//		
//		// 페이징 처리 정보를 저장하는 PageInfo 클래스 인스턴스 생성 및 데이터 저장
//		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
//		System.out.println(pageInfo);
//		// ------------------------------------------------------------------------------------
//		// 조회된 게시물 목록 객체(boardList) 와 페이징 정보 객체(pageInfo)를 Model 객체에 저장
//		model.addAttribute("boardList", boardList);
//		model.addAttribute("pageInfo", pageInfo);
//		
//		return "board/board_list";
//	}
	
	@GetMapping("/BoardList.bo")
	public String list() {
		return "board/board_list";
	}
	
	// "/BoardDetail.bo" 서블릿 요청에 대한 글 상세정보 조회 
	// => Serivice - getBoard()
	@GetMapping(value = "/BoardDetail.bo")
	public String detail(@RequestParam int board_num, Model model) {
		// Service 객체의 getBoard() 메서드를 호출하여 게시물 상세 정보 조회
		// => 파라미터 : 글번호    리턴타입 : BoardVO(board)
		BoardVO board = service.getBoard(board_num);
//		System.out.println(board);
		
		// 조회된 게시물 정보가 존재할 경우 조회수 증가 - increaseReadcount()
		// => 파라미터 : 글번호    리턴타입 : void
		if(board != null) {
			service.increaseReadcount(board_num);
			// 조회수 증가 작업 완료 후 BoardVO 객체의 조회수(board_readcount)값 1 증가
			board.setBoard_readcount(board.getBoard_readcount() + 1);
		}
		
		// Model 객체에 BoardVO 객체 추가
		model.addAttribute("board", board);
		
		// -----------------------------------------------------
		// 댓글 목록 불러오기
		// Service 객체의 getTinyReplyBoardList() 메서드를 호출하여 댓글 목록 조회
		// => 파라미터 : 글번호    리턴타입 : List<TinyReplyBoardVO>(tinyReplyBoardList)
		List<TinyReplyBoardVO> tinyReplyBoardList = service.getTinyReplyBoardList(board_num);
		model.addAttribute("tinyReplyBoardList", tinyReplyBoardList);
		System.out.println(tinyReplyBoardList);
		// -----------------------------------------------------
		
		return "board/board_view";
	}
	
	// AJAX 요청을 통한 글목록 조회
	@ResponseBody
	@GetMapping("/BoardListJson.bo")
	public String listJson(
			@RequestParam(defaultValue = "") String searchType, 
			@RequestParam(defaultValue = "") String searchKeyword, 
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
		
		// -----------------------------------------------------------------------
		// 페이징 처리를 위해 조회 목록 갯수 조절 시 사용될 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록 갯수(10개로 제한)
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호(startRow) 계산 => 0, 10, 20...
		// -----------------------------------------------------------------------
		// BoardService - getBoardList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수
		// => 리턴타입 : List<BoardVO>(boardList)
		List<BoardVO> boardList = 
				service.getBoardList(searchType, searchKeyword, startRow, listLimit);
		// -----------------------------------------------------------------------
		JSONArray jsonArray = new JSONArray(boardList);
		System.out.println(jsonArray);
		
		return jsonArray.toString();
	}
//	
//	// "/BoardDetail.bo" 서블릿 요청에 대한 글 상세정보 조회 
//	// => Serivice - getBoard()
//	@GetMapping(value = "/BoardDetail.bo")
//	public String detail(@RequestParam int board_num, Model model) {
//		// Service 객체의 getBoard() 메서드를 호출하여 게시물 상세 정보 조회
//		// => 파라미터 : 글번호    리턴타입 : BoardVO(board)
//		BoardVO board = service.getBoard(board_num);
////		System.out.println(board);
//		
//		// 조회된 게시물 정보가 존재할 경우 조회수 증가 - increaseReadcount()
//		// => 파라미터 : 글번호    리턴타입 : void
//		if(board != null) {
//			service.increaseReadcount(board_num);
//			// 조회수 증가 작업 완료 후 BoardVO 객체의 조회수(board_readcount)값 1 증가
//			board.setBoard_readcount(board.getBoard_readcount() + 1);
//		}
//		
//		// Model 객체에 BoardVO 객체 추가
//		model.addAttribute("board", board);
//		
//		// -----------------------------------------------------
//		// 댓글 목록 불러오기
//		// Service 객체의 getTinyReplyBoardList() 메서드를 호출하여 댓글 목록 조회
//		// => 파라미터 : 글번호    리턴타입 : List<TinyReplyBoardVO>(tinyReplyBoardList)
//		List<TinyReplyBoardVO> tinyReplyBoardList = service.getTinyReplyBoardList(board_num);
//		model.addAttribute("tinyReplyBoardList", tinyReplyBoardList);
//		System.out.println(tinyReplyBoardList);
//		// -----------------------------------------------------
//		
//		return "board/board_view";
//	}
	
//	@GetMapping("/BoardDeleteForm.bo")
//	public String deleteForm(@RequestParam int board_num, HttpSession session, Model model) {
//		// 세션 아이디가 없거나 세션 아이디와 게시물의 작성자 아이디가 다를 경우
//		// 자바스크립트를 사용하여 "권한 없음!" 출력 후 이전페이지로 돌아가기
//		// => Service - getWriter() 메서드 활용(Mapper - selectWriter() 메서드 활용)
//		String id = (String)session.getAttribute("sId");
//		if(id == null) {
//			model.addAttribute("msg", "권한 없음!");
//			return "fail_back";
//		} else {
//			// 글번호와 세션 아이디를 전달하여 해당 게시물의 작성자와 세션아이디가 일치하는지 확인
//			String board_name = service.getWriter(board_num, id);
////			System.out.println(board_name);
//			
//			// 리턴받은 작성자(board_name)이 null 일 경우 불일치, 아니면 일치
//			if(board_name == null) {
//				model.addAttribute("msg", "권한 없음!");
//				return "fail_back";
//			} else {
//				return "board/board_delete_form";
//			}
//		}
//		
//	}
	
	@GetMapping("/BoardDelete.bo")
	public String deleteForm(
			@RequestParam int board_num, @RequestParam int pageNum, HttpSession session, Model model) {
		// 세션 아이디가 없거나 세션 아이디와 게시물의 작성자 아이디가 다를 경우
		// 자바스크립트를 사용하여 "권한 없음!" 출력 후 이전페이지로 돌아가기
		// => Service - getWriter() 메서드 활용(Mapper - selectWriter() 메서드 활용)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "권한 없음!");
			return "fail_back";
		} else {
			// 글번호와 세션 아이디를 전달하여 해당 게시물의 작성자와 세션아이디가 일치하는지 확인
			String board_name = service.getWriter(board_num, id);
//			System.out.println(board_name);
			
			// 리턴받은 작성자(board_name)이 null 일 경우 불일치, 아니면 일치
			if(board_name == null) {
				model.addAttribute("msg", "삭제 실패!");
				return "fail_back";
			} else {
				// 글 삭제 비즈니스 로직 처리
				// Service - removeBoard()
				// => 파라미터 : 글번호   리턴타입 : int(deleteCount)
				int deleteCount = service.removeBoard(board_num);
				
				// 삭제 성공 시 글목록 페이지(BoardList.bo) 로 리다이렉트(파라미터 : 페이지번호)
				//      실패 시 자바스크립트로 "삭제 실패!" 출력 후 이전페이지 돌아가기
				if(deleteCount > 0) {
					return "redirect:/BoardList.bo?pageNum=" + pageNum;
				} else {
					model.addAttribute("msg", "삭제 실패!");
					return "fail_back";
				}
			}
		}
	}
	
	// "/BoardModifyForm.bo" 요청에 대한 글 수정 폼 페이지(board_modify_form.jsp) 포워딩 
	// 단, 현재 세션 아이디가 null 이거나 작성자 아이디와 세션아이디가 다르면 
	// "권한 없음!" 출력 후 이전페이지로 돌아가기
	@GetMapping("/BoardModifyForm.bo")
	public String modifyForm(@RequestParam int board_num, HttpSession session, Model model) {
		// 세션 아이디가 없거나 세션 아이디와 게시물의 작성자 아이디가 다를 경우
		// 자바스크립트를 사용하여 "권한 없음!" 출력 후 이전페이지로 돌아가기
		// => Service - getWriter() 메서드 활용(Mapper - selectWriter() 메서드 활용)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "권한 없음!");
			return "fail_back";
		} else {
			// 글번호와 세션 아이디를 전달하여 해당 게시물의 작성자와 세션아이디가 일치하는지 확인
			String board_name = service.getWriter(board_num, id);
//			System.out.println(board_name);
			
			// 리턴받은 작성자(board_name)이 null 일 경우 불일치, 아니면 일치
			if(board_name == null) {
				model.addAttribute("msg", "권한 없음!");
				return "fail_back";
			} else {
				// Service - getBoard() 메서드를 호출하여 글 상세정보 조회(재사용)
				// => 파라미터 : 글번호   리턴타입 : BoardVO(board)
				BoardVO board = service.getBoard(board_num);
				model.addAttribute("board", board);
				
				return "board/board_modify_form";
			}
		}
	}
	
	// 글 수정 과정에서 파일 삭제 처리를 별도로 수행하는 deleteFile() 메서드(AJAX 요청 처리)
	// => 파라미터 : 글번호, 파일명
	// => 단, 페이지 이동 처리 없이 기존 페이지 그대로 응답 메세지만 전달하려면
	//    @ResponseBody 어노테이션 적용, 리턴타입을 void 로 명시, 
	//    HttpServletResponse, HttpSession 타입 파라미터 선언
	//    응답 데이터의 인코딩 타입 지정, PrintWriter 객체를 통한 응답 데이터 출력
	@ResponseBody
	@PostMapping("/BoardDeleteFile.bo")
	public void deleteFile(
			@RequestParam int board_num, 
			@RequestParam String board_file,
			@RequestParam String board_file_path,
			HttpServletResponse response,
			HttpSession session) {
//		System.out.println(board_num + ", " + board_file);
		
		try {
			// 응답데이터 출력을 위한 response 객체의 인코딩 타입 설정
			response.setCharacterEncoding("UTF-8");
			
			// Service - removeBoardFile() 메서드 호출하여 파일 삭제 요청
			// => 파라미터 : 글번호   리턴타입 : int(deleteCount)
			int deleteCount = service.removeBoardFile(board_num);
			
			// DB 파일 삭제 성공 시 실제 파일을 서버에서 삭제
			if(deleteCount > 0) {
				String uploadDir = "/resources/upload"; // 프로젝트 상의 업로드 경로
				String saveDir = session.getServletContext().getRealPath(uploadDir); // 실제 업로드 경로
				// 실제 업로드 경로에 서브 디렉토리명 결합
				saveDir += board_file_path;
				
				// Paths.get() 메서드를 호출하여 파일 경로 관리 객체(Path) 생성
				// => 업로드 디렉토리와 파일명 결합하여 전달
				Path path = Paths.get(saveDir + "/" + board_file);
				// Files 클래스의 deleteIfExists() 메서드를 호출하여 파일 존재 시 삭제
				// => 파라미터 : 경로
				Files.deleteIfExists(path);
				
				// response 객체의 getWriter() 메서드를 호출하여 PrintWriter 객체를 얻어온 후
				// 다시 print() 또는 println() 메서드를 호출하여 응답데이터 출력
				response.getWriter().print("true");
			} else {
				response.getWriter().print("false");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@PostMapping("/BoardModifyPro.bo")
	public String modifyPro(
			BoardVO board, 
			@RequestParam(defaultValue = "1") int pageNum,
			Model model, 
			HttpSession session) {
		// 파일 업로드 버튼 있고, 업로드 시 파일명 전달되고, 미업로드 시 널스트링("") 전달됨
		// 그러나, 기존 파일이 있는 상태에서는 파일 업로드 버튼이 없으며 null 전달됨
//		System.out.println(board.getBoard_name());
//		System.out.println(board.getBoard_subject());
//		System.out.println(board.getBoard_content());
//		System.out.println(board.getBoard_file()); // 파일명 전달되거나, 널스트링이거나, null
		// ----------------------------------------------------------------------
		// enctype="multipart/form-data" 로 form 태그를 설정한 경우
		// request 객체의 일반적인 처리 방법으로는 처리가 불가능하며
		// 파일은 MultipartFile 타입을 사용해야한다. (글쓰기와 동일)
		// => input type="file" 태그에서 파일을 선택하거나 선택하지 않거나 둘 다 객체 존재함
		//    그러나, 기존 파일이 있는 상태에서는 MultipartFile 타입 객체가 null
		boolean isUploadProcess = false; // 업로드 작업 수행 여부를 저장하는 변수 선언
//		if(board.getFile() != null && !board.getFile().getOriginalFilename().equals("")) { 
//			// 기존 업로드 된 파일이 없는 경우(파일 업로드 버튼을 통해 업로드 파일 선택 여부와 무관)
////			System.out.println("파일 업로드 버튼 있음!");
//			
//			// 파일 업로드 버튼을 통해 파일을 선택한 경우
////			System.out.println("파일 선택함!");
//			
//			isUploadProcess = true;
//		} else {
////			System.out.println("파일 업로드 버튼 없음! 또는 파일 선택 안함!");
//			isUploadProcess = false;
//		}
		
		String uploadDir = "/resources/upload"; // 프로젝트 상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		if(board.getFile() != null && !board.getFile().getOriginalFilename().equals("")) {
			isUploadProcess = true;
			
			// BoardVO 객체에 전달된 MultipartFile 객체로부터 파일명 알아내기
			String originalFileName = board.getFile().getOriginalFilename();
			
			// 파일명 중복 방지를 위한 대책
			String uuid = UUID.randomUUID().toString();
			board.setBoard_file(uuid.substring(0, 8) + "_" + originalFileName);
			System.out.println("실제 업로드 될 파일명 : " + board.getBoard_file());
			
			// 날짜별 디렉토리명 생성
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			board.setBoard_file_path("/" + sdf.format(date));
			saveDir = saveDir + board.getBoard_file_path();
		}
		
		// DB 처리(UPDATE) 작업 수행
		// BoardService - modifyBoard() 메서드를 호출하여 글 수정 작업 요청
		// => 파라미터 : BoardVO 객체(board)   리턴타입 : int(updateCount)
		// => 단, DB 작업 처리 전 업로드 파일명을 먼저 처리하여 저장 필요!
		int updateCount = service.modifyBoard(board);
		
		// DB 작업 처리 결과 판별
		// => 수행 성공 시 isUploadProcess 가 true 일 경우 파일 업로드 처리 작업 추가 수행
		//    isUploadProcess 가 false 일 경우 파일 업로드 처리 수행 X
		//    둘 다 BoardDetail.bo 서블릿 요청(리다이렉트) => 파라미터 : 글번호, 페이지번호
		if(updateCount > 0) { // DB 작업 처리 성공 시
			if(isUploadProcess) { // 업로드 할 파일이 있을 경우
				try {
					// 디렉토리 생성
					Path path = Paths.get(saveDir);
					Files.createDirectories(path);
					
					// BoardVO 객체에 전달된 MultipartFile 객체 꺼내서 파일 업로드 처리
					MultipartFile mFile = board.getFile(); // 단일 파일
					mFile.transferTo(new File(saveDir, board.getBoard_file()));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			return "redirect:/BoardDetail.bo?board_num=" + board.getBoard_num() + "&pageNum=" + pageNum;
		} else { // DB 작업 처리 실패
			// 자바스크립트를 사용하여 "글 수정 실패!" 출력 후 이전 페이지로 돌아가기
			model.addAttribute("msg", "글 수정 실패!");
			return "fail_back";
		}
		
	}
	
	// "/BoardReplyForm.bo" 요청에 대한 답글 작성 폼 페이지(board_reply_form.jsp) 포워딩 
	// 단, 현재 세션 아이디가 null 이면 "로그인 필수!" 출력 후 로그인 페이지로 리다이렉트
	@GetMapping("/BoardReplyForm.bo")
	public String replyForm(@RequestParam int board_num, HttpSession session, Model model) {
		// 세션 아이디가 없을 경우
		// 자바스크립트를 사용하여 "권한 없음!" 출력 후 이전페이지로 돌아가기
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("target", "MemberLoginForm.me");
			return "success";
		} else {
			// Service - getBoard() 메서드를 호출하여 글 상세정보 조회(재사용)
			// => 파라미터 : 글번호   리턴타입 : BoardVO(board)
			BoardVO board = service.getBoard(board_num);
			model.addAttribute("board", board);
			
			return "board/board_reply_form";
		}
	}
	
	@PostMapping("/BoardReplyPro.bo")
	public String modifyPro(BoardVO board, HttpSession session, Model model) {
		String uploadDir = "/resources/upload"; // 프로젝트 상의 업로드 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		try {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			board.setBoard_file_path("/" + sdf.format(date));
			saveDir = saveDir + board.getBoard_file_path();
			
			Path path = Paths.get(saveDir);
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MultipartFile mFile = board.getFile(); // 단일 파일
		String originalFileName = mFile.getOriginalFilename();
		
		// 파일명 중복 방지를 위한 대책
		String uuid = UUID.randomUUID().toString();
		board.setBoard_file(uuid.substring(0, 8) + "_" + originalFileName);
		
		// BoardService - registReplyBoard() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = service.registReplyBoard(board);
		
		// 게시물 등록 작업 결과 판별
		// => 성공 시 업로드 파일을 실제 폴더에 이동시킨 후 BoardList.bo 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지를 저장 후 fail_back.jsp 페이지로 포워딩
		if(insertCount > 0) { // 성공
			// 업로드 된 파일은 MultipartFile 객체에 의해 임시 폴더에 저장되어 있으며
			// 글쓰기 작업 성공 시 임시 위치에 저장된 파일을 실제 폴더로 옮기는 작업 필요
			// => MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(업로드)
			//    (파라미터 : java.io.File 객체 => new File(업로드 경로, 업로드 파일명))
			try {
				mFile.transferTo(new File(saveDir, board.getBoard_file()));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return "redirect:/BoardList.bo";
		} else { // 실패
			model.addAttribute("msg", "답글 쓰기 실패!");
			return "fail_back";
		}
		
	}
	
	@PostMapping("/BoardTinyReplyWrite.bo")
	public String tinyReplyWrite(TinyReplyBoardVO board, Model model) {
//		System.out.println(board);
		
		// BoardService - registTinyReplyBoard() 메서드를 호출하여 댓글 등록 작업 요청
		// => 파라미터 : TinyReplyBoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = service.registTinyReplyBoard(board);
		
		// 게시물 등록 작업 결과 판별
		if(insertCount > 0) { // 성공
			return "redirect:/BoardDetail.bo?board_num=" + board.getBoard_num();
		} else { // 실패
			model.addAttribute("msg", "댓글 쓰기 실패!");
			return "fail_back";
		}
		
	}
	
	@GetMapping("/BoardTinyReplyDelete.bo")
	public String tinyReplyDelete(TinyReplyBoardVO board, Model model) {
		System.out.println(board);
		
		// BoardService - removeTinyReplyBoard() 메서드를 호출하여 댓글 등록 작업 요청
		// => 파라미터 : TinyReplyBoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = service.removeTinyReplyBoard(board);
		
		// 댓글 삭제 작업 결과 판별
		if(insertCount > 0) { // 성공
			return "redirect:/BoardDetail.bo?board_num=" + board.getBoard_num();
		} else { // 실패
			model.addAttribute("msg", "댓글 삭제 실패!");
			return "fail_back";
		}
		
	}
	
	@PostMapping("/BoardTinyReReplyWrite.bo")
	public String tinyReReplyWrite(TinyReplyBoardVO board, Model model) {
//		System.out.println(board);
		
		// BoardService - registTinyReReplyBoard() 메서드를 호출하여 대댓글 등록 작업 요청
		// => 파라미터 : TinyReplyBoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = service.registTinyReReplyBoard(board);
		
		// 게시물 등록 작업 결과 판별
		if(insertCount > 0) { // 성공
			return "redirect:/BoardDetail.bo?board_num=" + board.getBoard_num();
		} else { // 실패
			model.addAttribute("msg", "댓글 쓰기 실패!");
			return "fail_back";
		}
		
	}
	
}













