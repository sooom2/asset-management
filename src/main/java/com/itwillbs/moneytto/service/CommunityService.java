package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.CommunityMapper;

@Service
public class CommunityService {

	@Autowired
	private CommunityMapper mapper;
	
	public int insertBoard(HashMap<String, String> board) {
		return mapper.insertBoard(board);
	}

	public List<HashMap<String, String>> boardList(HashMap<String, String> board) {
		return mapper.boardList(board);
	}

	public HashMap<String, String> boardDetail(String comm_code) {
		return mapper.boardDetail(comm_code);
	}

	public int increaseViews(String comm_code) {
	    return mapper.increaseViews(comm_code);
	}

	public int addComment(HashMap<String, String> comment) {
		return mapper.addComment(comment);
	}


	public List<HashMap<String, String>> replyList(String comm_code) {
		return mapper.replyList(comm_code);
	}

	public int commentCount(String comm_code) {
		return mapper.commentCount(comm_code);
	}

	public HashMap<String, String> getComment(int reply_code) {
		return mapper.getComment(reply_code);
	}

	public int deleteComment(int reply_code) {
		return mapper.deleteComment(reply_code);
	}

	public int deleteBoard(String comm_code) {
		return mapper.deleteBoard(comm_code);
	}





	



}
