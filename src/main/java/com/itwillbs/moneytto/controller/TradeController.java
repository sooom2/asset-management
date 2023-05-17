package com.itwillbs.moneytto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.moneytto.service.TradeService;

@Controller
public class TradeController {
	
	@Autowired
	private TradeService tradeService;
	
	@RequestMapping(value = "/trade_payment", method = {RequestMethod.GET, RequestMethod.POST})
	public String tradePayment() {
		
		return "trade/trade_payment";
	}
}
