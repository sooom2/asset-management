<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member.css">
<link href="${path }/resources/css/main_mobile.css" rel="stylesheet">
<link href="${path }/resources/css/market_mobile.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">


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


<div class="layout__Header-sc-1fg0dfe-0 iSTjqT" style="background-color: #BB2649">
			<div class="TopNavigation__Wrapper-sc-6acoe4-0 iqcBld" style="border-bottom: 1px solid #2f2f2f; ">
				<div class="menu2" style=" display: inline-block;margin-left:5px;margin-top:2px; font-size: 2vh;padding: 27px 10px;color: #fff!important; ">
					<a href="main"><div style="display: inline-block;height: 30px;"><img src="${path }/resources/images/header/mobile_logo.png" style="height: 46px;    margin-bottom: 10px;"></div></a>
					<div class="menu" style=" display: inline-block;    margin-right: 15px; color: #fff">
						<a href="auctionMain" style="color: #fff">경매</a>
					</div>
					<div class="menu" style=" display: inline-block;margin-right: 15px;color: #fff">
						<a href="market_list" style="color: #fff">중고거래</a>
					</div>
					<div class="menu" style=" display: inline-block;margin-right: 15px;color: #fff">
						<a href="commBoard" style="color: #fff">커뮤니티</a>
					</div>
					<div class="menu" style=" display: inline-block;color: #fff ">
						<a href="noticeList" style="color: #fff">공지사항</a>
					</div>
				</div>
				<div class="jCbMwE" style=" margin-top:25px;display: inline-block;margin-right:15px; float: right; padding: 6px;color: #fff ">
					
						
				<c:choose>
					<c:when test="${empty sessionScope.sId }">
						<a href="memLogin_mobile" style="color: #fff;font-size: 45px"><i class="fa-regular fa-circle-user"></i></a>	
					</c:when>
					<c:otherwise>
						<a href="todayAlarm" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-regular fa-bell"></i></a>
						<a href="marketChat" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-regular fa-comment-dots fa-flip-horizontal" ></i></a>
						<a href="logout" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-right-from-bracket"></i></a>
						<c:if test="${sessionScope.sId ne 'admin' }">
							<a href="itemRegist" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-boxes-packing"></i></a>
						</c:if>
						<c:if test="${sessionScope.sId eq 'admin' }">
						<a href="admin" style="color: #fff;margin-right:15px;  font-size: 40px"><i class="fa-solid fa-screwdriver-wrench"></i></a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			</div>
		</div>	
	
	
	<div class="member mem-login" style="margin-left: 155px;">
		<div class="list-tabs">
			<a href="memLogin" class="active" style="font-size: 30px;">회원 로그인</a>
<!-- 			<a href="guestRsv">비회원 예매 및 확인</a> -->
		</div>

		<div class="tabs-cont">
			<div class="cont">
				<form id="loginForm"  action ="loginPro" method="post">
					<div class="find" style="width: 601px;">
					<a href="findId" style="font-size: 20px">아이디/비밀번호 찾기</a>
					<a href="memAuth" style="font-size: 20px">회원가입</a>
					</div>
					<div class="member-detail">
                      <label class="label-input" for="memberid" style="width: 600px; height: 60px;"><span style="font-size: 20px;   line-height: 60px;">아이디</span><input type="text" id="memberid" class="input" name="member_id" value="" placeholder="아이디를 입력해주세요" style="font-size: 20px;  line-height: 39px;    margin-top: 10px;"><span></span></label>
                    </div>
					<div class="member-detail">
                      <label class="label-input" for="memberpasswd"  style="width: 600px; height: 60px;"><span style="font-size: 20px;   line-height: 60px;">패스워드</span><input type="password" id="memberpw" class="input" name="member_pw" value="" placeholder="비밀번호를 입력해주세요"  style="font-size: 20px;  line-height: 39px;    margin-top: 10px;"><span></span></label>
                    </div>
					<div class="etc">
						<label><input type="checkbox" id="SaveID" class="checkbox"><em></em><span style="font-size: 20px">아이디 저장</span></label>
						</div>
					<button type="submit" class="btn-type0" style="    width: 590px;height:50px;   font-size: 25px;">로그인</button>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>