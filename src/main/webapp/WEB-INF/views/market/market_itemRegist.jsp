<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/itemRegist.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		function handleFileSelect(event) {
			var files = event.target.files;

			var imageList = document.querySelector('.image_list');

			// 기존의 이미지 미리보기를 모두 제거
			imageList.innerHTML = '';

			// 선택한 파일들의 미리보기를 생성하여 추가
			for (var i = 0; i < files.length; i++) {
				var file = files[i];

				// 미리보기 컨테이너를 생성
				var previewContainer = document.createElement('div');
				previewContainer.classList.add('previewContainer');

				// 미리보기 이미지를 생성
				var img = document.createElement('img');
				img.classList.add('previewImage');
				img.src = URL.createObjectURL(file);

				// 파일명을 표시하는 요소를 생성
				var filename = document.createElement('div');
				filename.classList.add('filename');
				filename.textContent = file.name;

				// 미리보기 컨테이너에 이미지와 파일명을 추가
				previewContainer.appendChild(img);
				previewContainer.appendChild(filename);

				// 미리보기 이미지를 이미지 목록에 추가
				imageList.appendChild(previewContainer);
			}
		}

		var fileInput = document.querySelector('input[type="file"]');
		var middleDotTextWrapper = document
				.querySelectorAll('.MiddleDotTextWrapper');
		var defaultImage = document.querySelector('.default');

		middleDotTextWrapper.forEach(function(wrapper) {
			wrapper.addEventListener('click', function() {
				fileInput.click();
			});
		});

		defaultImage.addEventListener('click', function() {
			fileInput.click();
		});

		fileInput.addEventListener('change', handleFileSelect, false);
	});
	
	// 태그기능
	document.addEventListener('DOMContentLoaded', function() {
		var tagInput = document.querySelector('.tagTagInput');
		var tagButton = document.querySelector('.tagButton');
		var tagListWrapper = document.querySelector('.ListWrapper');
		var tagDescContain = document.querySelector('.tagTagDescContain');
		var tagForm = document.getElementById('tag');

		var tags = [];

		function updateTagList() {
			tagListWrapper.innerHTML = '';

			tags.slice(0, 5).forEach(function(tag, index) {
				var tagItem = document.createElement('span');
				tagItem.classList.add('tagItem');
				tagItem.textContent = '#' + tag;

				// X 아이콘 추가
				var removeIcon = document.createElement('span');
				removeIcon.classList.add('removeIcon');
				removeIcon.textContent = 'X';
				removeIcon.setAttribute('data-index', index);
				tagItem.appendChild(removeIcon);

				tagListWrapper.appendChild(tagItem);
			});
		}

		function updateTagDesc() {
			var tagText = tags.slice(0, 5).map(function(tag) {
				return '#' + tag;
			}).join(' ');

			tagDescContain.textContent = tagText;
		}

		function addTag() {
			var tagValue = tagInput.value.trim();

			if (tagValue === '') {
				return;
			}

			if (tags.length >= 5 || tags.includes(tagValue)) {
				tagInput.value = '';
				tagInput.focus();
				return;
			}

			tags.push(tagValue);
			updateTagList();
			updateTagDesc();

			tagInput.value = '';
			tagInput.focus();
		}

		function removeTag(event) {
			if (event.target.classList.contains('removeIcon')) {
				var index = event.target.getAttribute('data-index');
				tags.splice(index, 1);
				updateTagList();
				updateTagDesc();
			}
		}

		tagButton.addEventListener('click', function(event) {
			event.preventDefault();
			addTag();
		});

		tagListWrapper.addEventListener('click', removeTag);

		tagForm.addEventListener('submit', function(event) {
			event.preventDefault();
		});
	});
	
</script>


<!-- 금액 숫자만입력 -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var priceInput = document.querySelector('.PricePriceInput');

		priceInput.addEventListener('input', function() {
			// 입력된 값에서 숫자가 아닌 문자를 제거합니다
			var numericValue = this.value.replace(/[^\d]/g, '');

			// 정제된 숫자 값을 다시 입력 상자에 할당합니다
			this.value = numericValue;
		});
	});
</script>




<!-- 카테고리선택 -->
<style>
.selected {
	font-weight: bold;
	font-size: 18px;
}

/* 태그 아이콘 */
.removeIcon {
	display: inline-block;
	margin-left: 5px;
	font-family: "Arial", sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #999;
	cursor: pointer;
}

/* .removeIcon::before { */
/* 	content: "x"; */
/* } */

.removeIcon:hover {
	color: #ff0000;
}
</style>

<script>
	// JavaScript 코드
	document.addEventListener('DOMContentLoaded', function() {
		var categoryItems = document.querySelectorAll('.TextTextWrapper');

		// 각 카테고리 요소에 클릭 이벤트 추가
		categoryItems.forEach(function(item) {
			item.addEventListener('click', function() {
				// 다른 요소들의 선택 상태 제거
				categoryItems.forEach(function(item) {
					item.classList.remove('selected');
				});

				// 선택한 요소에 클래스 추가
				this.classList.add('selected');
			});
		});
	});
</script>



</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="layoutChildren-sc-1fg0dfe-2 jjXXzz">
		<section class="content">
			<h1>중고거래의 시작 머니또마켓</h1>
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
							<dt class="TitleTitleWrapper">
								<label class="Title">상품 이미지</label>
								<div class="TitleEssentialMark">*</div>
							</dt>
							<div class="count_img">
								(<span>0</span>/10)
							</div>
							<dd>
								<input type="file" multiple="" class="multiple">
								<div role="presentation" tabindex="0">
									<input multiple="" type="file" tabindex="-1"
										style="display: none;"> <img
										src="https://ccimage.hellomarket.com/img/web/regist/image_camera_x3.png"
										alt="기본 상품 등록 이미지" class="default">
									<ul class="image_list">
										<ul class="image_list">
										</ul>
										<div class="UploadGuideBox">
											<div class="MiddleDotTextWrapper">
												<img
													src="https://ccimage.hellomarket.com/img/common/middle_dot.svg"
													alt="중간 도트" class="MiddleDotTextDotImg">
												<div class="MiddleDotText">클릭 또는 이미지를 드래그하여 등록할 수 있어요</div>
											</div>
											<div class="MiddleDotTextWrapper">
												<img
													src="https://ccimage.hellomarket.com/img/common/middle_dot.svg"
													alt="중간 도트" class="MiddleDotTextDotImg">
												<div class="MiddleDotText">드래그하여 상품 이미지 순서를 변경할 수 있어요</div>
											</div>
										</div>
									</ul>
								</div>
							</dd>
						</dl>
						<dl class="regist_title" id="title">
							<dt class="TitleTitleWrapper">
								<label class="Title">상품제목</label>
								<div class="TitleEssentialMark">*</div>
							</dt>
							<dd>
								<input type="text" name="title" class="title_input"
									placeholder="상품 제목을 입력해주세요" value="">
								<ul class="item_recommend_box"></ul>
							</dd>
						</dl>
						<dl id="category"
							class="categoryCategoryWrapper-sc-1qdv6sn-0 cGwZbp">
							<dt class="TitleTitleWrapper">
								<label class="Title">카테고리</label>
								<div class="TitleEssentialMark">*</div>
							</dt>
							<dd>
								<div class="categoryCategoryBox">
									<div class="ListListWrapper">
										<div class="TextTextWrapper">패션의류잡화뷰티</div>
										<div class="TextTextWrapper">가전제품/모바일/PC</div>
										<div class="TextTextWrapper">가구/인테리어</div>
										<div class="TextTextWrapper">도서/음반/문구/티켓</div>
										<div class="TextTextWrapper">게임/스포츠/취미</div>
										<div class="TextTextWrapper">유아동/반려동물</div>
										<div class="TextTextWrapper">그외기타</div>
									</div>
							</dd>
						</dl>
						<dl class="sell_method_box">
							<dt class="TitleTitleWrapper">
								<label class="Title">가격 입력</label>
								<div class="TitleEssentialMark">*</div>
							</dt>
							<dd>
								<div class="box_sell_method box_area">
									<div id="price" class="PricePriceContainer">
										<div class="PricePriceWrapper">
											<img
												src="https://ccimage.hellomarket.com/img/web/regist/price_icon_x3.png"
												class="price_icon" alt="가격 아이콘"> <input type="text"
												name="price" placeholder="숫자를 입력해주세요"
												class="PricePriceInput" value=""
												style="width: 100%; height: 58px;">
										</div>
										<span class="PricePriceDotText">원</span>
									</div>
								</div>
							</dd>
						</dl>
						<dl class="sell_method_box">
							<dt class="TitleTitleWrapper">
								<label class="Title">가격 제안</label>
								<div class="TitleEssentialMark">*</div>
							</dt>
							<dd>
								<div class="box_sell_method box_area">
									<div id="price" class="PricePriceContainer">
										<div class="priceCheckbox">
											<input type="checkbox" id="priceCheckbox"> <label
												for="priceCheckbox">가격 제안하기</label>
										</div>
									</div>
								</div>
							</dd>
						</dl>
						<dl class="regist_tag">
							<dt class="TitleTitleWrapper">
								<label class="Title">태그(선택사항)</label>
							</dt>
							<dd>
								<form id="tag" class="tagTagWrapper">
									<img
										src="https://ccimage.hellomarket.com/img/web/regist/tag_icon_x3.png"
										class="tagTagIcon"> <input
										placeholder="태그를 입력해주세요(최대 5개)" class="tagTagInput" value="">
									<button class="tagButton">추가</button>
								</form>
								<div class="ListWrapper"></div>
								<div class="tagTagDescContain">
									<div class="MiddleDotText">
										<div class="MiddleDotTextText">하나의 태그는 최대 10자까지 입력할 수
											있습니다.</div>
									</div>
									<div class="MiddleDotText">
										<div class="MiddleDotTextText">검색과 검색 광고 등에 사용됩니다.</div>
									</div>
									<div class="MiddleDotText">
										<div class="MiddleDotTextText">상품과 관련없는 태그를 입력할 경우 상품
											노출의 제재를 받을 수 있습니다.</div>
									</div>
								</div>
							</dd>
						</dl>
						<dl class="text_area" id="desc">
							<dt class="TitleTitleWrapper">
								<label class="Title">상품설명</label>
								<div class="TitleEssentialMark">*</div>
							</dt>
							<dd>
								<textarea rows="5" class="introduce"
									placeholder="상품의 상태를 정확하게 알 수 있는 정보를 꼭 포함해 주세요!   (최대 2,500자)"></textarea>
							</dd>
						</dl>

					</div>
				</div>
				<div class="item_submit_box">
					<div class="item_area_submit_box">
						<a href="main">
							<button class="btn_item_cancel" type="button">취소</button>
						</a>
						<button class="btn_item_submit" type="button">상품 등록 완료</button>
					</div>
				</div>
			</div>
		</section>
	</div>



	<jsp:include page="../footer.jsp" />
</body>
</html>