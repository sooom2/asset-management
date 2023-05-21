<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		$(".ThumbNailTypeImgBox").on("click",function(){
			location.href="market_detail"
		})
		
		$(".ThumbNailTypeItemInfoBox").on("click",function(){
			location.href="market_detail"
		})	
	})

</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />

	<div class="profileWrapper">
		<div class="profileContainer">
			<div class="memberInfoWrapper">
				<div class="memberInfoInfoArea">
					<div class="userDataWrapper">
						<div>
							<div class="userDataImgBox">
								<img src="${path}/resources/images/mypage/cute.png"
									alt="profileImg" class="userDataProfileImg ">
							</div>
							<div class="userDataNickName">${member.member_nickname } 님</div>
						</div>
					</div>
					<div class="memberInfoProductCountBox">
						<div class="memberInfoText">상품</div>
						<div class="memberInfoCount">0</div>
					</div>
					<div class="memberInfoReviewBox">
						<div class="memberInfoText">등급</div>
						<div class="memberInfoRating">
							<!-- 이미지 태그 넣을 부분 -->
							
							<!--  -->
							<div class="memberInfoCount">${member.grade_score }등급</div>
						</div>
					</div>
					<div class="memberInfoReviewBox">
						<div class="memberInfoText">남은머니</div>
						<div class="memberInfoCount">${member.member_point }원</div>
					</div>
					<div class="memberInfoRating">
						<div class="payCharge"><Input type="button" value="충전"></div> &nbsp;&nbsp;
						<div class="payReturn"><Input type="button" value="환급"></div>
					</div>
					<div class="memberInfoMyDataBox" onclick='location.href="mypageInfo"'>
						<div class="memberInfoSettingMyData">내정보 설정</div>
					</div>
				</div>
			</div>
			
			
<!-- 			탭 -->
			<div class="listWrapper">
				<div class="tabWrapper">
					<div class="tabTab active"><a href="mypage">판매 상품</a></div>
					<div class="tabTab"><a href="mypageFavorite">찜한 상품</a></div>
					<div class="tabTab"><a href="#">구매 상품</a></div>
					<div class="tabTab"><a href="#">참여 중인 경매</a></div>
					<div class="tabTab"><a href="#">거래 후기</a></div>
					<div class="tabTab"><a href="#">추천 상품</a></div>
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
				<div class="listControlBox"><div class="listCount">전체 0</div>
				</div>
				
				<div class="itemWrapper">
				  	<div class="itemItemWrapper">
						<c:forEach var="item" items="itemList">
						<!-- c:if itemList -> item으로 수정해주기 -->
							<c:if test='${not empty itemList }'>
							<div class="itemItemBox">
	                          <div class="ThumbNailTypeWrapper">
	                              <div class="ThumbNailTypeItemBox">
	                                  <div class="ThumbNailTypeImgBox">
	                                      <img src="https://ccimg.hellomarket.com/images/2023/item/05/20/00/5015019_5421001_1.jpg?size=s4" alt="itemImg" class="ThumbNailTypeItemImg"/>
	                                      <div class="SellStateImgWrapper">
	                                          <div class="SellStateImgStateBox"></div>
	                                      </div>
	                                      <img src="https://ccimage.hellomarket.com/img/web/feed/tag/ico_heart_on.svg" class="WishWishImg"/>
	                                  </div>
	                                  <div class="ThumbNailTypeItemInfoBox">
	                                      <div class="ThumbNailTypeItemInfo">
	                                          <div class="ThumbNailTypeTitle">${item.name }</div>
	                                          <div class="ThumbNailTypePrice">${item.price }원</div>
	                                      </div>
	                                      <div class="SearchIconWrapper">
	                                         <img src="https://ccimage.hellomarket.com/web/2017/common/img_search_n.png" class="SearchIcon"/>
	                                     </div>
	                                  </div>
	                              </div>
	                          </div>
	                      </div>
	                      </c:if>
						</c:forEach>				  		
	                      	<div class="itemItemBox">
	                          <div class="ThumbNailTypeWrapper">
	                              <div class="ThumbNailTypeItemBox">
	                                  <div class="ThumbNailTypeImgBox">
	                                      <img src="https://ccimg.hellomarket.com/images/2023/item/05/20/00/5015019_5421001_1.jpg?size=s4" alt="itemImg" class="ThumbNailTypeItemImg"/>
	                                      <div class="SellStateImgWrapper">
	                                          <div class="SellStateImgStateBox"></div>
	                                      </div>
	                                      <img src="https://ccimage.hellomarket.com/img/web/feed/tag/ico_heart_on.svg" class="WishWishImg"/>
	                                  </div>
	                                  <div class="ThumbNailTypeItemInfoBox">
	                                      <div class="ThumbNailTypeItemInfo">
	                                          <div class="ThumbNailTypeTitle">세인트루이스 뉴에라...</div>
	                                          <div class="ThumbNailTypePrice">5,000원</div>
	                                      </div>
	                                      <div class="SearchIconWrapper">
	                                         <img src="https://ccimage.hellomarket.com/web/2017/common/img_search_n.png" class="SearchIcon"/>
	                                     </div>
	                                  </div>
	                              </div>
	                          </div>
	                      </div>
	                      <div class="itemItemBox">
	                          <div class="ThumbNailTypeWrapper">
	                              <div class="ThumbNailTypeItemBox">
	                                  <div class="ThumbNailTypeImgBox">
	                                      <img src="https://ccimg.hellomarket.com/images/2023/item/05/20/00/5015019_5421001_1.jpg?size=s4" alt="itemImg" class="ThumbNailTypeItemImg"/>
	                                      <div class="SellStateImgWrapper">
	                                          <div class="SellStateImgStateBox"></div>
	                                      </div>
	                                      <img src="https://ccimage.hellomarket.com/img/web/feed/tag/ico_heart_on.svg" class="WishWishImg"/>
	                                  </div>
	                                  <div class="ThumbNailTypeItemInfoBox">
	                                      <div class="ThumbNailTypeItemInfo">
	                                          <div class="ThumbNailTypeTitle">세인트루이스 뉴에라...</div>
	                                          <div class="ThumbNailTypePrice">5,000원</div>
	                                      </div>
	                                      <div class="SearchIconWrapper">
	                                         <img src="https://ccimage.hellomarket.com/web/2017/common/img_search_n.png" class="SearchIcon"/>
	                                     </div>
	                                  </div>
	                              </div>
	                          </div>
	                      </div>
	                      <div class="itemItemBox">
	                          <div class="ThumbNailTypeWrapper">
	                              <div class="ThumbNailTypeItemBox">
	                                  <div class="ThumbNailTypeImgBox">
	                                      <img src="https://ccimg.hellomarket.com/images/2023/item/05/20/00/5015019_5421001_1.jpg?size=s4" alt="itemImg" class="ThumbNailTypeItemImg"/>
	                                      <div class="SellStateImgWrapper">
	                                          <div class="SellStateImgStateBox"></div>
	                                      </div>
	                                      <img src="https://ccimage.hellomarket.com/img/web/feed/tag/ico_heart_on.svg" class="WishWishImg"/>
	                                  </div>
	                                  <div class="ThumbNailTypeItemInfoBox">
	                                      <div class="ThumbNailTypeItemInfo">
	                                          <div class="ThumbNailTypeTitle">세인트루이스 뉴에라...</div>
	                                          <div class="ThumbNailTypePrice">5,000원</div>
	                                      </div>
	                                      <div class="SearchIconWrapper">
	                                         <img src="https://ccimage.hellomarket.com/web/2017/common/img_search_n.png" class="SearchIcon"/>
	                                     </div>
	                                  </div>
	                              </div>
	                          </div>
	                      </div>
	                      <!-- TODO -->
	<!-- 					<div class="EmptyEmptyBox"> -->
	<!-- 						<div class="EmptyTitle">아쉽게도, 현재 검색된 상품이 없어요</div> -->
	<!-- 						<div class="EmptyGuide">필터를 재설정하거나 전체 상품 보기를 선택해주세요</div> -->
	<!-- 						<div class="EmptyBtnBox"> -->
	<!-- 							<img -->
	<!-- 								src="https://ccimage.hellomarket.com/img/web/common/refresh_mark.svg" -->
	<!-- 								alt="초기화 마크" class="EmptyResetMark-xvqyzf-4 YrGaN"> -->
	<!-- 							<div class="EmptyShowAllText">전체 상품 보기</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 					<div class="EmptyNoticeBox"></div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>