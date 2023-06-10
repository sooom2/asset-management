$(document).ready(function(){
	$('.WishWishImg').click(function(){
		
		event.preventDefault();
		// .WishWishImg 부모 선택자 "data-code" 속성에 넣어준 item_code를 item_code 변수로 저장
		var $btnWish = $(this)
		var item_code = $(this).closest(".item").attr("data-cd");
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
			alert("로그인 후 이용할 수 있습니다.");
		})
	})
})