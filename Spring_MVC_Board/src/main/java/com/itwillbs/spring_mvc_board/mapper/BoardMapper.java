package com.itwillbs.spring_mvc_board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.spring_mvc_board.vo.BoardVO;
import com.itwillbs.spring_mvc_board.vo.TinyReplyBoardVO;

public interface BoardMapper {

	// 글 쓰기
	int insertBoard(BoardVO board);

	// 글 목록 조회
	// => 복수개의 파라미터 구분을 위해 @Param 어노테이션을 통해 파라미터명 지정 필수!
	List<BoardVO> selectBoardList(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 글 목록 총 갯수 조회
	int selectBoardListCount(
			@Param("searchType") String searchType, @Param("searchKeyword") String searchKeyword);

	// 글 상세 정보 조회
	BoardVO selectBoard(int board_num);

	// 글 조회수 증가
	void updateReadcount(int board_num);

	// 글 작성자 조회
	String selectWriter(@Param("board_num") int board_num, @Param("id") String id);

	// 글 삭제
	int deleteBoard(int board_num);

	// 파일 삭제
	int deleteBoardFile(int board_num);

	// 글 수정
	int updateBoard(BoardVO board);

	// 기존 답글 순서번호 조정
	void updateBoardReSeq(BoardVO board);
	
	// 답글 쓰기
	int insertReplyBoard(BoardVO board);

	// 댓글 쓰기
	int insertTinyReplyBoard(TinyReplyBoardVO board);

	// 댓글 목록 조회
	List<TinyReplyBoardVO> selectTinyReplyBoardList(int board_num);

	// 댓글 삭제
	int deleteTinyReplyBoard(TinyReplyBoardVO board);

	// 대댓글 쓰기
	int insertTinyReReplyBoard(TinyReplyBoardVO board);


}















