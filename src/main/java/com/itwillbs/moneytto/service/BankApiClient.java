package com.itwillbs.moneytto.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.itwillbs.moneytto.vo.ResponseTokenVO;

@Service
public class BankApiClient {
	// appdata.properties 의 값 자동 주입
	@Value("${baseUrl}")
	private String baseUrl;
	
	@Value("${client_id}")
	private String client_id;
	
	@Value("${client_secret}")
	private String client_secret;
	
//	@Autowired
	private RestTemplate restTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(BankApiClient.class);
	
	// 토큰 요청
	public ResponseTokenVO requestToken(Map<String, String> authResponse) {
		// HTTP 프로토콜로 전송되는 데이터의 헤더 정보 설정을 위해 
		// org.springframework.http.HttpHeaders 객체 생성 후
		// add() 메서드를 호출하여 헤더 정보 설정(add("헤더속성명", "헤더값") 형식)
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		// 토큰 요청에 사용될 API URL 설정
		String url = baseUrl + "/oauth/2.0/token";
		
		// 요청에 필요한 파라미터 설정
		// LinkedMultiValueMap<String, String> 타입 객체 활용
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		// 사용자 인증 과정에서 리턴받은 데이터가 Map 타입 객체(authResponse) 에 저장되어 있음 
		parameters.add("code", authResponse.get("code")); // 응답데이터 중 code 파라미터 사용
		parameters.add("client_id", client_id);
		parameters.add("client_secret", client_secret);
		parameters.add("redirect_uri", "http://localhost:8082/fintech/callback");
		parameters.add("grant_type", "authorization_code");
		logger.info("◇◇◇◇◇ parameters : " + parameters.toString());
		
		// 요청에 사용될 파라미터와 헤더 정보를 갖는 HttpEntity 객체 생성
		// => 제네릭타입으로 요청 파라미터 타입 지정
		HttpEntity<MultiValueMap<String, String>> httpEntity = 
				new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		// REST 방식 요청을 수행하기 위해 RestTemplate 객체의 exchange() 메서드 호출
		// exchange(요청URL, 요청메서드(HttpMethod.XXX), HttpEntity 객체, 응답데이터저장클래스타입)
		// => 리턴타입의 제네릭타입은 ResponseTokenVO 클래스 타입 지정(.class 필수)
		restTemplate = new RestTemplate();
		ResponseEntity<ResponseTokenVO> responseEntity = 
				restTemplate.exchange(url, HttpMethod.POST, httpEntity, ResponseTokenVO.class);
		
		// 응답받은 ResponseEntity 객체의 getBody() 메서드를 호출하면
		// 제네릭타입으로 지정한 객체에 응답 데이터가 저장되어 리턴됨
		logger.info("◇◇◇◇◇ responseEntity.getBody() : " + responseEntity.getBody());
		
		// 응답 데이터 리턴(ResponseTokenVO 타입)
		return responseEntity.getBody();
	}
	
	

}














