package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	// 분실물 글 등록
	public int registLostBoard(HashMap<String, String> map) {
		
//		System.out.println("BoardService" + board);
		return mapper.insertLostBoard(map);
	}
	
	// 고객센터 홈 분실물 목록과 관리자 분실물 목록
	public List<HashMap<String, String>> getLostBoardList(HashMap<String, String> map) {
//		System.out.println("service: " + mapper.selectLostBoardList());
		return mapper.selectLostBoardList(map);
	}

	// 분실물 상세
	public HashMap<String, String> getLostDetail(HashMap<String, String> map) {
		
		return mapper.selectLostDetail(map);
	}

	// 분실물 삭제
	public int getLostDelete(HashMap<String, String> map) {
		
		return mapper.deleteLostBoard(map);
	}
	
	// 분실물 답변 창
	public HashMap<String, String> getLostBoard(String lost_code) {
		
		return mapper.selectLostBoard(lost_code);
	}
	
	// 분실물 답변 등록
	public int registLostUpdate(HashMap<String, String> map) {
		
		return mapper.updatLostBoard(map);
	}
	
	// 1대1 저장
	public int registOneBoard(HashMap<String, String> map) {
//		System.out.println("service: " + map);
		return mapper.insertOneBoard(map);
	}

	// 관리자 1대1 문의 목록
	public List<HashMap<String, String>> getOneBoardList(HashMap<String, String> map) {
		return mapper.selectOneBoardList(map);
	}
	
	// 1대1 문의 목록
	public List<HashMap<String, String>> getBoardList(HashMap<String, String> map) {
		return mapper.selectBoardList(map);
	}

	// 관리자 공지사항 등록
	public int registNoticeBoard(HashMap<String, String> map) {
		
		return mapper.insertNoticeBoard(map);
	}

	// 공지사항 목록
	public List<HashMap<String, String>> getNoticeBoardList(HashMap<String, String> map) {
		
		return mapper.selectNoticeBoardList(map);
	}

	// 공지사항 상세
	public HashMap<String, String> getNoticeDetail(HashMap<String, String> map) {
		
		return mapper.selectNoticeDetail(map);
	}

	// 공지사항 수정창
	public HashMap<String, String> getNoticeBoard(String notice_code) {
		
		return mapper.selectNoticeBoard(notice_code);
	}

	// 공지사항 수정
	public int registNoticeUpdate(HashMap<String, String> map) {
		
		return mapper.updateNoticeBoard(map);
	}

	// 공지사항 삭제
	public int getNoticeDelete(HashMap<String, String> map) {
		
		return mapper.deleteNoticeBoard(map);
	}

	// 자주묻는 질문 목록
	public List<HashMap<String, String>> getFaqBoardList(HashMap<String, String> map) {
		
		return mapper.selectFaqBoardList(map);
	}
	
	// 자주묻는 질문 상세
	public HashMap<String, String> getFaqDetail(HashMap<String, String> map) {
		
		return mapper.selectFaqDetail(map);
	}

	// 자주묻는 질문 등록
	public int registFaqBoard(HashMap<String, String> map) {
		
		return mapper.insertFaqBoard(map);
	}

	// 자주묻는 질문 수정창
	public HashMap<String, String> getFaqBoard(String faq_code) {
		
		return mapper.selectFaqBoard(faq_code);
	}

	// 자주묻는 질문 수정
	public int registFaqUpdate(HashMap<String, String> map) {
		
		return mapper.updatFaqBoard(map);
	}

	// 자주묻는 질문 삭제
	public int getFaqDelete(HashMap<String, String> map) {
		
		return mapper.deleteFaqBoard(map);
	}

	// 1:1 답변창
	public HashMap<String, String> getOneBoard(String one_code) {
		
		return mapper.selectOneBoard(one_code);
	}

	// 1:1 답변등록
	public int registOneUpdate(HashMap<String, String> map) {
		
		return mapper.updatOneBoard(map);
	}
	
	// 1:1 삭제
	public int getOneDelete(HashMap<String, String> map) {
		
		return mapper.deleteOneBoard(map);
	}

	// 내가 문의한 내역 상세 지금 사용 x
	public HashMap<String, String> getOneDetail(HashMap<String, String> map) {
		
		return mapper.selectOneDetail(map);
	}

	// 내가 문의한 내역 상세
	public HashMap<String, String> getDetail(HashMap<String, String> map) {
		return mapper.selectDetail(map);
	}

	// 내가 문의한 내역 삭제
	public int getDelete(HashMap<String, String> map) {
		return mapper.deleteBoard(map);
	}

	// 분실물 문의 페이지 목록 -> 비밀번호 조회
	public List<HashMap<String, String>> checkLostPasswd(HashMap<String, String> map) {
		return mapper.selectLostPasswd(map);
	}

	// 내가 문의한 페이지 목록 -> 비밀번호 조회
	public List<HashMap<String, String>> checkOnePasswd(HashMap<String, String> map) {
		
		return mapper.selectOnePasswd(map);
	}

	

	

	


	
	
	
	
	
	
	
}
