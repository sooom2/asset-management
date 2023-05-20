package com.itwillbs.moneytto.service;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.moneytto.mapper.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	// 좌표 가져오기
	public HashMap<String, String> setCoord(String member_address) {
		
		HashMap<String, String> coord = new HashMap<String, String>();
		
		URI uri = UriComponentsBuilder.fromUriString("https://dapi.kakao.com/v2/local/search/address.json")
			 	.queryParam("query",member_address).encode().build().toUri();
	
	    // Spring 요청 제공 클래스 
	    RequestEntity<Void> req = RequestEntity
			        .get(uri)
			        .header("Host", "dapi.kakao.com")
			        .header("Authorization", "KakaoAK 4604b4522a19d2b6152b5213355cdb86")
			        .build();
	    
	    ResponseEntity<String> resp = new RestTemplate().exchange(req, String.class);
	    
	    JSONArray jsonArray;
		try {
			jsonArray = new JSONObject(resp.getBody()).getJSONArray("documents");
			
			coord.put("member_X", jsonArray.getJSONObject(0).getString("x"));
		    coord.put("member_Y", jsonArray.getJSONObject(0).getString("y"));
		} catch (JSONException e) {
			System.out.println("MemberService - setCoord null");
			e.printStackTrace();
		}
	    
	    return coord;
	}
	
	// 유저 확인
	public HashMap<String, String> checkUser(HashMap<String, String> login) {
		
		return login; //  DB생겻을때 바꿀것
		//return mapper.chekUser(login);
		
	}
	// 	아이디 조회
	public HashMap<String, String> findId(HashMap<String, String> member) {
		
		return member;
		//return mapper.findId(member);
	}
	/*회원 목록 조회*/
//	public List<HashMap<String, String>> selectMember() {
//		return mapper.selectMember();
//	}
	
	/*회원추가수정*/
	
	public int registMember(HashMap<String, String> member) {
		return mapper.insertMember(member);
	}
	/*
	// 카카오 회원 확인
	public HashMap<String, String> kakaoMember(String email) {
		return mapper.selectKakao(email);
	}
	
	// 아이디 조회
	public HashMap<String, String> findId(HashMap<String, String> member) {
		return mapper.findId(member);
	}
	*/
	// 비밀번호 재설정
	public int renewPw(HashMap<String, String> member) {
		return 0;// Quest
//		return mapper.renewPw(member);
	}
	/*
	public int insertPoint(String id) {
		return mapper.insertPoint(id);
	}
	
	// SMS 인증
	public void certifiedPhoneNumber(String phone, int randomNumber) {
		String api_key = "NCSQU2TAT8POKQ76";
	    String api_secret = "N5KAV8MZDEGWQZYSQGJI27HQIQLB06VH";
	    Message coolsms = new Message(api_key, api_secret);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01076110230");    // 발신전화번호
	    params.put("type", "SMS");
	    params.put("text", "[아이무비] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); 

	    try {
	        JSONObject obj = (JSONObject)coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
		
	}
	*/
	// 아이디 검증.
	public HashMap<String, String> checkId(String id) {
		
		return new HashMap<String, String>();
//		return mapper.checkId(id);
	}
	// 비밀번호 찾기 회원 인증.
		public HashMap<String, String> phoneCheck(HashMap<String, String> member) {
			return member;// Quest
//			return mapper.phoneCheck(member);
	}
	/*
	
	
	/*
	
	/*
	//회원 이름검색
	public int getMemberListCount(String searchKeyword) {
		return mapper.selectMemberListCount(searchKeyword);
	}

	//회원수
	public int selectMemCount() {
		return mapper.memberCount();
	}
	*/
	public List<HashMap<String, String>> getWishList(String id) {
		// TODO return
		//return mapper.selectMember(id);
//		return null;
		List<HashMap<String, String>> wishList = new ArrayList<HashMap<String,String>>();
		return wishList;
	}
}
