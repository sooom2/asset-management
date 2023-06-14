<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link href="${path }/resources/css/member.css" rel="stylesheet" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
window.onload = function(){
	
	 swal("비밀번호 변경하기를 원하시는 경우\n 비밀번호 확인란에 새 비밀번호를 입력해주세요.");
	
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
		      }).then((quitResult) = >{
		    	  if(quitResult){
		    		  $("#quitPro").submit()
		    	  }
		      })
		    }
	  	});
	}


$(function(){
   

	let idStatus = false;
	let nameStatus = false;
	let passwdStatus = false;
	let passwd2Status = false;
	var babyMaxLength = 10;
    var phoneMaxLength = 13;
	
	
	$("form").submit(function() {
		
		if(!passwdStatus) {
			swal("비밀번호를 확인하세요");
			$("#memeber_pw").focus();
			return false;
		} else if(!passwd2Status) {
			swal("비밀번호 오류입니다.");
			$("#member_pw3").focus();
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
					$("#checkPasswdResult").html("안전").css("color", "green"); 
					passwdStatus = true;
					break;
				case 3 :  
					$("#checkPasswdResult").html("보통").css("color", "yellow"); 
					passwdStatus = true;
					break;
				case 2 :  
					$("#checkPasswdResult").html("위험").css("color", "orange"); 
					passwdStatus = true;
					break;
				case 1 :
				case 0 :
					$("#checkPasswdResult").html("사용 불가능한 패스워드").css("color", "red"); break;
					passwdStatus = false;
			}
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
			passwd2Status = false;
		} else {
			$("#checkPasswd2Result").html("사용가능한 비밀번호 입니다.").css("color", "green");
			passwd2Status = true;
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

</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="container">
		<div id="content">
			<div class="section group section-member" id="memberInfo">
				<div class="title-membership">회원정보 관리</div>
				<div class="wrap-member-box wrap-membership-box">
					<div class="title-membership">회원정보 수정</div>
					<form method="post" name="form-join2" action="memberUpdatePro" enctype="multipart/form-data">
						
						<div class="wrap-inside">
							<div class="profile_edit_image">
								<label class="profile_edit_image_box" id="upFile">
									<img src="${member.member_image }" alt="프로필 이미지" class="previewImg">
									<img src="https://ccimage.hellomarket.com/img/web/member/edit_camera.svg" alt="프로필 사진 등록 이미지">
									<input type="file" class="pf_img" name="file" id="upFile" accept="image/jpeg, image/png">
								</label>
							</div>
						
							<div class="join-detail">
								<label class="label-input" for="id"> <span>닉네임</span>
									<input type="text" id="member_nickname" name="member_nickname" 		
									value="${member.member_nickname}"> <span></span>
								</label>
							</div>

							<div class="join-detail">
								<label class="label-input" for="pass"> <span>기존 비밀번호</span>
									<input type="password" id="member_pw" name="member_pw" class="input" placeholder="정보수정시 비밀번호를 입력해주세요.">
								</label>
								<span id="checkPasswdResult" class="joinCheck"></span>
							</div>
							
							<div class="join-detail">
								<label class="label-input" for="pass2"> 
								<span>비밀번호 확인</span> 
								<input type="password" id="member_pw3" name="member_pw3" class="input" placeholder="비밀번호를 입력해주세요.">
								<span></span>
								</label>
								<span id="checkPasswd2Result" class="joinCheck"></span>
							</div>
							<div class="join-detail">
								<label class="label-input" for="username"> <span>이름</span>
									<input type="text" id="member_name" name="member_name" class="input" value="${member.member_name }"  readonly="readonly">
									 <span></span>
								</label>
							</div>
							<div class="join-detail">
			                    <label class="label-input" for="phone" style="width:342px;display:inline-block;">
			                        <span>주소</span>
			                        <input type="text" style="width:180px;display:inline-block;"  id="member_address" name="member_address"class="input" value="${member.member_address }"
			                        readonly="readonly">
			                        <span class="joinCheck"></span>
			                    </label>
			                    <a href="#" class="btnsub btnsms" id="postSearch">주소 검색</a>
			                </div>
							<div class="join-detail" style="margin-top:4px">
								<label class="label-input" for="address"> <span>상세주소</span>
									<input type="text" id="member_address_detail" name="member_address_detail" class="input" value="${member.member_address_detail }">
									<span class="joinCheck"></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="email"> <span>이메일</span>
									<input type="text" id="member_email" name="member_email" class="input" readonly="readonly"
									value="${member.member_email }"> <span></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="bday"> <span>생년월일</span>
									<input type="text" id="member_bday" name="member_bday"
									class="input input-numeric" value="${member.member_bday}"
									placeholder="예) 20170101"> <span></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="phone"> <span>휴대폰번호</span>
									<input type="text" id="member_tel" name="member_tel"
									class="input input-numeric" value="${member.member_tel }"> <span></span>
								</label>
							</div>
						</div>
						<a href=""  id="btn-mypage-ok" class="btn-confirm">
							<button type="submit" style="display: inline-block; width: 300px;text-align: center;">수정</button>
						</a>
				 
					<div class="title-membership title-quit">회원 탈퇴</div>
					<div class="wrap-inside no-border">
						<span class="quit-desc">탈퇴 신청시 작성한 게시글과 댓글은 지워지지않으며
							남은 머니가 사라지고 사용한 아이디로 재가입이 불가하오니 신중히 결정해주시기 바랍니다.
						</span> 
						<a href="" class="btn-quit withdrawmember">
							<button type="submit"  id ="quitPro" onclick="confirmQuit()" formaction="memberQuitPro" style="display: inline-block; width: 300px;text-align: center;">회원 탈퇴하기</button>
						</a>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>