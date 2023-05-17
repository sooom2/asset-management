<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/itemRegist.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	
	
	<div class="layout__Children-sc-1fg0dfe-2 jjXXzz">
	<section class="content"><h1>세컨웨어 - 현명한 사람들의 패션 중고거래 (구 헬로마켓)</h1>
		<h2>상품 등록 페이지</h2>
		<div class="regist_main_area">
			<div class="regist_top">
				<div class="regist_box_top">
					<div>상품 등록</div>
				</div>
				<div class="regist_box_sub">
					<span>*필수항목</span>은 꼭 입력해주세요
				</div>
			</div>
			<div class="regist_box">
				<div class="description">
					<dl class="regist_image_dl" id="images_box">
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">상품 이미지</label>
							<div class="Title__EssentialMark-dmi4ru-2 cIXlAU">*</div>
						</dt>
						<div class="count_img">
							(<span>0</span>/10)
						</div>
						<dd>
							<input type="file" multiple="" class="multiple">
							<div role="presentation" tabindex="0">
								<input multiple="" type="file" tabindex="-1" style="display: none;">
								<img src="https://ccimage.hellomarket.com/img/web/regist/image_camera_x3.png" alt="기본 상품 등록 이미지" class="default">
								<ul class="image_list">
									<ul class="image_list">
									</ul>
									<div class="Upload__GuideBox-vzsrl-0 kTqLQC">
										<div class="MiddleDotText__Wrapper-sc-1mu8vre-0 ccGEle">
											<img src="https://ccimage.hellomarket.com/img/common/middle_dot.svg" alt="중간 도트" class="MiddleDotText__DotImg-sc-1mu8vre-1 eGfiee">
											<div class="MiddleDotText__Text-sc-1mu8vre-2 jjLAvp">클릭 또는 이미지를 드래그하여 등록할 수 있어요</div>
										</div>
										<div class="MiddleDotText__Wrapper-sc-1mu8vre-0 ccGEle">
											<img src="https://ccimage.hellomarket.com/img/common/middle_dot.svg" alt="중간 도트" class="MiddleDotText__DotImg-sc-1mu8vre-1 eGfiee">
											<div class="MiddleDotText__Text-sc-1mu8vre-2 jjLAvp">드래그하여 상품 이미지 순서를 변경할 수 있어요</div>
										</div>
									</div>
								</ul>
							</div>
						</dd>
					</dl>
					<dl class="regist_title" id="title">
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">상품제목</label>
							<div class="Title__EssentialMark-dmi4ru-2 cIXlAU">*</div>
						</dt>
						<dd>
							<input type="text" name="title" class="title_input" placeholder="상품 제목을 입력해주세요" value="">
							<ul class="item_recommend_box"></ul>
						</dd>
					</dl>
					<dl id="category" class="category__CategoryWrapper-sc-1qdv6sn-0 cGwZbp">
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">카테고리</label>
							<div class="Title__EssentialMark-dmi4ru-2 cIXlAU">*</div>
						</dt>
						<dd>
							<div class="category__CategoryBox-sc-1qdv6sn-1 bedVtV">
								<div class="List__ListWrapper-sc-1u039ow-0 cjKPpN"><div class="Text__TextWrapper-easj65-0 kiSEHd">여성 의류</div>
									<div class="Text__TextWrapper-easj65-0 kiSEHd">남성 의류</div>
									<div class="Text__TextWrapper-easj65-0 kiSEHd">가방</div>
									<div class="Text__TextWrapper-easj65-0 kiSEHd">신발</div>
									<div class="Text__TextWrapper-easj65-0 kiSEHd">패션잡화</div>
									<div class="Text__TextWrapper-easj65-0 kiSEHd">키즈</div>
									<div class="Text__TextWrapper-easj65-0 kiSEHd">라이프</div>
									<div class="Text__TextWrapper-easj65-0 kiSEHd">기타</div>
								</div>
								<div class="List__ListWrapper-sc-1u039ow-0 IizqB"></div>
							</div>
							<div class="category__PickCategory-sc-1qdv6sn-6 gmuWDQ"></div>
							<div class="MobileCategory__MobileCategoryWrapper-sc-1vuk5mp-0 jkOkZp">
								<div class="MobileCategory__CategoryBox-sc-1vuk5mp-1 jwRosb">
									<div class="MobileCategory__InitialCateogryName-sc-1vuk5mp-2 ckNCUg">카테고리를 선택해주세요</div>
<!-- 									<img src="https://ccimage.hellomarket.com/img/web/regist/arrow_right.svg" alt="arrow" class="MobileCategory__NextMark-sc-1vuk5mp-5 yrioE"> -->
								</div>
							</div>
						</dd>
					</dl>
					<dl class="regist_condition" id="condition">
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">상품컨디션</label>
							<div class="Title__EssentialMark-dmi4ru-2 cIXlAU">*</div>
						</dt>
						<dd>
							<div class="itemStatus_description">판매할 상품의 컨디션을 선택해 주세요!</div>
							<ul class="item_status_list">
								<li class="item_status">
									<div class="text_wrapper">새 상품(미개봉)</div>
								</li>
								<li class="item_status">
									<div class="text_wrapper">거의 새상품</div>
								</li>
								<li class="item_status">
									<div class="text_wrapper">사용감 있는 깨끗한 상품</div>
								</li>
								<li class="item_status">
									<div class="text_wrapper">사용 흔적이 많이 있는 상품</div>
								</li>
							</ul>
						</dd>
					</dl>
					<dl class="sell_method_box">
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">가격 입력</label>
							<div class="Title__EssentialMark-dmi4ru-2 cIXlAU">*</div>
						</dt>
						<dd>
							<div class="box_sell_method box_area">
								<div id="price" class="Price__PriceContainer-sc-160p5xs-0 kRLBoR">
									<div class="Price__PriceWrapper-sc-160p5xs-1 eeIDfH">
										<img src="https://ccimage.hellomarket.com/img/web/regist/price_icon_x3.png" class="price_icon Price__PriceImg-sc-160p5xs-2 cABIrJ" alt="가격 아이콘">
										<input type="text" name="price" placeholder="숫자를 입력해주세요" class="Price__PriceInput-sc-160p5xs-3 dHybRK" value="" style="width: 100%; height: 58px;">
									</div>
									<span class="Price__PriceDotText-sc-160p5xs-5 kKoWPv">원</span>
								</div>
							</div>
						</dd>
					</dl>
					<dl class="regist_tag">
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">태그(선택사항)</label>
						</dt>
						<dd>
							<form id="tag" class="tag__TagWrapper-sc-737ir4-0 gXwkHI">
								<img src="https://ccimage.hellomarket.com/img/web/regist/tag_icon_x3.png" class="tag__TagIcon-sc-737ir4-1 gjJvry">
								<input placeholder="태그를 입력해주세요(최대 5개)" class="tag__TagInput-sc-737ir4-2 duhFIX" value="">
								<button class="tag__Button-sc-737ir4-3 eWgqai">추가</button>
							</form>
							<div class="List__Wrapper-sc-77i2q1-0 ejOMKw"></div>
							<div class="tag__TagDescContain-sc-737ir4-4 iVQeKB">
								<div class="MiddleDotText__Wrapper-sc-1mu8vre-0 ccGEle">
									<img src="https://ccimage.hellomarket.com/img/common/middle_dot.svg" alt="중간 도트" class="MiddleDotText__DotImg-sc-1mu8vre-1 eGfiee">
									<div class="MiddleDotText__Text-sc-1mu8vre-2 jjLAvp"> 하나의 태그는 최대 10자까지 입력할 수 있습니다.</div>
								</div>
								<div class="MiddleDotText__Wrapper-sc-1mu8vre-0 ccGEle">
									<img src="https://ccimage.hellomarket.com/img/common/middle_dot.svg" alt="중간 도트" class="MiddleDotText__DotImg-sc-1mu8vre-1 eGfiee">
									<div class="MiddleDotText__Text-sc-1mu8vre-2 jjLAvp"> 검색과 검색 광고 등에 사용됩니다.</div>
								</div>
								<div class="MiddleDotText__Wrapper-sc-1mu8vre-0 ccGEle">
									<img src="https://ccimage.hellomarket.com/img/common/middle_dot.svg" alt="중간 도트" class="MiddleDotText__DotImg-sc-1mu8vre-1 eGfiee">
									<div class="MiddleDotText__Text-sc-1mu8vre-2 jjLAvp"> 상품과 관련없는 태그를 입력할 경우 상품 노출의 제재를 받을 수 있습니다.</div>
								</div>
							</div>
						</dd>
					</dl>
					<dl class="text_area" id="desc">
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">상품설명</label>
							<div class="Title__EssentialMark-dmi4ru-2 cIXlAU">*</div>
						</dt>
						<dd>
							<textarea rows="5" class="introduce" placeholder="상품의 상태를 정확하게 알 수 있는 여러 장의 상품사진과 구입연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요! 문의를 줄이고 더 쉽게 판매할 수 있어요. (최대 2,500자)">
							</textarea>
						</dd>
					</dl>
					<dl>
						<dt class="Title__TitleWrapper-dmi4ru-0 bgOTQt">
							<label class="Title-dmi4ru-1 jttSce">배송 방법</label>
							<div class="Title__EssentialMark-dmi4ru-2 cIXlAU">*</div>
						</dt>
						<dd class="parcel_box">
							<div class="parcel_info_intro">
								<div class="parcel__ParcelNoticeBox-e91l75-0 NdgdY">
									<div class="parcel__Text-e91l75-1 bDUWFw">배송 방법을 선택해주세요</div>
									<img src="https://ccimage.hellomarket.com/img/web/regist/arrow_right.svg" alt="arrow" class="parcel__ArrowImg-e91l75-2 fWsLxb">
								</div>
							</div>
						</dd>
					</dl>
				</div>
			</div>
			<div class="item_submit_box">
				<div class="item_area_submit_box"><a href="/">
					<button class="btn_item_cancel" type="button">취소</button></a>
					<button class="btn_item_submit" type="button">상품 등록 완료</button>
				</div>
			</div>
		</div>
	</section>
	</div>
	
	
	
	<jsp:include page="../footer.jsp" />
</body>
</html>