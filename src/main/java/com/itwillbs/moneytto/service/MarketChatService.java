package com.itwillbs.moneytto.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.MarketMapper;

@Service
public class MarketChatService {

	@Autowired
	private MarketMapper mapper;

	public HashMap<String, String> getItem(String item_code) {
		return mapper.getItem(item_code);
	}
}
