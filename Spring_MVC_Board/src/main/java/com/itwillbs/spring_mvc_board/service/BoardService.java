package com.itwillbs.spring_mvc_board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.spring_mvc_board.mapper.BoardMapper;
import com.itwillbs.spring_mvc_board.vo.BoardVO;
import com.itwillbs.spring_mvc_board.vo.TinyReplyBoardVO;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;

	// 글 등록 작업 요청
	// BoardMapper - insertBoard()
	public int registBoard(BoardVO board) {
		return mapper.insertBoard(board);
	}

	// 게시물 목록 조회
	// BoardMapper - selectBoardList()
	public List<BoardVO> getBoardList(String searchType, String searchKeyword, int startRow, int listLimit) {
		System.out.println(searchType + ", " + searchKeyword + ", " + startRow + ", " + listLimit);
		return mapper.selectBoardList(searchType, searchKeyword, startRow, listLimit);
	}

	// 글 목록 총 갯수 조회
	public int getBoardListCount(String searchType, String searchKeyword) {
		return mapper.selectBoardListCount(searchType, searchKeyword);
	}

	// 글 상세정보 조회
	public BoardVO getBoard(int board_num) {
		return mapper.selectBoard(board_num);
	}

	// 글 조회수 증가
	public void increaseReadcount(int board_num) {
		mapper.updateReadcount(board_num);
	}

	// 글 작성자 조회
	public String getWriter(int board_num, String id) {
		return mapper.selectWriter(board_num, id);
	}

	// 글 삭제
	public int removeBoard(int board_num) {
		return mapper.deleteBoard(board_num);
	}

	// 파일 삭제
	public int removeBoardFile(int board_num) {
		return mapper.deleteBoardFile(board_num);
	}

	// 글 수정
	public int modifyBoard(BoardVO board) {
		return mapper.updateBoard(board);
	}

	// 답글 쓰기
	public int registReplyBoard(BoardVO board) {
		// 기존 답글들의 순서 번호 조정을 위해 updateBoardReSeq() 메서드 호출
		// => 파라미터 : BoardVO 객체   리턴 없음
		mapper.updateBoardReSeq(board);
		
		// 답글 등록 작업을 위해 insertReplyBoard() 메서드 호출
		// => 파라미터 : BoardVO 객체   리턴타입 : int
		return mapper.insertReplyBoard(board);
	}

	// 댓글 쓰기
	public int registTinyReplyBoard(TinyReplyBoardVO board) {
		return mapper.insertTinyReplyBoard(board);
	}

	// 댓글 목록 조회
	public List<TinyReplyBoardVO> getTinyReplyBoardList(int board_num) {
		return mapper.selectTinyReplyBoardList(board_num);
	}

	// 댓글 삭제
	public int removeTinyReplyBoard(TinyReplyBoardVO board) {
		return mapper.deleteTinyReplyBoard(board);
	}

	// 대댓글 쓰기
	public int registTinyReReplyBoard(TinyReplyBoardVO board) {
		return mapper.insertTinyReReplyBoard(board);
	}

	
}













