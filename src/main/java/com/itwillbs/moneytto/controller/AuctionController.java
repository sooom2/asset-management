package com.itwillbs.moneytto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuctionController {
	
	@RequestMapping(value = "auctionMain", method = RequestMethod.GET)
	public String auctionMain() {
		
		return "auction/auctionMain";
	}
	
	@RequestMapping(value="auction", method = RequestMethod.GET)
	public String auction() {
		return "auction/auction";
	}
	
	
	@RequestMapping(value="auctionPeriod", method = RequestMethod.GET)
	public String auctionPeriod() {
		return "auction/auctionPeriod";
	}
	
	@RequestMapping(value="auctionFinish", method = RequestMethod.GET)
	public String auctionFinish() {
		return "auction/auctionFinish";
	}
	
	
}

