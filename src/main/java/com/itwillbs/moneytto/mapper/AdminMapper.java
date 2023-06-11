package com.itwillbs.moneytto.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminMapper {

	int registAuction(Map<String, String> auction);

	int registImage(Map<String, String> images);

	// 2. 관리자 카테고리별 차트
	List<HashMap<String, String>> selectCategoryChart(HashMap<String, String> map);

	// 3. 관리자 직거래, 안전거래 비교 차트
	List<HashMap<String, String>> selectPayTypeChart(HashMap<String, String> map);


}
