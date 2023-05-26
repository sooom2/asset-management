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
  <input type="hidden" id="item_category" name="item_category" value="">
  <input type="hidden" id="item_status" name="item_status" value="판매중">
  <input type="hidden" id="item_price_min" name="item_price_min" value="0">
  <input type="hidden" id="item_price_max" name="item_price_max" value="999999999999999">
  <input type="hidden" id="member_grade" name="member_grade" value="">
  <input type="hidden" id="sort" name="sort" value="default">
  <input type="hidden" id="item_code" name="item_code" value="">
  
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
			        <label for="complete" style="cursor: pointer;"><input type="checkbox" value="checked" id="complete" checked="checked"/>거래완료물품제외</label>
			        
			        	
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
									class="item_price_min cRHAEh" value="">
								<div class="price__StartPointText-sc-1yxjw4n-1 cOhRDO">원
									부터~</div>
								<input type="text" placeholder="최고금액"
									class="item_price_max dfgaGw" value="">
								<div class="price__EndPointText-sc-1yxjw4n-4 ecxgoB">원 까지</div>
								<button class="priceApplyBtn ezrKUu">적용하기</button>
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
				</div>
			</div>
			<div class="searchedListWrapper">
                    <div class="searchedListTopWrapper">
                        <div class="CountListCount"> 상품 
                        	<span class="Count">281,414</span>개의 상품이 있습니다.                    
                        </div>
                        <!--  -->
                        <div class="SortListWrapper">
                        	<div class="SortListList" id="default" title="최근 등록순">최근 등록순</div>
                        	<div class="SortListList" id="lowPrice" title="낮은 가격순">낮은 가격순</div>
                        	<div class="SortListList" id="highPrice" title="높은 가격순">높은 가격순</div>
                        	<div class="SortListList" id="highGrade" title="높은 등급순">높은 등급순</div>
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
	                    <div class="infinite-scroll-component " style="height:auto;">
							<div class="itemListWrapper">
								<div class="itemWrapper">
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
			//기존값에 카테고리 추가
			var category = $("#item_category").val();
			var str = '';
			switch(categoryId) {
				case "fashion": str += "패션/의류/잡화/뷰티"; break;
				case "pc": str += "가전제품/모바일/PC"; break;
				case "interior": str += "가구/인테리어"; break;
				case "book": str += "도서/음반/문구/티켓"; break;
				case "game": str += "게임/스포츠/취미"; break;
				case "child": str += "유아동/반려동물"; break;
				case "etc": str += "기타"; break;
				case "all": 
			}
			
			// all이면 null 넘김
			if(categoryId == "all") {
				$("#item_category").val("");
			} else {
				if(category != ""){
					category += "/";
				}
				category += str;
				$("#item_category").val(category);
			}
			marketItemList();
		}
		
		// 상품 리스트 불러오기
		function marketItemList() {
			$(".itemThumbnailBox").remove();

			var item_category = $("#item_category").val();
			var item_status = $("#item_status").val();
			var item_price_min = $("#item_price_min").val();
			var item_price_max = $("#item_price_max").val();
			var member_grade = $("#member_grade").val();
			var sort = $("#sort").val();
			
			console.log("---var---")
			console.log(item_category);
			console.log(item_status);
			console.log(item_price_min);
			console.log(item_price_max);
			console.log(member_grade);
			console.log(sort);
			
			$.ajax({													
	 			type: "GET",
	 			url: "marketItemList",
	 			data: { 
	 				item_category : item_category,
	 				item_status : item_status,
	 				item_price_min : item_price_min,
	 				item_price_max : item_price_max,
	 				member_grade : member_grade,
	 				sort : sort
	 			},
	 			dataType: "json",
	 			success: function(response) { 
	 				console.log("marketItemList : 요청처리성공");
	 				for(let item of response) {
						let category = item.item_category;
						let subject = item.item_subject;
						let price = item.item_price;
						let tags = item.item_tag;
						let tag = tags.split(',');
						let date = item.item_date;
						let code = item.item_code;
						let image = item.image_name;
						
						if(image == null) {
							image = "${path }/resources/images/main/noThumbnail.jpg";
						} else {
					        image = "http://c3d2212t3.itwillbs.com/images/" + image;
					    }

						var str = '<div class="itemThumbnailBox" data-cd="';
						str += code;
						str +=	'">';
						str += '<div class="itemThumbnailBox">';
						str += '<img src="' + image + '" alt="썸네일" class="itemThumbnail" style="cursor: pointer">';
						str += '<div class="wishWrapper">';
						str += '<img src="${path }/resources/images/main/ico_heart_off_x3.png" alt="좋아요 아이콘" class="wishWishIcon">';
						str += '</div>';
						str += '</div>';
						str += '<div class="itemTextBox">';
						str += '<div class="itemCategory">';
						str += category;
						str += '</div>';
						str += '<div class="itemText subject">';
						str += subject;
						str += '</div>';
						str += '<div class="itemText">';
						str += price + '원';
						str += '</div>';
						
						if(tag.length >= 2) {
							for(var i = 0; i < tag.length; i++) {
								str += '<div class="itemTagBox">';
								str += '<div class="itemSizeTag">';
								str += tag[i];
								str += '</div>';
							}
						} else {
							str += '<div class="itemTagBox">';
							str += '<div class="itemSizeTag">';
							str += tag;
							str += '</div>';
						}
						
						str += '</div>';
						str += '</div>';
						str += '<div class="itemTimeTag">';
						str += date;
						str += '</div>';
						
						$(".itemWrapper").append(str);
						
	 				}
	 			},
	 			error: function(xhr, textStatus, errorThrown) {
	 				console.log("marketItemList : 요청처리실패");
	 			}
	 		});
		}
		
		
		$(function () {
			marketItemList();
			
			
			$(".FilterCategory").on("click", function(e) {
				$(".priceDetail").hide();
				$(".categoryDetail").show();
			});
			$(".FilterPrice").on("click", function(e) {
				$(".categoryDetail").hide();
				$(".priceDetail").show();
			});
			
			
			// 카테고리 선택
			$(document).on("click", ".ListNonSelected", function(e) {
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
			$(document).on("click", ".tagListResetImg", function(e) {
				$(".tagListTag").remove();
			});
			
			
			// 가격 설정
			$(document).on("click", ".priceApplyBtn", function(e) {
				$("#item_price_min").val(0);
				$("#item_price_max").val(999999999999999);
				
				var item_price_min = $(".item_price_min").val();
				var item_price_max = $(".item_price_max").val();
				
				console.log(item_price_min);
				console.log(item_price_max);
				// 필터에 추가
				$(".tagPrice").remove();
				var tagStr = '';
				tagStr += '<div class="tagPrice">';
				tagStr += '<div class="tagListTag">';
				tagStr += '<div class="tagListName">';
				tagStr += item_price_min;
				tagStr += '원~';
				tagStr += item_price_max;
				tagStr += '원';
				tagStr += '</div>';
				tagStr += '<img src="https://ccimage.hellomarket.com/img/web/search/filter/mweb/ico_close_tag.png" alt="remove" class="tagListRemove"></div></div>';
				$(".tagListFilterBox").append(tagStr);
				
				
				$("#item_price_min").val(item_price_min);
				$("#item_price_max").val(item_price_max);
				marketItemList();
			});
			
			
			// 거래완료 체크
			$(document).on("click", "#complete", function(e) {
				var completeChecked = $("#complete").prop("checked")
				if(completeChecked) {
					$("#item_status").val("판매중");
				} else {
					$("#item_status").val("");
				}
				marketItemList();
			});
			
			
			// 등급 체크
			$(document).on("click", "#grade", function(e) {
				var gradeChecked = $("#grade").prop("checked")
				if(gradeChecked) {
					$("#member_grade").val("새싹");
				} else {
					$("#member_grade").val("");
				}
				marketItemList();
			});
			
			
			// 정렬 박스 열기
			$(document).on("click", ".sortSortBox", function(e) {
				if($('.SortListWrapper').css('display') == 'none' ) {
					  $('.SortListWrapper').show();
					} else {
					  $('.SortListWrapper').hide();
					}
			});
			
			
			// 정렬 선택
			$(document).on("click", ".SortListList", function(e) {
				$(".sortSortBox").remove();
				var title = $(this).attr("title");
				// 정렬 글자 변경
				var str = '';
				str += '<div class="sortSortBox">';
				str += '<div class="sortSort">';
				str += title;
				str += '</div>';
				str += '<img src="https://ccimage.hellomarket.com/img/web/search/itemList/ico_sort.png" alt="정렬 아이콘" class="sortSortImg"/></div>';
				
				$(".SortListWrapper").after(str);
				
				var sort = $(this).attr("id");
				$("#sort").val(sort);
				marketItemList();
			});
			
			
			
			
			// 제목 클릭
			$(document).on("click", ".subject", function(e) {
				location.href="market_detail";
				
			});
			
			
			// 이미지 클릭
			$(document).on("click", ".itemThumbnail", function(e) {
				var item_code = $(this).parent().parent().data("cd");
				$("#item_code").val(item_code);
				location.href="market_detail?item_code=" + $("#item_code").val();
			});
			
			
			
		});
	
	</script>
<jsp:include page="../footer.jsp" />
</body>
</html>
