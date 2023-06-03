<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/market.css">
<link rel="stylesheet" href="${path }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/wish.js"></script>
<script>

$(document).ready(function(){
	
  	$(".itemThumbnail, .itemTextBox").on("click",function(){
  		var item_code = $(this).closest(".item").attr("data-cd");
		location.href="market_detail?item_code="+item_code
	})
	 
	$(".tabTab").on("click",function(){
		var itemType = $(this).attr('data-attr');
		$(".tabTab").removeClass("active")
		$(this).addClass("active")
		// active된 탭에 대한 css 작업 필요
		location.href = "mypage?itemList="+ itemType + "&member_id=${member.member_id }" ;
		})
		
})
function memberAuth(){
	let authWindow = window.open("about:blank","authWindow","width=500, height=700");
	authWindow.location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize"
	+"?response_type=code"
	+"&client_id=bd507152-7d5b-4954-be9e-ef67beadb7eb"
	+"&redirect_uri=http://localhost:8082/moneytto/memberAuth"
	+"&scope=login inquiry transfer"
	+"&state=11111111111111111111111111111111"
	+"&auth_type=0";
	
}

</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
							
	<div class="profileWrapper">
		<div class="profileContainer">
			<div class="memberInfoWrapper">
				<div class="memberInfoInfoArea">
					<div class="userDataWrapper">
							<div class="profile_edit_image">
							<div class="profile_edit_image_box">
								<img src="${member.member_image}" alt="머니또의 프로필 이미지">
							</div>
							</div>
							<div class="userDataNickName">${member.member_nickname } 님</div>
					</div>
					<div class="memberInfoReviewBox">
						<div class="memberInfoText">등급</div>
						<div class="memberInfoRating">
							<div class="memberInfoCount">${member.grade_score }</div>
						</div>
					</div>
					<c:if test= "${sessionScope.sId eq member.member_id }">
					<div class="memberInfoReviewBox">
						<div class="memberInfoText">또머니</div>
						<div class="memberInfoCount">${member.member_point }원</div>
					</div>
					<div class="memberInfoReviewBox">
						<div class="memberInfoText">또머니페이</div>
						<c:choose>
							<c:when test="${member.member_auth_status eq 'Y'  }">
								<div class="memberInfoCount" onclick="location.href='bank_userInfo'">계좌 관리</div>
							</c:when>
							<c:otherwise>
								<div class="memberInfoCount" onclick="memberAuth()">계좌 등록</div>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="memberInfoMyDataBox" onclick='location.href="memberUpdateForm"'>
						<div class="memberInfoSettingMyData">내정보 수정하기</div>
					</div>
					</c:if>
				</div>
			</div>
			
			<!-- 탭 -->
			<div class="listWrapper">
				<div class="tabWrapper">
					<div class="tabTab active"  data-attr="sellItem"><a href="#">판매 상품</a></div>
					<div class="tabTab" data-attr="wishItem"><a href="#">찜한 상품</a></div>
					<div class="tabTab" data-attr="buyItem"><a href="#">구매 상품</a></div>
					<div class="tabTab"><a href="#">#참여 중인 경매</a></div>
					<div class="tabTab"><a href="market_review">리뷰 보기</a></div>
					<div class="tabTab"><a href="reviewRegist">리뷰 작성</a></div>
				</div>
				
				<div class="filterBarWrapper">
					<div class="tabPcBox">
						<div class="tabFilterTab">
							<div style = "width:180px" class="DropBoxWrapper">
								<div class="DropBoxBox">
									<div class="CategoryText">카테고리 전체</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="CategoryArrow">
								</div>
							</div>
							
							<div style = "width:130px" class="DropBoxWrapper">
								<div class="DropBoxBox">
									<div class="SellStatusText">판매상태</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="SellStatusArrow">
								</div>
							</div>
							
							<div style = "width:140px" class="DropBoxWrapper">
								<div class="DropBoxBox">
									<div class="PriceText">가격</div>
									<img
										src="https://ccimage.hellomarket.com/img/common/arrow/arrow_drop_down.svg"
										alt="화살표 이미지" class="PriceArrow">
								</div>
							</div>
							<form class="SearchWrapper" style="width: 257px">
								<input type="text" placeholder="상품명 검색"
									class="SearchInput-ukztbj-1 inqgpT" value=""><img
									src="https://ccimage.hellomarket.com/img/web/common/black_glass.svg"
									alt="카테고리 검색 아이콘" class="SearchSearchImg-ukztbj-2 gSfjHN">
							</form>
						</div>
					</div>
					<div class="tagListWrapper-gkczkp-0 geRbir"></div>
					
				</div>
				<div class="listControlBox"><div class="listCount">전체 ${fn:length(itemList) }</div>
				</div>
				
				<div class="itemWrapper">
					<c:forEach var="item" items="${itemList }">
					<div class="item" data-cd="${item.item_code }">
						<div class="itemThumbnailBox">
							<c:choose>
                              	<c:when test="${not empty item.image_name }">
                              		<img src="${item.image_name }" alt="itemImg" class="itemThumbnail"/>
                              	</c:when>
                              	<c:otherwise>
									<img src="${path }/resources/images/main/noThumbnail.jpg" alt="itemImg" class="itemThumbnail" />		                                  		
                              	</c:otherwise>
                            </c:choose>
							<c:choose>
                       	 		<c:when test="${not empty item.wish_code }">
                       	 			<img src="${path }/resources/images/main/ico_heart_on_x3.png" alt="좋아요 아이콘" class="WishWishImg" />
                           		</c:when>
                	 		   	<c:otherwise>
                      	 		   	<img src="${path }/resources/images/main/ico_heart_off_x3.png"  alt="좋아요 아이콘" class="WishWishImg wish" >
                      	 		</c:otherwise>
                             </c:choose>
						</div>
						<div class="itemTextBox">
							<div class="itemCategory">${item.item_category }</div>
							<div class="itemText subject">${item.item_subject }</div>
							<div class="itemText">${item.item_price }원</div>
							<div class="itemTagBox">
							<c:forEach var="item_tag" items ="${fn:split(item.item_tag, ',') }">
							<div class="itemSizeTag">${item_tag }</div>
							</c:forEach>
							</div>
							<div class="itemTimeTag">${item.item_date }</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>