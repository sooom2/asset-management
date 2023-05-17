package com.itwillbs.moneytto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.TradeMapper;

@Service
public class TradeService {

	@Autowired
	private TradeMapper mapper;
}
