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



}
