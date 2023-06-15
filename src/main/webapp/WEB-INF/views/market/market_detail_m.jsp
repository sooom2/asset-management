<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="resources/css/swiper.min.css" rel="stylesheet" />
<link href="${path }/resources/css/main_mobile.css" rel="stylesheet">
<link href="${path }/resources/css/market_detail_mobile.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/moment.js"></script>
<script type="text/javascript" src="${path }/resources/js/wish.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

$(function() {
	
	$(".SomeonesItemButton").click(function() {
		
		location.href="marketChat?item_code="+$(this).data("cd");
	});
	$(".SomeonesModifyButton").click(function() {
		
// 		swal("수정페이지 만들면 이동 : 판매자랑 세션 아이디랑 같을 경우 채팅하기 버튼 없어요!");
		var item_code = $(this).data('cd');
	    location.href = "itemModify?item_code=" + item_code;
	    

	});
});

//좋아요 
function toggleLike(element) {
  var imgSrc = element.getAttribute('src');
  if (imgSrc === 'https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png') {
    element.setAttribute('src', 'https://ccimage.hellomarket.com/img/web/item/detail/Ico_wish_on.png');
  } else {
    element.setAttribute('src', 'https://ccimage.hellomarket.com/img/web/item/detail/ico_wish_default.png');
  }
}



//삭제하기 버튼 클릭 시 itemDeletePro 실행
	$(function() {
	  $(".SomeonesDeleteButton").click(function() {
	    var item_code = $(this).data("cd");
	    var confirmDelete = confirm("정말로 삭제하시겠습니까?");
	    if (confirmDelete) {
	      itemDeleteRequest(item_code);
	    }
	  });

	  function itemDeleteRequest(item_code) {
	    $.ajax({
	      type: "POST",
	      url: "itemDeletePro",
	      data: { item_code: item_code },
	      success: function(response) {
	        if (response === "success") {
	          swal("상품이 삭제되었습니다.");
	          window.location.href = "main";  // 메인 페이지로 이동
	        } else {
	          swal("상품 삭제에 실패하였습니다.");
	        }
	      },
	      error: function() {
	        swal("상품 삭제 중 오류가 발생하였습니다.");
	      }
	    });
	  }
	});

</script>
</head>
<body>
<input type="hidden" id="item_code" name="item_code" value="${marketItem.item_code }">
<input type="hidden" id="target_id" name="target_id" value="${marketItem.member_id}"/>
<input type="hidden" id="report_type" name="report_type" value=""/>
<input type="hidden" id="report_content" name="report_content" value=""/>
<input type="hidden" id="session_id" name="session_id" value="${sId }"/>

<input type="hidden" id="item_subject" name="item_subject" value="${marketItem.item_subject }"/>
<input type="hidden" id="item_content" name="item_content" value="${marketItem.item_content }"/>
<input type="hidden" id="item_price" name="item_price" value="${marketItem.item_price }"/>
<input type="hidden" id="item_image" name="item_image" value="${itemImage[0].image_name }"/>


	<div class="layout__Header-sc-1fg0dfe-0 iSTjqT" style="background-color: #BB2649">
			<div class="TopNavigation__Wrapper-sc-6acoe4-0 iqcBld" style="border-bottom: 1px solid #2f2f2f; ">
				<div class="menu2" style=" display: inline-block;margin-left:5px;margin-top:2px; font-size: 2vh;padding: 27px 10px;color: #fff!important; ">
					<a href="main"><div style="display: inline-block;height: 30px;"><img src="${path }/resources/images/header/mobile_logo.png" style="height: 46px;    margin-bottom: 10px;"></div></a>
					<div class="menu" style=" display: inline-block;    margin-right: 15px; color: #fff">
						<a href="auctionMain" style="color: #fff">경매</a>
					</div>
					<div class="menu" style=" display: inline-block;margin-right: 15px;color: #fff">
						<a href="market_list" style="color: #fff">중고거래</a>
					</div>
					<div class="menu" style=" display: inline-block;margin-right: 15px;color: #fff">
						<a href="commBoard" style="color: #fff">커뮤니티</a>
					</div>
					<div class="menu" style=" display: inline-block;color: #fff ">
						<a href="noticeList" style="color: #fff">공지사항</a>
					</div>
				</div>
				<div class="jCbMwE" style=" margin-top:25px;display: inline-block;margin-right:15px; float: right; padding: 6px;color: #fff ">
					
						
				<c:choose>
					<c:when test="${empty sessionScope.sId }">
						<a href="memLogin_mobile" style="color: #fff;font-size: 45px"><i class="fa-regular fa-circle-user"></i></a>	
					</c:when>
					<c:otherwise>
						<a href="todayAlarm" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-regular fa-bell"></i></a>
						<a href="marketChat" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-regular fa-comment-dots fa-flip-horizontal" ></i></a>
						<a href="logout" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-right-from-bracket"></i></a>
						<c:if test="${sessionScope.sId ne 'admin' }">
							<a href="itemRegist_mobile" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-boxes-packing"></i></a>
						</c:if>
						<c:if test="${sessionScope.sId eq 'admin' }">
						<a href="admin" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-screwdriver-wrench"></i></a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			</div>
		</div>	

<!--왼쪽섹션 -->
	<div style="padding: 65px 20px;">
		<div class="trade_status" style="display: inline-block;"><input type="button" value="${marketItem.item_status }" class="active" ></div>
		
		<div class="TopNavigationWrapper">
				<img
					src="https://ccimage.hellomarket.com/img/web/item/detail/ico_report.png"
					alt="신고하기" class="TopNavigationIcon report">
				<img
					src="https://ccimage.hellomarket.com/img/web/item/detail/ico_share.png"
					alt="공유하기" class="TopNavigationIcon share">
				<!-- 공유하기 -->
				<div class="Share__Wrapper-sc-1nwaldt-0 gXuuDJ" style="display: none;">
					<div class="Share__IconBox-sc-1nwaldt-4 exALGq">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_kakao.png"
							alt="카카오톡 아이콘" class="Share__Icon-sc-1nwaldt-5 dvejot" onclick="shareMessage()">
						<div class="Share__IconText-sc-1nwaldt-6 fBVupx">카카오톡</div>
					</div>
					<div class="Share__IconBox-sc-1nwaldt-4 bzuDcA">
						<img
							src="https://ccimage.hellomarket.com/img/web/item/detail/ico_link_x2.png"
							alt="링크 아이콘" class="Share__Icon-sc-1nwaldt-5 cVlCCb" onclick="clip(); return false;">
						<div class="Share__IconText-sc-1nwaldt-6 fBVupx">링크복사</div>
					</div>
				</div>
		</div>
		<div class="TitleWrapper">
			<div class="TitleText1">${marketItem.item_subject}</div>
			<div class="TitleText2">${marketItem.item_price}원</div>
		</div>
		<!-- 카테고리 -->
		<div class="CategoryWrapper">
			<div class="CategoryTitle">카테고리</div>
			<div class="CategoryCategoryBox">
				<div class="DivergedLinkTitle">${marketItem.item_category}</div>
			</div>
		</div>
		<div class="Tag__Wrapper-td2hyd-0 jLVEzu">
				<div class="Tag__Title-td2hyd-1 irWNGN">태그</div>
				<div class="Tag__TagWrapper-td2hyd-2 TitNF">
					<c:forEach var="tag" items="${marketItem.item_tag}">
						<div class="Tag__TagBox-td2hyd-3 jsrScO">
						<div class="Tag-td2hyd-4 fKGvTO">${tag}</div>
					</div>
					</c:forEach>
				</div>
			</div>
		<div>
			
		
		</div>
		<div class="profileWrapper">
			<div class="profileProfileData" onclick="location.href='mypage?member_id=${marketItem.member_id}'">
				<img
					src="${marketItem.member_image }"
					alt="profileImg" class="profileProfileImg">
				<div class="ProfileInfoWrapper">
					<div class="ProfileInfoProfileName">${marketItem.member_nickname}</div>
					<div class="ProfileInfoItemCountBox">
					</div>
					<div class="ProfileInfoRating">
						<img
							src="${grade.grade_img }"
							alt="rating" class="ProfileInfoStarImg">
						<div class="ProfileInfoRatingScore">${grade.grade_name }</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<div id="next" data-cd="${marketItem.item_code }" class="item">
		<div class="layoutChildren"></div>
		<div class="newDetailWrapper">
			<div class="newDetailMain">
				<div class="leftSectionWrapper">
					<div class="MainImgWrapper">
						<div class="swiper-container"
							modules="[object Object],[object Object]">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-pagination"></div>
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<div class="swiper-wrapper">
										<img src="${itemImage[0].image_name}" class="MainImgItemImg">
									</div>
								</div>
							</div>
						</div>
						<div class="SellStateImgWrapper"></div>
					</div>
					<div class="PreviewImgListWrapper">
						<div class="PreviewImgListPreviewImgContainer">
							<div class="swiper-container" modules="[object Object]">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<c:forEach var="itemImage" items="${itemImage}">
											<img src="${itemImage.image_name}" alt="preview" class="PreviewImgListItemImg">
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!--판매자정보 -->
				
				</div>
				</div>
				</div>
				</div>


	<div id="next" data-cd="${marketItem.item_code }" class="item">
		<div class="layoutChildren"></div>
		<div class="newDetailWrapper">
			<div class="newDetailMain">
				
				<!--오른쪽섹션 -->
				<div id="rightSection" class="rightSectionWrapper">
					<div class="DescriptionWrapper">
						<div class="DescriptionText">
							${marketItem.item_content }
						</div>
					</div>
					
					
					<div class="itemControllerWrapper">
						<div class="SomeonesItemWrapper">
								<div class="WishWrapper" data-cd="${marketItem.item_code }">
								  <c:choose>
	                       	 		<c:when test="${not empty itemWish}">
	                       	 			<img src="${path }/resources/images/main/ico_heart_on_x3.png" alt="좋아요 아이콘" class="WishWishImg" />
	                           		</c:when>
	                	 		   	<c:otherwise>
	                      	 		   	<img src="${path }/resources/images/main/ico_heart_off_x3.png"  alt="좋아요 아이콘" class="WishWishImg wish" >
	                      	 		</c:otherwise>
	                             </c:choose>
								</div>
								<c:choose>
									<c:when test="${marketItem.member_id eq sessionScope.sId}">
										<div width="50%" class="SomeonesModifyButton"data-cd="${marketItem.item_code }">
										<div color="#FFFFFF" class="SomeonesItemText">수정하기</div>
										</div>
										<div width="50%" class="SomeonesDeleteButton"data-cd="${marketItem.item_code }">
										<div color="#FFFFFF" class="SomeonesItemText">삭제하기</div>
										</div>
									</c:when>
									<c:otherwise>
										<div width="90%" class="SomeonesItemButton"data-cd="${marketItem.item_code }">
										<i class="fa-regular fa-comment-dots fa-flip-horizontal" style="color: white;"></i>&nbsp;
										<div color="#FFFFFF" class="SomeonesItemText">채팅하기</div>
										</div>
									</c:otherwise>
								</c:choose>
						</div>
					</div>
					
					
					<!-- 안전거래 -->
					<div style="margin: -19px 20px 10px"
						class="AdSenseWrapper">
						<ins class="adsbygoogle responsive" style="display: block"
							data-ad-format="auto" data-ad-layout-key="+1h+s8-4-62+b3"
							data-ad-slot="5474011742"
							data-ad-client="ca-pub-9169594828612333"
							data-full-width-responsive="false"></ins>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 신고 모달창 -->
		<div class="ReactModalPortal" style="display: none;">
			<div
				class="detail_report">
				<div class="modal_main" tabindex="-1" role="dialog">
					<div class="modal_parent">
						<div class="modal_container">
							<div class="ReportWrapper">
								<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_close_modal.png" alt="닫기 아이콘" class="ReportCloseIcon close">
								<div class="Report__Title-sc-140fn8w-2 fwaQok">신고 사유를 선택해 주세요.</div>
								<div class="Report__ListWrapper-sc-140fn8w-3 gGZdRJ">
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="안전결제 거부" alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">안전결제 거부</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="주류, 담배" alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">주류, 담배</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img
											src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="전문 의약품, 의료기기" alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">전문 의약품, 의료기기</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="개인정보 거래(신분증, 대포폰 등)"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">개인정보 거래(신분증, 대포폰 등)</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="음란물/성인용품(중고속옷 포함)"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">음란물/성인용품(중고속옷 포함)</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="위조상품"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">위조상품</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="총포 도검류"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">총포 도검류</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="화장품 견본품"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">화장품 견본품</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="게임계정"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">게임계정</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="도배행위"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">도배행위</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="동물 분양/입양글"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">동물 분양/입양글</div>
									</div>
									<div class="Report__ListBox-sc-140fn8w-4 ezioIF">
										<img src="https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png" id="기타"  alt="체크박스 아이콘" class="hzjjbI">
										<div class="Report__List-sc-140fn8w-6 ejCmPe">기타</div>
									</div>
								<div class="report_content">
									<textarea id="textarea" rows="5" cols="40" placeholder="신고 상세 사유를 입력해주세요." style="resize: none;"></textarea>
								</div>
								</div>
								<div class="Report__Button-sc-140fn8w-7 IZaFu">신고하기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	//init 체크
	if (!Kakao.isInitialized()) {
	  Kakao.init('02e5170f8bbb4a73ba5e5575b5b198b4');
	}
	
	
	
	function shareMessage() {
		    Kakao.Share.sendDefault({
		      objectType: 'commerce',
		      content: {
		        title: $("#item_content").val(),
		        imageUrl:
		        	$("#item_image").val(),
		        link: {
		          mobileWebUrl: 'http://c3d2212t3.itwillbs.com/Moneytto/market_detail?item_code=' + $("#item_code").val(),
		          webUrl: 'http://c3d2212t3.itwillbs.com/Moneytto/market_detail?item_code=' + $("#item_code").val(),
		        },
		      },
		      commerce: {
		        productName: $("#item_subject").val(),
		        regularPrice: parseInt($("#item_price").val()),
		      },
		      buttons: [
		    	  {
 		          title: '웹으로 보기',
 		          link: {
 		            mobileWebUrl: 'http://c3d2212t3.itwillbs.com/Moneytto/market_detail?item_code=' + $("#item_code").val(),
 		            webUrl: 'http://c3d2212t3.itwillbs.com/Moneytto/market_detail?item_code=' + $("#item_code").val(),
 					},
 				},
		      ],
		    });
		  }
	
	

	function report() {
		var id = "<%=(String)session.getAttribute("sId")%>";
		var targetId = $("#target_id").val();
		var reportType = $("#report_type").val();
		var reportContent = $("#report_content").val();
		var item_code = $("#item_code").val();
		
		$.ajax({													
				type: "GET",
				url: "report",
				data: { 
					targetId : targetId,
					reportType : reportType,
					reportContent : reportContent,
					item_code : item_code
				},
				dataType: "json",
					success : function(result){
		       			if(result){
		       				$(".ReactModalPortal").remove();
		       				swal("게시물을 신고하였습니다. \n 허위신고시 불이익이 있을 수 있습니다.")
		       			} else {
		       				swal("자신의 게시글을 신고할 수 없습니다.");
		       			}
		       		},
		       		error : function(XMLHttpRequest, textStatus, errorThrown) {
		       			swal("신고 접수에 실패하였습니다.");
					}
			});
	}
	
	// 금액 단위 콤마
	function priceReplace(price) {
		var price = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		$(".TitleText2").empty().append(price);
	}
	
	// 링크 복사
	function clip(){
		var url = "";
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		swal({	
    		icon: "success",
    		text: "URL이 복사되었습니다!"
        });
	}
	
	
	$(function () {
		var id = $("#session_id").val();
		var target = $("#target_id").val();
		
		var itemDate = "${marketItem.item_date}";
		var formattedDate = moment(itemDate).format("YYYY-MM-DD HH:mm");
		$(".SubTitleDetailText").text(formattedDate);
		
		var price = $(".TitleText2").text();
		priceReplace(price);
		
		
		// 신고하기
		$(document).on("click", ".report", function(e) {
			$(".ReactModalPortal").show();
		});
		
		// 신고 상세
		$(document).on("click", ".hzjjbI", function(e) {
			var originalImage = "https://ccimage.hellomarket.com/img/web/item/detail/ico_unChecked.png";
			var image = "https://ccimage.hellomarket.com/img/web/item/detail/ico_checked.png";
			$(".hzjjbI").attr("src", originalImage);
			$(this).attr("src", image);
			var reportType = $(this).attr("id");
			$("#report_type").val(reportType);
			
			$(".IZaFu").css("background", "#bb2649");
		});
		
		
		$(document).on("change", "#textarea", function(e) {
			$("#report_content").val($(this).val());
		});
		
		
		
		// 신고하기 버튼
		$(document).on("click", ".IZaFu", function(e) {
			if($("#session_id").val() == "") {
				swal({	
	        		icon: "warning",
	        		text: "로그인 후 이용해주세요."
		        });
				ReactModalPortal
				return;
			}
			
			var reportType = $("#report_type").val();
			
			if(reportType == "") {
				swal({	
	        		icon: "warning",
	        		text: "신고 사유를 선택해주세요!"
		        });
			} else {
				report();
			}
		});
		
		// 모달창 닫기
		$(document).on("click", ".close", function(e) {
			$(".ReactModalPortal").hide();
		});
		
		
		// 이미지 썸네일
		$(document).on("click", ".PreviewImgListItemImg", function(e) {
			var src = $(this).attr("src");
			$(".MainImgItemImg").attr("src", src);
		});
		
	
		// 공유하기
		$(document).on("click", ".share", function(e) {
			if($('.gXuuDJ').css('display') === 'none'){
				$(".gXuuDJ").show();
			} else{
				$(".gXuuDJ").hide();
			}
			
		});
	});

</script>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
