package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

public interface BoardMapper {

	// 분실물 등록
	int insertLostBoard(HashMap<String, String> map);
	
	// 분실물 목록
	List<HashMap<String, String>> selectLostBoardList(HashMap<String, String> map);

	// 분실물 상세
	HashMap<String, String> selectLostDetail(HashMap<String, String> map);

	// 분실물 삭제
	int deleteLostBoard(HashMap<String, String> map);

	// 분실물 등록창
	HashMap<String, String> selectLostBoard(String lost_code);
	
	// 분실물 답변 등록
	int updatLostBoard(HashMap<String, String> map);
	
	// 1대1 등록
	int insertOneBoard(HashMap<String, String> map);

	// 1대1 문의 목록
	List<HashMap<String, String>> selectOneBoardList(HashMap<String, String> map);

	// 공지사항 등록
	int insertNoticeBoard(HashMap<String, String> map);

	// 공지사항 목록
	List<HashMap<String, String>> selectNoticeBoardList(HashMap<String, String> map);

	// 공지사항 상세
	HashMap<String, String> selectNoticeDetail(HashMap<String, String> map);

	// 공지사항 수정창
	HashMap<String, String> selectNoticeBoard(String notice_code);

	// 공지사항 수정
	int updateNoticeBoard(HashMap<String, String> map);

	// 공지사항 삭제
	int deleteNoticeBoard(HashMap<String, String> map);

	// 자주묻는 질문 목록
	List<HashMap<String, String>> selectFaqBoardList(HashMap<String, String> map);

	// 자주묻는 질문 상세
	HashMap<String, String> selectFaqDetail(HashMap<String, String> map);
		
	// 자주묻는 질문 등록
	int insertFaqBoard(HashMap<String, String> map);

	// 자주묻는 질문 수정창
	HashMap<String, String> selectFaqBoard(String faq_code);

	// 자주묻는 질문 수정
	int updatFaqBoard(HashMap<String, String> map);

	// 자주묻는 질문 삭제
	int deleteFaqBoard(HashMap<String, String> map);

	// 1:1 답변창 
	HashMap<String, String> selectOneBoard(String one_code);

	// 1:1 답변등록
	int updatOneBoard(HashMap<String, String> map);
	
	// 1:1 삭제
	int deleteOneBoard(HashMap<String, String> map);

	// 내가 문의한 내역 상세
	HashMap<String, String> selectOneDetail(HashMap<String, String> map);

	// 내가 문의한 목록
	List<HashMap<String, String>> selectBoardList(HashMap<String, String> map);

	// 내가 문의한 내역 상세
	HashMap<String, String> selectDetail(HashMap<String, String> map);

	// 내가 문의한 내역 삭제
	int deleteBoard(HashMap<String, String> map);

	// 분실물 문의 페이지 목록 -> 비밀번호 조회
	List<HashMap<String, String>> selectLostPasswd(HashMap<String, String> map);

	// 내가 문의한 페이지 목록 -> 비밀번호 조회
	List<HashMap<String, String>> selectOnePasswd(HashMap<String, String> map);

	

	

	





	
	
	
}
