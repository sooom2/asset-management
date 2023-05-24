<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path }/resources/css/market.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
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
	          	 	<div class="FilterBoxWrapper FilterCategory">
	           	 		<div class="FilterBoxTopic" >
	           	 			<div class="FilterBoxName">#카테고리</div>
	           	 			<div class="FilterBoxCount">#</div>
	           	 		</div>
	           	 		<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
	          	 	</div>
	          	 	<div class="FilterBoxWrapper FilterPrice">
	           	 		<div class="FilterBoxTopic">
	           	 			<div class="FilterBoxName">#가격</div>
	           	 			<div class="FilterBoxCount">#</div>
	           	 		</div>
           	 		<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
	          	 	</div>
					<!-- 등급 -->
			        <label for="grade" style="cursor: pointer;"><input type="checkbox" value="checked" id="grade"/>새싹등급 이상 판매자</label>
			          	 
			        <!-- 거래완료 제외하고 보기 -->
			        <label for="complete" style="cursor: pointer;"><input type="checkbox" value="checked" id="complete"/>거래완료물품제외</label>
			        
			        	
		               <div class="searchIconWrapper marketListSearch">
						<img src="${path }/resources/images/main/ico_search.png" alt="돋보기 아이콘" class="searchIcon">
						<div class="searchSearch"><form><input class="goodsName tag" type="text" placeholder="태그검색"></form></div>
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
							<!-- 카테고리상세 -->
							<div class="categoryDetail" style="display: none;">
								<div class="category__CategoryBox-sc-187sq7k-1 kGtMUL">
									<div class="List__Wrapper-rd56hw-0 cmyJpu">
										<div class="ListNonSelected" id="all" title="전체">전체 (38,390)</div>
										<div class="ListNonSelected" id="fashion" title="패션/의류/잡화/뷰티">패션/의류/잡화/뷰티 (140)</div>
										<div class="ListNonSelected" id="pc" title="가전제품/모바일/PC">가전제품/모바일/PC (5,444)</div>
										<div class="ListNonSelected" id="interior" title="가구/인테리어">가구/인테리어 (192)</div>
										<div class="ListNonSelected" id="book" title="도서/음반/문구/티켓">도서/음반/문구/티켓 (192)</div>
										<div class="ListNonSelected" id="game" title="게임/스포츠/취미">게임/스포츠/취미 (192)</div>
										<div class="ListNonSelected" id="child" title="유아동/반려동물">유아동/반려동물 (192)</div>
										<div class="ListNonSelected" id="etc" title="기타">기타 (192)</div>
									</div>
								</div>
							</div>
							<!-- 카테고리상세 end -->
							
							<!-- 가격상세 -->
							<div class="priceDetail fEjcIX" style="display: none;">
								<input type="text" placeholder="최저금액"
									class="price__MinPrice-sc-1yxjw4n-2 cRHAEh" value="">
								<div class="price__StartPointText-sc-1yxjw4n-1 cOhRDO">원
									부터~</div>
								<input type="text" placeholder="최고금액"
									class="price__MaxPrice-sc-1yxjw4n-3 dfgaGw" value="">
								<div class="price__EndPointText-sc-1yxjw4n-4 ecxgoB">원 까지</div>
								<button class="price__ApplyBtn-sc-1yxjw4n-5 ezrKUu">적용하기</button>
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
					<div class="tagListTag">
						<div class="tagListName">파란글씨는</div>
						<img
							src="https://ccimage.hellomarket.com/img/web/search/filter/mweb/ico_close_tag.png"
							alt="remove" class="tagListRemove">
					</div>
					<div class="tagListTag">
						<div class="tagListName">.tagListName</div>
						<img
							src="https://ccimage.hellomarket.com/img/web/search/filter/mweb/ico_close_tag.png"
							alt="remove" class="tagListRemove">
					</div>
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
                    	<!-- 목록 -->
	                    <div class="infinite-scroll-component " style="height:auto;overflow:auto;-webkit-overflow-scrolling:touch">
							<div class="itemListWrapper">
								<div class="itemWrapper">
									<c:forEach  var="item" items="${marketItemList }">
									<div class="itemThumbnailBox">
										<img src="${path }/resources/images/main/noThumbnail.jpg" alt="썸네일" class="itemThumbnail" onclick="location.href='market_detail'">
											<div class="wishWrapper">
												<img src="${path }/resources/images/main/ico_heart_off_x3.png" alt="좋아요 아이콘" class="wishWishIcon">
											</div>
									</div>
									<!-- 삭제 -->
									<div class="itemTextBox">
									<div class="itemCategory">${item.item_category }</div>
									<div class="itemText" onclick="location.href='market_detail'">${item.item_subject }</div>
									<div class="itemText">${item.item_price }원</div>
									<div class="itemTagBox">
									<c:forTokens items="${item.item_tag }" delims="," var="itemTag">
										<div class="itemSizeTag">${itemTag}</div>
									</c:forTokens>
									</div>
									<div class="itemTimeTag">item 테이블 date type 시간으로 바꿔야함</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
						
						<!-- 목록 end -->
					</div>
                  </div>
              </div>
          </div>
          
	<script type="text/javascript">
		function category(categoryId) {
			switch(categoryId) {
				case "all": console.log(categoryId); break;
				case "fashion": console.log(categoryId); break;
				case "pc": console.log(categoryId); break;
				case "interior": console.log(categoryId); break;
				case "book": console.log(categoryId); break;
				case "game": console.log(categoryId); break;
				case "child": console.log(categoryId); break;
				case "etc": console.log(categoryId); break;
				default: console.log("엥");
			}
		}
		$(function () {
			$(".FilterCategory").on("click", function(e) {
				$(".priceDetail").hide();
				$(".categoryDetail").show();
			});
			$(".FilterPrice").on("click", function(e) {
				$(".categoryDetail").hide();
				$(".priceDetail").show();
			});
			
			
			// 카테고리 선택
			$(".ListNonSelected").on("click", function(e) {
				$(".ListSelected").attr("class", "ListNonSelected");
				$(this).attr("class", "ListSelected");
				
				var categoryId = $(this).attr("id");
				category(categoryId);
				
				// 필터에 추가
				var title = $(this).attr("title");
				var tagStr = '';
				tagStr += '<div class="tagListTag">';
				tagStr += '<div class="tagListName">';
				tagStr += title;
				tagStr += '</div>';
				tagStr += '<img src="https://ccimage.hellomarket.com/img/web/search/filter/mweb/ico_close_tag.png" alt="remove" class="tagListRemove"></div>';
				$(".tagListFilterBox").append(tagStr);
				
				
				
			});
			
			// 필터 remove
			$(document).on("click", ".tagListRemove", function(e) {
				$(this).parent().remove();
			});
			
			
		});
	
	</script>
<jsp:include page="../footer.jsp" />
</body>
</html>
