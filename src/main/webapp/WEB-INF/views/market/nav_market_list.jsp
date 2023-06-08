<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path }/resources/css/market.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/moment.js"></script>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="sort" name="sort" value="default">
<input type="hidden" id="navSearch" name="navSearch" value="${param.navSearch }">
  
<jsp:include page="../nav.jsp" />
<div id="__next">
		<div class="layout__Header-sc-1fg0dfe-0 iSTjqT">
			<div class="header__Wrapper-hucg1a-0 dncKiK">
				<div class="header__Gnb-hucg1a-1 fixMZO"></div>
			</div>
		</div>
		<div class="layout__Children-sc-1fg0dfe-2 jjXXzz"></div>
   	    <div class="newSearchWrapper">
<!--    	    카테고리 -->
			<div class="webWrapper">
				
	         </div>
<!-- 	         카테고리 end -->
			

아니 왜 하나만 나옴?
			
			<div class="searchedListWrapper">
				<div class="searchedListTopWrapper">
 					<div class="CountListCount">
						<span class="Count"></span>개의 상품이 있습니다.                    
					</div>
                    <!-- 정렬 -->
					<div class="SortListWrapper">
						<div class="SortListList" id="default" title="최근 등록순">최근 등록순</div>
						<div class="SortListList" id="lowPrice" title="낮은 가격순">낮은 가격순</div>
						<div class="SortListList" id="highPrice" title="높은 가격순">높은 가격순</div>
						<div class="SortListList" id="highGrade" title="높은 등급순">높은 등급순</div>
                   	</div>
                   	<!-- 현재 정렬 -->
                    <div class="sortSortBox">
                    	<div class="sortSort">최근 등록순</div>
                        <!-- 정렬버튼 이미지 -->
                        <img src="https://ccimage.hellomarket.com/img/web/search/itemList/ico_sort.png" alt="정렬 아이콘" class="sortSortImg">
                        </div>
                </div>
                <div>
                   	<!-- 목록 -->
                    <div class="infinite-scroll-component " style="height:auto;">
						<div class="itemListWrapper">
							<div class="itemWrapper"></div>
						</div>
					</div>
				</div>
            </div>
        </div>
   	</div>
          
<script type="text/javascript">
	// ajax에서 받은 데이터로 div 생성
	function makeDiv(response) {
		for(let item of response) {
			let category = item.item_category;
			let subject = item.item_subject;
			let price = item.item_price;
			let tags = item.item_tag;
			let tag = tags.split(',');
			let date = item.item_date;
			let code = item.item_code;
			let image = item.image_name;
			let count = item.total_count;
			var wish = item.wish_code;
			
			price = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			var itemDate = date;
			var formattedDate = moment(itemDate).format("YYYY-MM-DD HH:mm");
			
			
			if(image == null) {
				image = "${path }/resources/images/main/noThumbnail.jpg";
			}
			
			if(wish == null) {
				wish = '<img src="${path }/resources/images/main/ico_heart_off_x3.png" alt="좋아요 아이콘" class="WishWishImg wish" onclick="wish.call(this)"/>'
			}else{
				wish = '<img src="${path }/resources/images/main/ico_heart_on_x3.png" alt="좋아요 아이콘" class="WishWishImg" onclick="wish.call(this)" />'
			}
	
			var str = '<div class="itemThumbnailBox item" data-cd="';
			str += code;
			str +=	'">';
			str += '<div class="itemThumbnailBox">';
			str += '<img src="' + image + '" alt="썸네일" class="itemThumbnail" style="cursor: pointer">';
			str += wish;
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
			
			if(tag != "") {
				str += '<div class="itemTagBox">';
				
				for(var i = 0; i < tag.length; i++) {
					str += '<div class="itemSizeTag">';
					str += tag[i];
					str += '</div>';
				}
				str += '</div>';
			}
			
			str += '<div class="itemTimeTag">';
			str += formattedDate;
			str += '</div></div>';
			
			$(".itemWrapper").append(str);
			$(".Count").empty().append(count);
			
		}
		
			var more = '<div class="chall_more">MORE</div>';
			$(".itemListWrapper").after(more);
			
			$(".itemThumbnailBox").hide();
			$(".itemThumbnailBox").slice(0, 20).show();
			
			if($(".itemThumbnailBox:hidden").length == 0) {
				$(".chall_more").fadeOut(100);
			}
	}


	// 상품 리스트 불러오기
	function navMarketItemList() {
		$(".itemThumbnailBox").remove();
		$(".chall_more").remove();
	
		var navSearch = $("#navSearch").val();
		var sort = $("#sort").val();
		
		
		console.log("------ navMarketItemList 요청 시 들어가는 값 ------")
		console.log("navSearch : " + navSearch);
		console.log("sort : " + sort);
		
		$.ajax({													
				type: "GET",
				url: "navMarketItemList", 
				data: { 
					navSearch : navSearch, 
					sort	  : sort
				},
				dataType: "json",
				success: function(response) { 
					console.log("navMarketItemList : 요청처리성공");
					
					 if (response.length == 0) {
			           let count = 0;
			           $(".Count").empty().append(count);
			           return;
					 } 
					 // div 생성
					 makeDiv(response);
				},
				error: function(xhr, textStatus, errorThrown) {
					console.log("navMarketItemList : 요청처리실패");
				}
			});
	}


	$(function () {
		$(document).ready(function() {
		   var navSearch = $("#navSearch").val();
	       console.log("navSearch : " + navSearch);
		});
		
		navMarketItemList();
		
	});
	
	
	
	
function wish(){
	
	event.preventDefault();
	
	var $btnWish = $(this);
	var item_code = $btnWish.closest(".item").attr("data-cd");
	
	if(${not empty sessionScope.sId}){
		$.ajax({
	   		url : 'clickWish',
	   		type : 'POST',
	   		data : {item_code : item_code}
		}).done(function(){
			$btnWish.toggleClass("wish");
			
			if($btnWish.hasClass("wish")){
				$btnWish.attr({
					'src' : 'resources/images/main/ico_heart_off_x3.png',
					alt : '찜하기 완료'
				});	
			}else{
				$btnWish.attr({
					'src' : 'resources/images/main/ico_heart_on_x3.png',
					alt : '찜하기'
				});
			}
		}).fail(function(){
			
		})	
	}else{
		alert("로그인 후 이용할 수 있습니다.");
	}
}	
</script>
<jsp:include page="../footer.jsp" />
</body>
</html>
<!-- 페이지 자체가 렉 넘 심해서.. 혹시나 해서 10번 라인에 jQuery 서버경로로 바꿨는데
	좀 빨라진 체감이 있는것 같기도...?? 잘 작동안되면 원래 버전으로 바꿔주세요 ~
 -->