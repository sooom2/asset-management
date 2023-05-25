package com.itwillbs.moneytto.service;

import java.util.HashMap;

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


	
	
}
