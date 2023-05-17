package com.itwillbs.moneytto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itwillbs.moneytto.service.TradeService;

@Controller
public class TradeController {
	
	@Autowired
	private TradeService tradeService;
}
