$(document).ready(function(){
// 위시(좋아요) 기능 설명
// 하트 이미지 클래스 : .WishWishImg
// 하트 이미지 상위 클래스에 data-code라는 속성에
// 해당 물건 코드 할당하기
// id랑 data-code(물건 코드) 있어야 쓸수있음
	$('.WishWishImg').click(function(){
		// .WishWishImg 부모 선택자 "data-code" 속성에 넣어준 item_code를 item_code 변수로 저장
		var $btnWish = $(this)
		var item_code = $(this).parent().attr("data-code");
		console.log(item_code);
		// /clickWish MemberController에 매핑
		$.ajax({
	   		url : 'clickWish',
	   		type : 'POST',
	   		data : {item_code : item_code}
		}).done(function(){
			$btnWish.toggleClass("wish");
			
			if($btnWish.hasClass("wish")){
				  				$btnWish.attr({'src' : 'resources/images/main/ico_heart_off_x3.png',
								alt : '찜하기 완료'
							})	
			}else{
				$btnWish.attr({'src' : 'resources/images/main/ico_heart_on_x3.png',
								alt : '찜하기'
							})
			}
		}).fail(function(){
			alert("ERROR 위시리스트 추가 실패");
		})
	})
})