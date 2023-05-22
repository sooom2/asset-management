package com.itwillbs.moneytto.mapper;

import java.util.HashMap;

public interface MarketMapper {

	int insertItem(HashMap<String, String> item);

	//item 조회
	HashMap<String, String> getItem(String item_code);

}
