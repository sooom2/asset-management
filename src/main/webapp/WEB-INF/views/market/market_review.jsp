<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.4.js"></script>
<title>Insert title here</title>
<style type="text/css">

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
*{
	font-style: Pretendard-Regular;
}
body{
	margin: 0;
    background: #fffffa;;
}

.star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size: 40px;
  justify-content:space-around;
  padding: 1px 2.2em;
  text-align:center;
  width: 148px;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}
.selected-emoji{
	font-size: 95px;
}
/* explanation */
article{
	margin: 0 auto;
	
}
.con{
    width: 400px;
    height: 399px;
    display: block;
    }
.review{
	/* margin: 0 auto; */
	text-align: center;
	padding: 20px 40px;
}

h2{
	font-family: 
}

.emoji_container{
	display: inline-block;
	width: 150px;
	height: 130px;
}
.reviewBtn {
	position: absolute;
	width: 65px;
	height: 73px;
	background: #bb2649;
	border: none;
	font-size: 15px;
	margin-top: 10px;
	color: #fff;
	display: inline-block;
	border-radius: 5px;

}

.review_area{
	height: 90px;
	width: 326px;
	background-color: #fff;
	border: 1px solid #9a9a9a;
	outline:none;
}

.textArea{height: 82px;width: 249px;border: none; display: inline-block;margin-left: -73px;outline: none; resize: none;}

</style>
</head>
</head>
<script type="text/javascript">
	$(function() {
		$(".star-rating label").on("click", function() {
			// 선택된 별점 값을 가져옵니다.
			var ratingValue = $(this).prev('input').val();

			// 이전에 추가된 이모지를 제거합니다.
			$(".selected-emoji").remove();

			// 선택된 별점 값에 따라 이모지를 추가합니다.
			var emoji = '';
			switch (ratingValue) {
				case '5':
					emoji = '😍';
					break;
				case '4':
					emoji = '🤩';
					break;
				case '3':
					emoji = '🤔';
					break;
				case '2':
					emoji = '😑';
					break;
				case '1':
					emoji = '&#128545';
					break;
				default:
					emoji="";
					break;
			}

			// 이모지를 추가합니다.
			$(".star-rating").after('<span class="selected-emoji">' + emoji + '</span>');
		});
		
		
		$("form").submit(function(){
			
			if($("review_type") == 'update'){
				
				if(confirm("이미 등록된 리뷰가 있습니다. 수정 하시겠습니까?")){
							
				}
				history.back();	
				
			}
// 			window.close();
		});
		
		
		
	});
</script>

<body>
	<div class="con">
		<form class="review" action="reviewRegist" method="POST">
		  	<div class="star-rating">
				<input type="radio" id="5-stars" name="rating" value="5" />
				<label for="5-stars" class="star">&#9733;</label>
				<input type="radio" id="4-stars" name="rating" value="4" />
				<label for="4-stars" class="star">&#9733;</label>
				<input type="radio" id="3-stars" name="rating" value="3" />
				<label for="3-stars" class="star">&#9733;</label>
				<input type="radio" id="2-stars" name="rating" value="2" />
				<label for="2-stars" class="star">&#9733;</label>
				<input type="radio" id="1-star" name="rating" value="1" />
				<label for="1-star" class="star">&#9733;</label>
			</div>
			<h2>거래는 어떠셨나요?</h2>
			<div class="review_area">
				<textarea rows="3" cols="2" class="textArea" name="review_content"></textarea>
				<input type="hidden" name="item_code"value="${item.item_code }">
				<input type="hidden" name="target_id"value="${item.sell_id }">
				<input type="hidden" name="reviewer_id"value="${item.buy_id }">
				<input type="hidden" name="review_type"value="${review_type }">
				<input type="submit" class="reviewBtn" value="등록">
			</div>
		</form>
	</div>
</body>
</html>