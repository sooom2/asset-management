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

	int updateDeposit(@Param("auction_code") String auction_code, @Param("success_id") String success_id, @Param("deposit") int deposit);

	int updatePoint(@Param("id")String id, @Param("point") String point);

	HashMap<String, String> selectMemberGradeByMember(HashMap<String, String> member);

	String selectImage(String name);
	// 작성한 리뷰
	List<HashMap<String, String>> selectWrittenReviewListByMember(HashMap<String, String> member);

	List<HashMap<String, String>> selectWrittenReviewListById(String id);

	List<HashMap<String, String>> selectRecivedReviewListByMember(HashMap<String, String> member);
	
	List<HashMap<String, String>> selectRecivedReviewListById(String id);
	
	HashMap<String, String> selectReview(@Param("id")String id, @Param("item_code")String item_code);
	
// 관리자===============================================================
	// 회원목록
	List<HashMap<String, String>> selectAdminMember(HashMap<String, String> map);

	int updateMemberPoint(@Param("id")String id, @Param("pay_price") int pay_price);

	List<HashMap<String, String>> chat(String id);
	List<HashMap<String, String>> report(String id);
	List<HashMap<String, String>> point(String id);
	List<HashMap<String, String>> auction(String id);

	List<HashMap<String, String>> grade();

	
	
	

	



	
	
}