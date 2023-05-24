<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path }/resources/css/market.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
  <body>
  <jsp:include page="../nav.jsp" />
        <div id="__next">
            <div class="layout__Header-sc-1fg0dfe-0 iSTjqT">
                <div class="header__Wrapper-hucg1a-0 dncKiK">
                    <div class="header__Gnb-hucg1a-1 fixMZO">
                    </div>
                </div>
            </div>
            <div class="layout__Children-sc-1fg0dfe-2 jjXXzz"></div>
    	    <div class="newSearchWrapper">
    	    <!-- 카테고리 -->
            <div class="webWrapper">
	           	 <div class="barWrapper">
<!-- 	           	 	<div class="FilterBoxWrapper-active"> -->
<!-- 	           	 		<div class="FilterBoxTopic"> -->
<!-- 		           	 		<div class="FilterBoxName">#내지역이름</div> -->
<!-- 		           	 		<div class="FilterBoxCount">#</div> -->
<!-- 	           	 		</div> -->
<!--            	 		<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow"> -->
<!-- 	          	 	</div> -->
	          	 	<div class="FilterBoxWrapper">
	           	 		<div class="FilterBoxTopic">
	           	 			<div class="FilterBoxName">#카테고리</div>
	           	 			<div class="FilterBoxCount">#</div>
	           	 		</div>
	           	 		<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
	          	 	</div>
	          	 	<div class="FilterBoxWrapper">
	           	 		<div class="FilterBoxTopic">
	           	 			<div class="FilterBoxName">#가격</div>
	           	 			<div class="FilterBoxCount">#</div>
	           	 		</div>
           	 		<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
	          	 	</div>
	          	 	<div class="FilterBoxWrapper">
	           	 		<div class="FilterBoxTopic">
	           	 			<div class="FilterBoxName">#등급</div>
	           	 			<div class="FilterBoxCount">#</div>
	           	 		</div>
           	 		<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
	          	 	</div>
	          	 	
		               <div class="searchIconWrapper marketListSearch">
						<img src="${path }/resources/images/main/ico_search.png" alt="돋보기 아이콘" class="searchIcon">
						<div class="searchSearch"><form><input class="goodsName tag" type="text" placeholder="찾으시는 상품을 태그로 검색해보세요!"></form></div>
					</div>
               </div>
	         </div>
	         <!-- 카테고리 end -->
			<div id="__next">
				<div class="layout__Header-sc-1fg0dfe-0 iSTjqT"></div>
				<div class="layout__Children-sc-1fg0dfe-2 jjXXzz"></div>
				<div class="newSearch__Wrapper-sc-1v1g3nr-0 dVIBtK">
					<div class="web__Wrapper-sc-5x22ci-0 jDBdAO">
						<div class="toggle__Wrapper-skglus-0 dEBCMS">
							<div class="category__Wrapper-sc-187sq7k-0 emQQCU">
								<div class="category__CategoryBox-sc-187sq7k-1 kGtMUL">
<!-- 									<div class="Top__Wrapper-oe65rr-0 iueNqr"> -->
<!-- 										<div class="Top__Title-oe65rr-1 gXlyjT">전체 카테고리</div> -->
<!-- 										<div class="Top__CategoryBox-oe65rr-3 eYZfEN"> -->
<!-- 											<div class="Top__MainCategory-oe65rr-4 bpPgNC"> -->
<!-- 												<img -->
<!-- 													src="https://ccimage.hellomarket.com/img/web/search/filter/mweb/arrow_right.svg" -->
<!-- 													alt="우측 화살표" class="Top__ArrowRIght-oe65rr-5 hEjnBN">가방 -->
<!-- 											</div> -->
<!-- 											<div class="Top__Count-oe65rr-6 dvVQGP">(38,390)</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									<div class="List__Wrapper-rd56hw-0 cmyJpu">
										<div class="List__MainCategoryName-rd56hw-2 eDPfil">전체 (38,390)</div>
										<div class="List__Name-rd56hw-3 eklQsX">패션/의류/잡화/뷰티 (140)</div>
										<div class="List__Name-rd56hw-3 eklQsX">가전제품/모바일/PC (5,444)</div>
										<div class="List__Name-rd56hw-3 eklQsX">가구/인테리어 (192)</div>
										<div class="List__Name-rd56hw-3 eklQsX">도서/음반/문구/티켓 (192)</div>
										<div class="List__Name-rd56hw-3 eklQsX">게임/스포츠/취미 (192)</div>
										<div class="List__Name-rd56hw-3 eklQsX">유아동/반려동물 (192)</div>
										<div class="List__Name-rd56hw-3 eklQsX">기타 (192)</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>





			<div id="hello" class="tagListWrapper">
				<div class="tagListFilterBox">
					<div class="tagListReset">
						<div class="tagListResetText">필터초기화</div>
						<img
							src="https://ccimage.hellomarket.com/img/web/search/filter/refresh.svg"
							alt="reset" class="tagListResetImg">
					</div>
<!-- 					<div class="tagListTag"> -->
<!-- 						<div class="tagListName">남성 의류 전체</div> -->
<!-- 						<img -->
<!-- 							src="https://ccimage.hellomarket.com/img/web/search/filter/mweb/ico_close_tag.png" -->
<!-- 							alt="remove" class="tagListRemove"> -->
<!-- 					</div> -->
				</div>
			</div>
			<div class="searchedListWrapper">
                    <div class="searchedListTopWrapper">
                        <div class="CountListCount"> 상품 
                        	<span class="Count">281,414</span>개의 상품이 있습니다.                    
                        </div>
                        <!--  -->
                        <div class="SortListWrapper" onclick="">
                        	<div class="SortListList">최근 등록순</div>
                        	<div class="SortListList">낮은 가격순</div>
                        	<div class="SortListList">높은 가격순</div>
                        	<div class="SortListList">높은 등급순</div>
                       	</div>
                       	<!--  -->
                        <div class="sortSortBox">
                            <div class="sortSort">최근 등록순</div>
                            <!-- 정렬버튼 이미지 -->
                            <img src="https://ccimage.hellomarket.com/img/web/search/itemList/ico_sort.png" alt="정렬 아이콘" class="sortSortImg"/>
                        </div>
                    </div>
                    <div>
	                    <div class="infinite-scroll-component " style="height:auto;overflow:auto;-webkit-overflow-scrolling:touch">
							<div class="itemListWrapper">
								<div class="itemWrapper">
									<div class="itemThumbnailBox">
										<img src="${path }/resources/images/main/noThumbnail.jpg" alt="썸네일" class="itemThumbnail">
											<div class="wishWrapper" onclick="itemWish(this)">
												<img src="${path }/resources/images/main/ico_heart_off_x3.png" alt="좋아요 아이콘" class="wishWishIcon">
											</div>
									</div>
<script type="text/javascript">
function itemWish(wish){
// 	$.ajax({
// 		type: "POST",
// 		url : "clickWish",
// 		data : "wish",
// 		success:function(responseData){
// 			retVal = responseData;
// 		},
// 		error:function(jqXHR, textStatus, err){
// 			throw new KobisOpenAPIError(jqXHR.responseText);
// 		},
// 		dataType: isJson?"json":"xml",
// 		async : false
// 	});
		
		$(wish).find('img').toggleClass("wish").attr("src", "${path }/resources/images/main/Ico_wish_on.png");	
	
	
}

</script>

									<!-- 삭제 -->
									<div class="itemTextBox" onclick="location.href='market_detail'">
									<div class="itemCategory">여기는카테고리</div>
									<div class="itemText">플라워에코백(새상품) 이름이 길어진다면</div>
									<div class="itemText">20,000원</div>
									<div class="itemTagBox">
										<div class="itemSizeTag">태그목록</div>
										<div class="itemSizeTag">ㅇㅅㅇ</div>
										<div class="itemSizeTag">태그는</div>
										<div class="itemSizeTag">5개까지</div>
										<div class="itemSizeTag">쓸 수 있어용</div>
									</div>
									<div class="itemTimeTag">방금 전</div>
									</div>
									<!-- 삭제 -->			
<!-- 									<div class="itemTextBox" onclick="location.href='market_detail'"> -->
<!-- 									물건이름, 지역, 가격, 시간 -->
<!-- 										<div class="itemBrand">#물건이름#</div> -->
<!-- 										<div class="itemPrice">#가격#</div> -->
<!-- 										<div class="itemSizeTag">#판매지역#</div> -->
<!-- 										<div class="itemTimeTag">방금 전</div> -->
<!-- 									</div> -->
								</div>
							</div>
						</div>
					</div>
                  </div>
              </div>
          </div>
<jsp:include page="../footer.jsp" />
</body>
</html>
