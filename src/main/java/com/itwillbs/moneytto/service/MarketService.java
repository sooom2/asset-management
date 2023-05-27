package com.itwillbs.moneytto.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.moneytto.mapper.MarketMapper;

@Service
public class MarketService {

	@Autowired
	private MarketMapper mapper;

	public int insertItem(HashMap<String, String> item) {
		
		return mapper.insertItem(item);
	}



    public void saveImage(HashMap<String, String> saveImage) {
        mapper.saveImage(saveImage);
    }


	public String selectItem() {
		return mapper.selectItem();
	}
	//05.27 id 추가했어요
	public List<HashMap<String, String>> getMarketItemList(String item_category, String item_status,
			String item_price_min, String item_price_max, String member_grade, String sort, String member_id) {
		return mapper.marketItemList(item_category, item_status, item_price_min, item_price_max, member_grade, sort, member_id);

	}


	public HashMap<String, String> getMarketItem(String item_code) {
		return mapper.marketItem(item_code);
	}


	
	
}
