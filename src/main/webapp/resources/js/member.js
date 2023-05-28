function confirmQuit() {
	event.preventDefault()
	 swal({
		    title: "회원 탈퇴를 하시겠습니까?",
		    text: "탈퇴시 회원정보가 삭제됩니다.\n 동일한 ID로 가입하실 수 없습니다.",
		    icon: "warning",
		    buttons: {
		      confirm: {
		        text: "탈퇴하기",
		        value: true,
		        visible: true,
		        className: "",
		        closeModal: true,
		      },
		      cancel: {
		        text: "취소",
		        value: false,
		        visible: true,
		        className: "",
		        closeModal: true,
		      },
		    },
		  }).then((confirmResult) => {
		    if (confirmResult) {
		      swal({
		        title: "정말로 회원 탈퇴를 하시겠습니까?",
		        text: "탈퇴시 회원정보가 삭제됩니다.\n 동일한 ID로 가입하실 수 없습니다.",
		        icon: "warning",
		        buttons: {
		          cancel: {
		            text: "취소",
		            value: false,
		            visible: true,
		            className: "",
		            closeModal: true,
		          },
		          confirm: {
		            text: "탈퇴하기",
		            value: true,
		            visible: true,
		            className: "",
		            closeModal: true,
		          },
		        },
		      }).then((finalResult) => {
		        if (finalResult) {
		          swal("정상적으로 탈퇴 되었습니다!");
		          $("form").attr("action","memberQuitPro").submit();
		        }
		      });
		    }
	  	});
	}
// 입력 검증.
$(document).ready(function(){
	let idStatus = false;
	let nameStatus = false;
	let passwdStatus = false;
	let passwd2Status = false;
	
	
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
				$("#checkIdResult").html("영문자, 숫자, 특수문자 조합 4 ~ 8글자").css("color", "red");
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
		
		if(!lengthRegex.exec(passwd)) {
			$("#checkPasswdResult").html("영문자, 숫자, 특수문자 8 ~ 16자 필수").css("color", "red");
			$("#member_pw").select();
			passwdStatus = false;
		} else {
			$("#checkPasswdResult").html("사용가능한 비밀번호 입니다.").css("color", "green");
			passwdStatus = true;
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
			$("#checkNameResult").html("사용 가능한 이름 입니다.").css("color", "green");
			nameStatus = true;
		}
	});
	
});