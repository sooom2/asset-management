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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${path }/resources/js/member.js"></script>
<script>
window.onload = function(){
    document.getElementById("postSearch").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("member_address").value = data.address; // 주소 넣기
                document.querySelector("#member_address_detail").value = "";
                document.querySelector("#member_address_detail").focus(); //상세입력 포커싱
            }
        }).open();
    });
    swal("비밀번호 변경하기를 원하시는 경우\n 비밀번호 확인란에 새 비밀번호를 입력해주세요.");

}

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
									<img src="https://ccimage.hellomarket.com/img/web/common/empty_profile.svg" alt="머니또의 프로필 이미지">
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