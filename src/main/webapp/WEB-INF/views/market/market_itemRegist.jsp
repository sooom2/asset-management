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
<link href="${path }/resources/css/itemRegist.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  var maxImageCount = 5;
	  var fileInput = $('input[type="file"]');
	  var imageList = $('.image_list');
	  var countImg = $('.count_img span');
	  var defaultImage = $('.default');
	  var draggedItem = null;

	  function handleFileSelect(event) {
	    var files = event.target.files;

	    if (files.length + imageList.children().length > maxImageCount) {
	      alert('최대 ' + maxImageCount + '장의 사진만 업로드할 수 있습니다.');
	      fileInput.val('');
	      return;
	    }

	    for (var i = 0; i < files.length; i++) {
	      var file = files[i];

	      if (imageList.children().length >= maxImageCount) {
	        alert('최대 ' + maxImageCount + '장의 사진만 업로드할 수 있습니다.');
	        fileInput.val('');
	        return;
	      }

	      var previewContainer = $('<li>');
	      var img = $('<img>').addClass('item_img').attr('src', URL.createObjectURL(file));

	      var deleteIcon = $('<img>').addClass('img_delete_icon').attr('src', 'https://ccimage.hellomarket.com/img/web/regist/image_delete_x3.png').attr('alt', '상품 썸네일 제거 아이콘');

	      deleteIcon.on('click', function() {
	        var imageContainer = $(this).closest('li');
	        imageContainer.remove();
	        updateImageCount();
	      });

	      var imageBox = $('<div>').addClass('up_img_box');
	      imageBox.append(deleteIcon).append(img);

	      previewContainer.append(imageBox);
	      imageList.append(previewContainer);

	      updateImageCount();
	    }
	  }

	  function updateImageCount() {
	    countImg.text(imageList.children().length);
	  }

	  defaultImage.on('click', function() {
	    fileInput.click();
	  });

	  fileInput.on('change', handleFileSelect);

	  imageList.on('dragstart', 'li', function(event) {
	    draggedItem = $(this);
	    event.originalEvent.dataTransfer.setData('text/plain', '');
	  });

	  imageList.on('dragover', function(event) {
	    event.preventDefault();
	  });

	  imageList.on('drop', function(event) {
	    event.preventDefault();
	    var droppedItem = $(event.target).closest('li');

	    if (draggedItem && imageList.has(draggedItem) && droppedItem && imageList.has(droppedItem)) {
	      var draggedIndex = imageList.children().index(draggedItem);
	      var droppedIndex = imageList.children().index(droppedItem);

	      if (draggedIndex !== droppedIndex) {
	        if (draggedIndex < droppedIndex) {
	          droppedItem.before(draggedItem);
	        } else {
	          droppedItem.after(draggedItem);
	        }

	        updateImageCount();
	      }
	    }

	    draggedItem = null;
	  });
	});


	//태그기능 
document.addEventListener('DOMContentLoaded', function() {
	var tagInput = document.querySelector('.tagTagInput');
	var tagButton = document.querySelector('.tagButton');
	var tagListWrapper = document.querySelector('.ListWrapper');
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

		// 수정된 부분: hidden input의 값을 업데이트
		var hiddenInput = document.querySelector('input[name="item_tag"]');
		hiddenInput.setAttribute('value', tags.join(','));
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

		tagInput.value = '';
		tagInput.focus();
	}

	function removeTag(event) {
		if (event.target.classList.contains('removeIcon')) {
			var index = event.target.getAttribute('data-index');
			tags.splice(index, 1);
			updateTagList();

			// 수정된 부분: hidden input의 값을 업데이트
			var hiddenInput = document
					.querySelector('input[name="item_tag"]');
			hiddenInput.setAttribute('value', tags.join(','));
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

// //파일 인풋 

// var fileInput = document.querySelector('input[type="file"]');

// function handleFileSelect(event) {
// 	var files = event.target.files;

// 	// 파일 선택된 후에 처리할 로직 작성
// 	// 파일 객체(files)를 활용하여 원하는 동작 수행
// }

// fileInput.addEventListener('change', handleFileSelect, false);
</script>


<script>
<!-- 금액 숫자만입력 -->
	document.addEventListener('DOMContentLoaded', function() {
		var priceInput = document.querySelector('.PricePriceInput');

		priceInput.addEventListener('input', function() {
			// 입력된 값에서 숫자가 아닌 문자를 제거합니다
			var numericValue = this.value.replace(/[^\d]/g, '');

			// 천단위 컴마 표시를 추가합니다
			var formattedValue = addCommas(numericValue);

			// 정제된 숫자 값을 다시 입력 상자에 할당합니다
			this.value = formattedValue;
		});

		function addCommas(value) {
			// 세 자리마다 쉼표를 추가하는 함수
			return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
	});
</script>


<!-- 카테고리선택 -->
<style>
.selected {
	font-weight: bold;
	color: #bb2649;
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
	document.addEventListener('DOMContentLoaded', function() {
		// 카테고리 요소들을 선택합니다.
		const items = document.querySelectorAll('.TextTextWrapper');
		// 컬럼의 입력 필드를 선택합니다.

		const input = document
				.querySelector('#item_category input[name="item_category"]');

		// 각 카테고리 요소에 클릭 이벤트를 추가합니다.
		items.forEach(function(item) {
			item.addEventListener('click', function() {
				// 다른 요소들의 선택 상태를 제거합니다.
				items.forEach(function(otherItem) {
					otherItem.classList.remove('selected');
				});

				// 선택한 요소에 클래스를 추가합니다.
				this.classList.add('selected');

				// 선택한 카테고리를 변수에 저장합니다.
				const category = this.textContent;

				// 선택한 카테고리를 저장합니다.
				saveCategory(category);
			});
		});
		//커밋
		// 선택한 카테고리를 저장하는 함수입니다.
		function saveCategory(category) {
			console.log('Category saved:', category);
			input.value = category;
		}
	});
</script>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    // 양식 요소 가져오기
    var form = document.querySelector(".insertItem");

    // 양식에 제출 이벤트 리스너 추가
    form.addEventListener("submit", function(event) {
      // 입력 필드 가져오기
      var titleInput = form.querySelector('input[name="item_subject"]');
      var categoryInput = form.querySelector('input[name="item_category"]');
      var priceInput = form.querySelector('input[name="item_price"]');
      var contentInput = form.querySelector('textarea[name="item_content"]');

      // 입력 필드 유효성 검사
      if (titleInput.value.trim() === "" || categoryInput.value.trim() === "" || priceInput.value.trim() === "" || contentInput.value.trim() === "") {
        // 양식 제출 방지
        event.preventDefault();

        // 오류 메시지 표시 또는 원하는 작업 수행
        alert("필수 항목을 모두 입력해주세요.");
      }
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
			<form class="insertItem" action="itemRegistPro" method="post" enctype="multipart/form-data">
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
									(<span>0</span>/5)
								</div>
								<dd>

									<input type="file" name="file" multiple class="multiple">
									<div role="presentation" tabindex="0">
										<input multiple type="file" tabindex="-1"
											style="display: none;"> <img
											src="https://ccimage.hellomarket.com/img/web/regist/image_camera_x3.png"
											alt="기본 상품 등록 이미지" class="default">
										<ul class="image_list">
										
											<!-- 이미지 미리보기 영역 -->
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
									</div>
								</dd>
							</dl>


							<dl class="regist_title" id="title">
								<dt class="TitleTitleWrapper">
									<label class="Title">상품제목</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<input type="text" name="item_subject" class="title_input"
										placeholder="상품 제목을 입력해주세요" value="">
									<ul class="item_recommend_box"></ul>
								</dd>
							</dl>
							<dl id="item_category"
								class="categoryCategoryWrapper-sc-1qdv6sn-0 cGwZbp">
								<dt class="TitleTitleWrapper">
									<label class="Title">카테고리</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<div class="categoryCategoryBox">
										<div class="ListListWrapper">
											<div class="TextTextWrapper">패션/의류/잡화/뷰티</div>
											<div class="TextTextWrapper">가전제품/모바일/PC</div>
											<div class="TextTextWrapper">가구/인테리어</div>
											<div class="TextTextWrapper">도서/음반/문구/티켓</div>
											<div class="TextTextWrapper">게임/스포츠/취미</div>
											<div class="TextTextWrapper">유아동/반려동물</div>
											<div class="TextTextWrapper">그외기타</div>
										</div>
										<input type="hidden" name="item_category" value="">
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
													name="item_price" placeholder="숫자를 입력해주세요"
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
												<input type="checkbox" id="priceCheckbox"
													name="item_price_offer"> <label for="priceCheckbox">가격
													제안하기</label>
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
									<div class="tagWrapper">
										<img
											src="https://ccimage.hellomarket.com/img/web/regist/tag_icon_x3.png"
											class="tagTagIcon"> <input
											placeholder="태그를 입력해주세요(최대 5개)" class="tagTagInput" value="">
									</div>
									<button class="tagButton">추가</button>
									<div class="ListWrapper"></div>
									<input type="hidden" name="item_tag" value="">
								</dd>
							</dl>
							<dl class="text_area" id="desc">
								<dt class="TitleTitleWrapper">
									<label class="Title">상품설명</label>
									<div class="TitleEssentialMark">*</div>
								</dt>
								<dd>
									<textarea rows="5" class="introduce" name="item_content"
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
							<button class="btn_item_submit" type="submit">상품 등록 완료</button>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
