package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface AuctionMapper {

	List<HashMap<String, String>> selectAuction();

	HashMap<String, String> selectAuctionCode(String auction_code);

	int insertEnroll(@Param("auction_code") String auction_code,@Param("id") String id);

	HashMap<String, String> selectAuctionEnroll(@Param("auction_code") String auction_code,@Param("id") String id);

}
