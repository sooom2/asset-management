<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path }/resources/css/trade.css" rel="stylesheet">
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
	           	 	<div class="FilterBoxWrapper-active">
	           	 		<div class="FilterBoxTopic">
		           	 		<div class="FilterBoxName">#내지역이름</div>
		           	 		<div class="FilterBoxCount">#</div>
	           	 		</div>
           	 		<img src="https://ccimage.hellomarket.com/img/web/search/filter/blue_arrow.svg" alt="화살표 아래 아이콘" class="FilterBoxArrow">
	          	 	</div>
	          	 	<div class="FilterBoxWrapper">
	           	 		<div class="FilterBoxTopic">
	           	 			<div class="FilterBoxName">#카테고리</div>
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
	          	 	
               </div>
               
               <div class="toggleWrapper">
<!-- 	               <div id="hello" class="tagListWrapper"> -->
<!-- 	                	<div class="tagListFilterBox"> -->
<!-- 	                		<div class="tagListReset"> -->
<!-- 	                			<div class="tagListResetText">필터초기화</div> -->
<!-- 	                			<img src="https://ccimage.hellomarket.com/img/web/search/filter/refresh.svg" alt="reset" class="tagListResetImg"> -->
<!-- 	               			</div> -->
<!-- 		            		<div class="tagListTag"> -->
<!-- 		           				<div class="tagListName">남성 의류 전체 </div> -->
<!-- 		           				<img src="https://ccimage.hellomarket.com/img/web/search/filter/mweb/ico_close_tag.png" alt="remove" class="tagListRemove"> -->
<!-- 		          			</div> -->
<!-- 		         		</div> -->
<!-- 	        		</div> -->
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
                        	<div class="SortListList">찜 많은 순</div>
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
											<div class="wishWrapper">
												<img src="${path }/resources/images/main/ico_heart_off_x3.png" alt="좋아요 아이콘" class="wishWishIcon">
											</div>
									</div>
									<!-- 삭제 -->
									<div class="itemTextBox" onclick="location.href='trade_detail'">
									<div class="itemBrand">와이드앵글</div>
									<div class="itemText">20,000원</div>
									<div class="itemText">[64]와이드앵글 골프치마 골프스커트</div>
									<div class="itemTagBox">
										<div class="itemSizeTag">S</div>
									</div>
									<div class="itemTimeTag">방금 전</div>
									</div>
									<!-- 삭제 -->			
									<div class="itemTextBox" onclick="location.href='trade_detail'">
									<!-- 물건이름, 지역, 가격, 시간 -->
										<div class="itemBrand">#물건이름#</div>
										<div class="itemPrice">#가격#</div>
										<div class="itemSizeTag">#판매지역#</div>
										<div class="itemTimeTag">방금 전</div>
									</div>
								</div>
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
