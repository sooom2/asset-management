package com.itwillbs.moneytto.controller;

import java.net.URI;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
public class MainController {
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model) {
		// ============ newsAPI==================
		 URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com/")
			        .path("v1/search/news.json")
			        .queryParam("query", "경제")
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
	    model.addAttribute("newsList", jsonArray.toList());
		// ============ newsAPI==================
		
		return "main";
	}
	
}
