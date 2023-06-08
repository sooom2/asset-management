package com.itwillbs.moneytto.service;

import java.util.HashMap;
import java.util.List;

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



    public int saveImage(HashMap<String, String> saveImage) {
       return mapper.saveImage(saveImage);
    }


	public String selectItem() {
		return mapper.selectItem();
	}
	//05.27 id 추가했어요
	public List<HashMap<String, String>> getMarketItemList(String item_category, String item_tag, String item_status,
			String item_price_min, String item_price_max, String member_grade, String sort, String member_id) {
		return mapper.marketItemList(item_category, item_tag, item_status, item_price_min, item_price_max, member_grade, sort, member_id);

	}


	public HashMap<String, String> getMarketItem(String item_code) {
		return mapper.marketItem(item_code);
	}

	public int updateItem(HashMap<String, String> item) {
		return mapper.updateItem(item);
	}

	public HashMap<String, String> getBuyItem(String id, String item_code) {

		return mapper.selectBuyItem(id, item_code);
	}

	public int writeReview(HashMap<String, String> review) {
		
		return mapper.insertReview(review);
	}

	public int modifyReview(HashMap<String, String> review) {
		
		return mapper.updateReview(review);
	}



	public List<HashMap<String, String>> getItemImage(String item_code) {
		return mapper.selectItemImage(item_code);
	}



	public int insertReport(String id, String targetId, String reportType, String reportContent) {
		return mapper.insertReport(id, targetId, reportType, reportContent);
	}



	public int removeImage(String itemCode) {
		return mapper.removeImage(itemCode);
	}



	public int deleteItem(HashMap<String, String> item) {
		return mapper.deleteItem(item);
	}



	public List<HashMap<String, String>> getNavMarketItemList(String navSearch, String sort, String id) {
		return mapper.navMarketItemList(navSearch, sort, id);
	}



		
	
	
}
