package com.itwillbs.moneytto.service;

import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.moneytto.generator.BankValueGenerator;
import com.itwillbs.moneytto.vo.AccountDepositListResponseVO;
import com.itwillbs.moneytto.vo.AccountDetailVO;
import com.itwillbs.moneytto.vo.AccountWithdrawResponseVO;
import com.itwillbs.moneytto.vo.ResponseTokenVO;
import com.itwillbs.moneytto.vo.ResponseUserInfoVO;

@Service
public class BankApiClient {
	// appdata.properties 의 값 자동 주입
	@Value("${baseUrl}")
	private String baseUrl;
	
	@Value("${client_id}")
	private String client_id;
	
	@Value("${client_secret}")
	private String client_secret;
	
	@Value("${client_bank_code}")
	private String client_bank_code;
	@Value("${client_account_num}")
	private String client_account_num;
	
	
//	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private BankValueGenerator valueGenerator;
	
	private static final Logger logger = LoggerFactory.getLogger(BankApiClient.class);
	
	// 토큰 요청
	public ResponseTokenVO requestToken(Map<String, String> authResponse) {
		// 토큰 요청에 사용될 API URL 설정
		String url = baseUrl + "/oauth/2.0/token";
		
		// HTTP 프로토콜로 전송되는 데이터의 헤더 정보 설정을 위해 
		// org.springframework.http.HttpHeaders 객체 생성 후
		// add() 메서드를 호출하여 헤더 정보 설정(add("헤더속성명", "헤더값") 형식)
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		// 요청에 필요한 파라미터 설정(POST 방식)
		// LinkedMultiValueMap<String, String> 타입 객체 활용
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		// 사용자 인증 과정에서 리턴받은 데이터가 Map 타입 객체(authResponse) 에 저장되어 있음 
		parameters.add("code", authResponse.get("code")); // 응답데이터 중 code 파라미터 사용
		parameters.add("client_id", client_id);
		parameters.add("client_secret", client_secret);
		parameters.add("redirect_uri", "http://localhost:8082/moneytto/memberAuth");
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

	// 사용자 정보 요청
	public ResponseUserInfoVO requestUserInfo(String access_token, String user_seq_no) {
		System.out.println("◇◇◇◇◇ requestUserInfo() : " + access_token + ", " + user_seq_no);
		
		// 사용자 정보 요청 API 의 URL - GET 방식 요청
		String url = baseUrl + "/v2.0/user/me";
		
		// 헤더 정보로 "Authorization" 속성값에 엑세스토큰값 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", "Bearer " + access_token);
		
		// 요청에 사용될 헤더 정보를 갖는 HttpEntity 객체 생성(바디는 생략 가능)
		// => 제네릭타입으로 String 타입 지정
		HttpEntity<String> httpEntity = new HttpEntity<String>(httpHeaders);
		
		// 요청에 필요한 파라미터 설정(GET 방식)
		// => 바디(Body) 영역 없이 URL 을 통해 파라미터 전송이 가능하므로
		//    UriComponents 객체를 통해 HTTP URL 형식으로 파라미터 전달
		// => UriComponentsBuilder 클래스의 fromHttpUrl() 메서드를 호출하여 객체 얻어오기
		//    Builder Pattern 을 활용하여 복수개의 메서드를 연결한 후 
		//    최종적으로 build() 메서드를 호출하면 UriComponents 객체 리턴됨
		//    => queryParam() 메서드를 통해 파라미터 설정(복수개 가능) 후 build() 메서드 호출
		UriComponents uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
													.queryParam("user_seq_no", user_seq_no)
													.build();
		
		// REST 방식 요청을 수행하기 위해 RestTemplate 객체의 exchange() 메서드 호출
		// 파라미터1) URI 정보(UriComponents 객체의 toString() 메서드 활용하여 문자열로 변환)
		// 파라미터2) 요청 방식(HttpMethod.XXX) - GET 방식
		// 파라미터3) HttpEntity 객체
		// 파라미터4) 응답 데이터를 저장할 VO 클래스 타입 - .class 형식으로 지정
		// 리턴타입 : ResponseEntity<ResponseUserInfoVO>
		
//		ParameterizedTypeReference<Map<String, String>> responseType = new ParameterizedTypeReference<Map<String, String>>() {};
		restTemplate = new RestTemplate();
		
		ResponseEntity<ResponseUserInfoVO> responseEntity = restTemplate.exchange(
															uriBuilder.toString(), HttpMethod.GET, httpEntity, ResponseUserInfoVO.class);
		
		System.out.println("=========================================");
		System.out.println("/v2.0/user/me 리턴값 : " + responseEntity.getBody());
		System.out.println("=========================================");
		
		return responseEntity.getBody();
	}

	// 계좌 상세정보(잔고) 조회 요청 - GET
	public AccountDetailVO requestAccountDetail(Map<String, String> map) {
//		System.out.println("거래코드 : " + valueGenerator.getBankTranId());
//		System.out.println("거래일시 : " + valueGenerator.getTranDTime());
		String bank_tran_id = valueGenerator.getBankTranId();
		String tran_dtime = valueGenerator.getTranDTime();
		
		// 잔액조회 API(핀테크 번호 사용) URL
		String url = baseUrl + "/v2.0/account/balance/fin_num";
		
		// 헤더 정보로 "Authorization" 속성값에 엑세스토큰값 설정
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", "Bearer " + map.get("access_token"));
		
		// 요청에 사용될 헤더 정보를 갖는 HttpEntity 객체 생성(바디는 생략 가능)
		// => 제네릭타입으로 String 타입 지정
		HttpEntity<String> httpEntity = new HttpEntity<String>(httpHeaders);
		
		// GET 방식 요청에 사용할 파라미터 데이터 생성(핀테크 번호로 조회하는 API 사용)
		UriComponents uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
				.queryParam("bank_tran_id", bank_tran_id)
				.queryParam("fintech_use_num", map.get("fintech_use_num"))
				.queryParam("tran_dtime", tran_dtime)
				.build();
		System.out.println("=========================================");
		System.out.println("잔액조회 요청 URI 정보 : " + uriBuilder.toString());
		System.out.println("=========================================");
		
		// REST API 요청을 위해 RestTemplate 객체의 exchange() 메서드 호출
		// 파라미터1) URI 정보(UriComponents 객체의 toString() 메서드 활용하여 문자열로 변환)
		// 파라미터2) 요청 방식(HttpMethod.XXX) - GET 방식
		// 파라미터3) HttpEntity 객체
		// 파라미터4) 응답 데이터를 저장할 VO 클래스 타입 - .class 형식으로 지정
		// 리턴타입 : ResponseEntity<AccountDetailVO>
		
		//VO 삒쳐서..
		
		restTemplate = new RestTemplate();
		ResponseEntity<AccountDetailVO> responseEntity = restTemplate.exchange(
																uriBuilder.toString(), 
																HttpMethod.GET, 
																httpEntity, 
																AccountDetailVO.class);
		
		System.out.println("=========================================");
		System.out.println("/v2.0/account/balance/fin_num 리턴값 : " + responseEntity.getBody());
		System.out.println("=========================================");
		
		return responseEntity.getBody();
	}
	
	// 출금 이체 요청 - POST(Content-type : application/json)
	public AccountWithdrawResponseVO withdraw(Map<String, String> map) {
		// 토큰 요청에 사용될 API URL 설정
		String url = baseUrl + "/v2.0/transfer/withdraw/fin_num";
		System.out.println("========================================");
		System.out.println("withdraw : " +  map);
		System.out.println("========================================");
		
		restTemplate = new RestTemplate();
	    HttpHeaders httpHeaders = new HttpHeaders();
	    httpHeaders.add("Authorization", "Bearer " + map.get("access_token"));
	    httpHeaders.setContentType(MediaType.APPLICATION_JSON);
	    
	      
	    JSONObject jo = new JSONObject();
	    jo.put("bank_tran_id", valueGenerator.getBankTranId());
	    jo.put("cntr_account_type", "N");	
	    jo.put("cntr_account_num", "333123456789"); // cntr_account_num(약정 계좌 = 쌤꺼 고정)
	    // 운영자 핀테크 번호 =====================================================
	    jo.put("dps_print_content", "머니또머니 충전");				// 출금계좌에 찍히는 내용 
	    jo.put("fintech_use_num", map.get("fintech_use_num"));				// 사용자 핀테크번호
	    jo.put("wd_print_content", "머니또 충전금");			// wd_print_content(출금계좌 인자내역, 내 통장에 표시할 내역) 
	    jo.put("tran_amt", map.get("tran_amt"));		    // 거래금액
	    jo.put("tran_dtime", valueGenerator.getTranDTime());				// 거래일자	
	    // 요청 고객
//	    jo.put("req_client_name", map.get("member_name"));							// 요청 고객명
	    jo.put("req_client_name", "홍길동");							// 요청 고객명 				
	    jo.put("req_client_fintech_use_num", map.get("fintech_use_num"));	// 
	    jo.put("req_client_num", map.get("id").toUpperCase());	// req_client_num(요청고객회원번호 = 아이디(문자 사용 시 대문자 필수!)			//
	    
	    jo.put("transfer_purpose", "TR");
	    
	    // 관리계정의 정보
	    jo.put("recv_client_name", "머니또"); // 입력받은 데이터
		jo.put("recv_client_bank_code",client_bank_code); // 입력받은 데이터
		jo.put("recv_client_account_num", client_account_num); // 입력받은 데이터
		
	    HttpEntity<String> request = 
	    	      new HttpEntity<String>(jo.toString(), httpHeaders);
	    	    
	    ResponseEntity<AccountWithdrawResponseVO> responseEntityStr = restTemplate.
	    	      postForEntity(url, request, AccountWithdrawResponseVO.class);
	    
	    System.out.println("=========================================");
	    System.out.println(jo);
	    System.out.println(responseEntityStr.getBody());
	    System.out.println("=========================================");
	    
	    return responseEntityStr.getBody();
	}
	
	// 입금 처리 요청 - POST(Content-type : application/json)
	public AccountDepositListResponseVO deposit(Map<String, String> map) {
		// 입금 이체 API(핀테크 번호 사용) URL
		String url = baseUrl + "/v2.0/transfer/deposit/fin_num";
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", "Bearer " + map.get("access_token"));
		httpHeaders.setContentType(MediaType.APPLICATION_JSON);
		
		// 1건의 입금 정보 갖는 JSONObject 객체 생성
		JSONObject req = new JSONObject();
		req.put("tran_no", 1); // 거래순번(단건이체이므로 1 고정)
		req.put("bank_tran_id", valueGenerator.getBankTranId()); // bank_tran_id(거래고유번호 - BankValueGenerator 클래스 활용)
		req.put("fintech_use_num", map.get("recv_client_fintech_use_num")); // fintech_use_num(입금계좌 핀테크 이용번호)
		req.put("print_content", "머니또거래"); // dps_print_content(입금계좌 인자내역, 상대방 통장에 표시할 내역)
		req.put("tran_amt", map.get("tran_amt")); // 입금금액
		req.put("req_client_name", "홍길동"); // req_client_name(요청고객성명)
		req.put("req_client_fintech_use_num", map.get("fintech_use_num")); // req_client_fintech_use_num(요청고객 핀테크 이용번호)
		req.put("req_client_num", "ADMIN"); // req_client_num(요청고객회원번호 = 아이디(문자 사용 시 대문자 필수!)
		req.put("transfer_purpose", "TR"); // transfer_purpose(이체용도 - 송금을 의미하는 "TR" 전달)
		// => 이 정보를 리스트 형태로 담기 위해 JSONArray 객체 활용
		JSONArray req_list = new JSONArray();
		req_list.put(req);
		// --------------------------------------------------------------------
		// JSONObject 객체를 활용하여 요청 파라미터를 JSON 객체 형식으로 생성
		JSONObject jo = new JSONObject();
		jo.put("cntr_account_num", "333123456789"); // cntr_account_num(약정 계좌)
		jo.put("cntr_account_type", "N"); // cntr_account_type(계좌형태 - 계좌를 의미하는 "N" 전달)
		
		jo.put("wd_pass_phrase", "NONE"); // 입금이체용 암호문구(테스트 계좌는 "NONE" 값 설정)
		jo.put("wd_print_content", "용돈"); // wd_print_content(출금계좌 인자내역, 내 통장에 표시할 내역)
		jo.put("name_check_option", "on"); // 수취인 성명 검증 여부
		jo.put("tran_dtime", valueGenerator.getTranDTime()); // tran_dtime(요청일시 - BankValueGenerator 클래스 활용)
		jo.put("req_cnt", 1); // 입금요청건수(1 고정 => 다건 이체 불가능)
		jo.put("req_list", req_list); // 입금요청 리스트 전달
		
		HttpEntity<String> httpEntity = new HttpEntity<String>(jo.toString(), httpHeaders);
		
		restTemplate = new RestTemplate();
		ResponseEntity<AccountDepositListResponseVO> responseEntity = 
				restTemplate.postForEntity(url, httpEntity, AccountDepositListResponseVO.class);
		
		System.out.println(responseEntity.getBody());
		
		return responseEntity.getBody();
	}
	

}
