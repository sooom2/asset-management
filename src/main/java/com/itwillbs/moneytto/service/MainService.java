package com.itwillbs.moneytto.service;

import java.net.URI;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.moneytto.mapper.MarketMapper;

@Service
public class MainService {
	
	@Autowired
	private MarketMapper mapper;
	
	public List getNewsInfo() {
		// 안쓰는데 API 쓸때 참고용으로 남겨둠
		 URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com/")
			        .path("v1/search/news.json")
			        .queryParam("query", "아이돌")
			        .queryParam("display", 3)
			        .queryParam("start", 1)
			        .queryParam("sort", "date")
			        .encode()
			        .build()
			        .toUri();
		
	    // Spring 요청 제공 클래스 
	    RequestEntity<Void> req = RequestEntity
			        .get(uri)
			        .header("X-Naver-Client-Id", "f4nF_CeLyNXs_TRxBibp")
			        .header("X-Naver-Client-Secret", "dFhGNP9ucZ")
			        .build();
	    // Spring 제공 restTemplate
	    ResponseEntity<String> resp = new RestTemplate().exchange(req, String.class);
	    JSONArray jsonArray = new JSONObject(resp.getBody()).getJSONArray("items");
	    // 사용되는 객체 : title, link, description, pubDate
	    
		return jsonArray.toList();
	}

	public List<HashMap<String, String>> getMainItemList(String id) {
		
		return mapper.selectItemList(id);
	}

	public List<HashMap<String, String>> getRecentItemList(String id) {

		return mapper.selectRecentItemList(id);
	}
	
}
