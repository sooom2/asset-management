package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public int registAuction(Map<String, String> auction) {
		return mapper.registAuction(auction);
	}

	public int registImage(Map<String, String> images) {
		return mapper.registImage(images);
	}

	
}
