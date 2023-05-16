<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원정보관리</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<link href="resources/css/inc.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/main.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
window.onload = function(){
    document.getElementById("postSearch").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("member_address1").value = data.address; // 주소 넣기
                document.querySelector("#member_address2").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

function confirmQuit() {
	    // 탈퇴를 처리하는 코드 작성
		  if (confirm("정말로 탈퇴하시겠습니까?")) {
			  document.getElementById("quitPro").submit();
			
	  }
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
					<div class="title-membership">회원정보</div>
					<form method="post" name="form-join2" action="updatePro">
						<div class="wrap-inside">
							<div class="join-detail">
								<label class="label-input" for="id"> <span>아이디</span>
									<input type="text" id="member_id" name="member_id" readonly="readonly"					
									value="${member.member_id}"> <span></span>
								</label>
							</div>

							<div class="join-detail">
								<label class="label-input" for="pass"> <span>기존 비밀번호</span>
									<input type="password" id="member_pw" name="member_pw" class="input" placeholder="정보수정시 비밀번호 입력 필수!!">
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="pass2"> 
								<span>변경하실 비밀번호</span> 
								<input type="password" id="member_pw2" name="member_pw2" class="input" placeholder="암호를 변경하시려면 입력하세요">
								<span></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for="username"> <span>이름</span>
									<input type="text" id="member_name" name="member_name" class="input" value="${member.member_name }" >
									 <span></span>
								</label>
							</div>
							<div class="join-detail">
			                    <label class="label-input" for="phone" style="width:342px;display:inline-block;">
			                        <span>주소</span>
			                        <input type="text" style="width:180px;display:inline-block;"  id="member_address1" name="member_address1"class="input" value="${member.member_address1 }">
			                        <span class="joinCheck"></span>
			                    </label>
			                    <a href="#" class="btnsub btnsms" id="postSearch">주소 검색</a>
			                </div>
							<div class="join-detail" style="margin-top:4px">
								<label class="label-input" for="address"> <span>상세주소</span>
									<input type="text" id="member_address2" name="member_address2" class="input" value="${member.member_address2 }">
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
							
							
						<div class="join-detail">
								<label class="label-input" for=""> <span>선호지점</span>
									<div class="" style="margin-left: 120px; display: block; margin-top: 3px; width: 200px;; height: 30px; overflow: hidden; border: 1px solid #ccc;">
										<!-- selectMemberInfo  -->
										<select name="member_prefer_branch" id="member_prefer_branch"
											style="width: 220px; height: 30px; padding: 0 0 0 10px; box-sizing: border-box; font-size: 16px; line-height: 30px; border-radius: 0; -webkit-appearance: none; appearance: none; -moz-appearance: none; background: url(/images/customer/icon-select-off.png) right 31px center no-repeat; border: none; color: #7d7d7d; vertical-align: top;">
										
											<c:forEach var="cinema" items="${cinemaList }">
											<option value="${cinema.cinema_name }" ${cinema.selected }>${cinema.cinema_name }</option>
											</c:forEach>
										</select>

									</div> <span></span>
								</label>
							</div>
							<div class="join-detail">
								<label class="label-input" for=""> <span>선호장르</span>
									<div class="" style="margin-left: 120px; display: block; margin-top: 3px; width: 200px;; height: 30px; overflow: hidden; border: 1px solid #ccc;">
										<select name="member_prefer_genre" id="member_prefer_genre"
											style="width: 220px; height: 30px; padding: 0 0 0 10px; box-sizing: border-box; font-size: 16px; line-height: 30px; border-radius: 0; -webkit-appearance: none; appearance: none; -moz-appearance: none; background: url(/images/customer/icon-select-off.png) right 31px center no-repeat; border: none; color: #7d7d7d; vertical-align: top;">
											<option value="액션"<c:if test="${member.member_prefer_genre eq '액션'}">selected</c:if>>액션</option>
											<option value="드라마"<c:if test="${member.member_prefer_genre eq '드라마'}">selected</c:if>>드라마</option>
											<option value="코메디"<c:if test="${member.member_prefer_genre eq '코메디' }">selected</c:if>>코메디</option>
											<option value="애니메이션"<c:if test="${member.member_prefer_genre eq '애니메이션' }">selected</c:if>>애니메이션</option>
											<option value="스릴러"<c:if test="${member.member_prefer_genre eq '스릴러' }">selected</c:if>>스릴러</option>
											<option value="로맨스"<c:if test="${member.member_prefer_genre eq '로맨스' }">selected</c:if>>로맨스</option>
											<option value="범죄"<c:if test="${member.member_prefer_genre eq '범죄' }">selected</c:if>>범죄</option>
										</select>
									</div> <span></span>
								</label>
							</div>
						</div>

						<a href=""  id="btn-mypage-ok" class="btn-confirm">
							<button type="submit" style="display: inline-block; width: 300px;text-align: center;">수정</button>
						</a>
				 
					<div class="title-membership title-quit">회원 탈퇴</div>
					<div class="wrap-inside no-border">
						<span class="quit-desc">탈퇴 신청시 환불금액등의 확인 후 탈퇴처리가 진행되며 포인트,
							등록한 관람권 등이 삭제되고 30일 이내 재가입이 불가하오니 신중히 결정해주시기 바랍니다.</span> 
						<a href="" class="btn-quit withdrawmember">
							<button type="submit" formaction="quitPro" onclick="confirmQuit()" style="display: inline-block; width: 300px;text-align: center;">회원 탈퇴하기</button>
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