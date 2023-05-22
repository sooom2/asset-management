package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

public interface MemberMapper {
	// 찜목록 조회
	//List<HashMap<String, String>> selectWishList(String id);
	
	int insertMember(HashMap<String, String> member);
	// 로그인 확인
	HashMap<String, String> selectMember(String id);
	
}
