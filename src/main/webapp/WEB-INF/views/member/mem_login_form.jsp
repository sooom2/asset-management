<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<link href="resources/css/inc.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">

// 카카오 로그인
Kakao.init('bf0c05681627cc5d65f40192f843de1b'); 
Kakao.isInitialized(); 
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
		       	console.log(response)
		       	var accessToken = Kakao.Auth.getAccessToken();
		       	Kakao.Auth.setAccessToken(accessToken);
		       	var account = response.kakao_account;
					
				$('#form-kakao-login input[name=email]').val(account.email);
				$('#form-kakao-login input[name=name]').val(account.profile.nickname);
				$('#form-kakao-login input[name=gender]').val(account.gender);
				$('#form-kakao-login input[name=accessToken]').val(accessToken);
				// 사용자 정보가 포함된 폼을 서버로 제출.
				document.querySelector('#form-kakao-login').submit();
        	  
        	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }




// 아이디 저장
$(function() {
	
	var userInputId = getCookie("userInputId");// 쿠기값 가져오기
    $("#memberid").val(userInputId); 
     
	// 쿠키 있을 시, 저장하기 체크 상태
    if($("#memberid").val() != ""){ 
                                           
        $("#SaveID").attr("checked", true); 
    }
     
    $("#SaveID").change(function(){ 
        if($("#SaveID").is(":checked")){ 
            var userInputId = $("#memberid").val();
            setCookie("userInputId", userInputId, 7); // 7일 보관
        }else{ 
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우
    $("#memberid").keyup(function(){ 
        if($("#SaveID").is(":checked")){ 
            var userInputId = $("#memberid").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
    
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
	
    
    
    
});
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="member mem-login">
		<div class="list-tabs">
			<a href="memLogin" class="active">회원 로그인</a>
<!-- 			<a href="guestRsv">비회원 예매 및 확인</a> -->
		</div>

		<div class="tabs-cont">
			<div class="cont">
				<form id="loginForm"  action ="loginPro" method="post">
					<div class="find">
					<a href="findId">아이디/비밀번호 찾기</a>
					<a href="memAuth">회원가입</a>
					</div>
					<div class="member-detail">
                      <label class="label-input" for="memberid"><span>아이디</span><input type="text" id="memberid" class="input" name="member_id" value="" placeholder="아이디를 입력해주세요"><span></span></label>
                    </div>
					<div class="member-detail">
                      <label class="label-input" for="memberpasswd"><span>패스워드</span><input type="password" id="memberpw" class="input" name="member_pw" value="" placeholder="비밀번호를 입력해주세요"><span></span></label>
                    </div>
					<div class="etc">
						<label><input type="checkbox" id="SaveID" class="checkbox"><em></em><span>아이디 저장</span></label>
						</div>
					<button type="submit" class="btn-type0">로그인</button>
				</form>
					<div class="orther-login">
						<p class="tit"><span><strong>간편로그인</strong></span></p>
						<div class="btns">
							<span onclick="kakaoLogin();">
							<a href="#" class="btn-kakao"><img src="resources/images/member/ico_kakao.png"></a>
							</span>
							<span>
							<a id="naverIdLogin_loginButton" href="javascript:void(0)" class="btn-naver"><img src="resources/images/member/ico_naver.png"></a>
							</span>
						</div>
					</div>
				</div>
		<form id="form-kakao-login" method="post" action="kakaoLogin">
   			<input type="hidden" name="email"/>
   			<input type="hidden" name="name"/>
   			<input type="hidden" name="gender"/>
   			<input type="hidden" name="accessToken"/>
   		</form>
   		<form id="form-naver-login" method="post" action="naver">
   			<input type="hidden" name="email"/>
   			<input type="hidden" name="name"/>
   		</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>