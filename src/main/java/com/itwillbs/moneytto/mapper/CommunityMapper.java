package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

public interface CommunityMapper {
	
	//커뮤니티 글등록 
	int insertBoard(HashMap<String, String> board);

	List<HashMap<String, String>> boardList(HashMap<String, String> board);

	HashMap<String, String> boardDetail(String comm_code);

	int increaseViews(String comm_code);

	int addComment(HashMap<String, String> comment);

	List<HashMap<String, String>> replyList(String comm_code);

	int commentCount(String comm_code);

	int deleteComment(int reply_code);

	HashMap<String, String> getComment(int reply_code);

	int deleteBoard(String comm_code);

	List<HashMap<String, String>> noticeList(HashMap<String, String> board);

	

	

	
	
	
}
