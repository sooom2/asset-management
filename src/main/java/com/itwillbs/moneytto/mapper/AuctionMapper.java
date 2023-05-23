package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

public interface AuctionMapper {

	List<HashMap<String, String>> selectAuction();

	HashMap<String, String> selectAuctionCode(String auction_code);

}
