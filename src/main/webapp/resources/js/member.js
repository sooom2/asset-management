// 다음 주소 API
window.onload = function(){
    document.getElementById("postSearch").addEventListener("click", function(){
       
        new daum.Postcode({
            oncomplete: function(data) { 
                document.getElementById("member_address").value = data.address; // 주소 넣기
                document.querySelector("#member_address_detail").focus(); //상세입력 포커싱
            }
        }).open();
    });
    
    $('input[type="file"]').change(function(){
    	var file = $(this)[0].files[0]
    	$(".previewImg").attr('src', URL.createObjectURL(file))
    })
}
// 입력 검증.
$(document).ready(function(){
	let idStatus = false;
	let nameStatus = false;
	let passwdStatus = false;
	let passwd2Status = false;
	var babyMaxLength = 10;
    var phoneMaxLength = 13;
	
	
	$("form").submit(function() {
		
		 if(!idStatus) {
			swal("아이디를 확인하세요");
			$("#member_id").focus();
			return false;
		}else if(!nameStatus) {
			swal("이름을 확인하세요");
			$("#member_name").focus();
			return false;
		} else if(!passwdStatus) {
			swal("비밀번호를 확인하세요");
			$("#memeber_pw").focus();
			return false;
		} else if(!passwd2Status) {
			swal("비밀번호확인을 확인하세요");
			$("#member_pw2").focus();
			return false;
		} else if($("#member_address1").val() == "") {
			swal("주소를 입력하세요");
			$("#member_address1").focus();
			return false;
		} else if($("#member_address2").val() == "") {
			swal("상세주소를 입력하세요");
			$("#member_address2").focus();
			return false;
		} else if($("#member_bday").val().length != babyMaxLength) {
			swal("생일을 확인해주세요");
			$("#member_bday").focus();
			return false;
		} else if($("#member_tel").val().length != phoneMaxLength) {
			swal("휴대폰 번호를 확인해주세요");
			$("#member_tel").focus();
			return false;
		}
		
		return true;
		
	});
	
	
	// 아이디 검증.
	$("#member_id").on("blur", function() {
		let id = $("#member_id").val();
		
		if(id == "") {
			idStatus = false;
			$("#checkIdResult").html("아이디는 필수 입력 항목입니다").css("color", "red");
			return; 
		} else {
			// 영문자, 숫자, 특수문자 조합 4 ~ 8글자
			let regex = /^[A-Za-z0-9!@#$%]{4,8}$/;
			
			if(!regex.exec(id)) { 
				$("#checkIdResult").html("영문자, 숫자 조합 4 ~ 8글자").css("color", "red");
				idStatus = false;
			} else { 
				$.ajax({
					url: "MemberCheckId", 
					data: {
						id: $("#member_id").val()
					},
					success: function(result) { 
						if(result) {
							$("#checkIdResult").html("이미 사용중인 아이디입니다.").css("color", "red");
							idStatus = false;
						} else {
							$("#checkIdResult").html("사용 가능한 아이디입니다.").css("color", "green");
							idStatus = true;
						}
					}
				}); 
			}
		}
	});
	
	// 비밀번호 검증
	$("#member_pw").on("change", function() {
		let passwd = $("#member_pw").val(); 
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		// 2) 부분 검사 규칙(단, 시작(^) 과 끝($) 을 기술하면 안된다!)
		let engUpperRegex = /[A-Z]/; // 영문 대문자
		let engLowerRegex = /[a-z]/; // 영문 소문자
		let numberRegex = /[0-9]/; // 숫자
		let specRegex = /[!@#$%]/; // 특수문자
		
		if(!lengthRegex.exec(passwd)) {
			$("#checkPasswdResult").html("영문자, 숫자, 특수문자 8 ~ 16자 필수").css("color", "red");
			$("#member_pw").select();
			passwdStatus = false;
		} else {
			// 패스워드 복잡도(부분 검사) 체크를 위해 항목 갯수 카운팅 할 변수 선언
			let count = 0;
			
			// 항목별 검사 후 항목이 일치하는 문자가 있으면 카운트 증가(각각 별도로 비교)
			if(engUpperRegex.exec(passwd)) { count++ }
			if(engLowerRegex.exec(passwd)) { count++ }
			if(numberRegex.exec(passwd)) { count++ }
			if(specRegex.exec(passwd)) { count++ }
			// 카운팅 된 결과값 판별
			// => 4점 : 안전, 3점 : 보통, 2점 : 위험, 1점 이하 : 사용 불가능한 패스워드
			switch(count) {
				case 4 :  
					$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
					passwdStatus = true;
					break;
				case 3 :  
					$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
					passwdStatus = true;
					break;
				case 2 :  
					$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
					passwdStatus = true;
					break;
				case 1 :
				case 0 :
					$("#checkPasswdResult").html("사용 불가능한 패스워드").css("color", "red");break; 
					passwdStatus = false;
					
			}
			
		}
		
	});
	// 비밀번호확인 검증
	$("#member_pw2").on("change", function() {
		if($("#member_pw").val() == $("#member_pw2").val()) {
			$("#checkPasswd2Result").html("비밀번호 일치").css("color", "green");
			passwd2Status = true;
		} else {
			$("#checkPasswd2Result").html("비밀번호 불일치").css("color", "red");
			passwd2Status = false;
		}
	});
		$("#member_pw3").on("change", function() {
		let passwd = $("#member_pw3").val(); 
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		
		if(!lengthRegex.exec(passwd)) {
			$("#checkPasswd2Result").html("영문자, 숫자, 특수문자 8 ~ 16자 필수").css("color", "red");
			$("#member_pw3").select();
			passwdStatus = false;
		} else {
			$("#checkPasswd2Result").html("사용가능한 비밀번호 입니다.").css("color", "green");
			passwdStatus = true;
		}
		
	});
	// 이름 검증
	$("#member_name").on("change", function() {
		let name = $("#member_name").val(); 
		// 한글 2 ~ 5글자
		let regex = /^[가-힣]{2,5}$/;
		
		if(!regex.exec(name)) {
			$("#checkNameResult").html("한글 2 ~ 5자를 입력하세요.").css("color", "red");
			$("#member_name").select(); 
			nameStatus = false;
		} else {
			$("#checkNameResult").html("").css("color", "green");
			nameStatus = true;
		}
	});

	// 생일 입력
	$("#member_bday").on("input", function() {
		var inputValue = $(this).val();
	    var formattedValue = inputValue.replace(/\D/g, '').slice(0, 8);
	    var formattedDate = formattedValue.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
	    
	    $(this).val(formattedDate);
		
	});
	$("#member_tel").on("input", function() {
		var inputValue = $(this).val();
	    var formattedValue = inputValue.replace(/\D/g, '').slice(0, 11);
	    var formattedNumber = formattedValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	    $(this).val(formattedNumber);
	    
  });
});