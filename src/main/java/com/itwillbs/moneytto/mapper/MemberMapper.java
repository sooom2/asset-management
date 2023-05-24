package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

public interface MemberMapper {
	// 찜목록 조회
	List<HashMap<String, String>> selectWishList(String id);
	
	int insertMember(HashMap<String, String> member);
	// 로그인 확인
	HashMap<String, String> selectMember(String id);
	
	int updateAuth(String member_id);
	// 전화번호 확인
	HashMap<String, String> phoneCheck(HashMap<String, String> member);
	
	int renewPw(HashMap<String, String> member);
	
	HashMap<String, String> selectKakao(String email);
	
	HashMap<String, String> checkId(String member_id);

	HashMap<String, String> findId(HashMap<String, String> member);
	
	List<HashMap<String, String>> selectSellItemList(String member_id);
	
	List<HashMap<String, String>> selectWishItemList(String member_id);
	
	List<HashMap<String, String>> selectBuyItemList(String member_id);
	
}