package com.itwillbs.moneytto.service;

import java.util.HashMap;

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



}
