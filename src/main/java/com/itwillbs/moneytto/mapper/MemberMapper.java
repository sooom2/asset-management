package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	
	int insertMember(HashMap<String, String> member);
	
	int renewPw(HashMap<String, String> member);
	
	int updateAuth(String member_id);
	
	int updateMember(HashMap<String, String> member);
	
	int insertWish(@Param("member_id") String member_id,@Param("wish_item_code") String wish_item_code);

	int deleteMember(HashMap<String, String> member);
	
	int deleteWish(@Param("member_id") String member_id,@Param("wish_item_code") String wish_item_code);
	
	HashMap<String, String> selectMember(String id);
	
	HashMap<String, String> checkId(String member_id);

	HashMap<String, String> findId(HashMap<String, String> member);
	
	HashMap<String, String> phoneCheck(HashMap<String, String> member);
	
	HashMap<String, String> selectKakao(String email);
	
	List<HashMap<String, String>> selectWishList(String id);
	
	List<HashMap<String, String>> selectSellItemList(String member_id);
	
	List<HashMap<String, String>> selectWishItemList(String member_id);
	
	List<HashMap<String, String>> selectBuyItemList(String member_id);

	List<HashMap<String, String>> selectWish(@Param("member_id") String member_id,@Param("wish_item_code") String wish_item_code);

	int updateQuitMember(HashMap<String, String> member);

	
	
}