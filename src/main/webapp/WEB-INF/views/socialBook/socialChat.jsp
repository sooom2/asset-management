<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<script src="https://kit.fontawesome.com/b2ab45b73f.js" crossorigin="anonymous"></script>
<link href="${path }/resources/css/socialBook.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="fullScreen" style="background-color: #ececec">
		<div style="width: 40%;background-color: #eee;display: inline-block;height: 100%;">ddd</div>
		<div class="chat">
		<div id="chat-body">
            <!-- 설정바(최소화, 닫기 버튼 등) -->
            <div class="setting_bar">
                <i class="icon-window-minimize" alt="최소화버튼" title="최소화"></i>
                <i class="icon-window-maximize" alt="최대화버튼" title="최대화"></i>
                <i class="icon-cancel" alt="닫기버튼" title="닫기"></i>
            </div>
            <!-- 알림, 메뉴 기능 -->
            <div class="main-menu">
                <i class="icon-bell" title="알림"></i>
                <i class="icon-ellipsis" title="메뉴"></i>
            </div>
            <!-- 프로필 사진, 프로필명 -->
            
                <!-- 고정된 공지사항 영역 -->
<!--                 <div class="notice-bar"> -->
<!--                     <i class="icon-bullhorn"></i> -->
<!--                     <span></span> -->
<!--                     <i class="icon-down-open-big"></i> -->
<!--                 </div> -->
               	 <!-- 채팅 내용 시작 -->
               	 <div class="chat-content">
                    <!-- 메시지 시작 날짜 -->
	                    <div class="date-line">
	                        <time datetime="2021-03-29">2021년 3월 29일 월요일</time>
	                    </div>
	                    <!-- 채팅 내용 -->
	                    <div class="main-chat">
	                        <div class="friend-chat">
	                            <img class="profile-img" src="/moneytto/resources/images/chat/default.png" alt="쀼프로필사진">
	                            <div class="friend-chat-col">
	                                <span class="profile-name">test1</span>
	                                <span class="balloon">test중중중</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                            </div>
	                            <time datetime="07:30:00+09:00">오전 7:30</time>
	                        </div>
	                        <div class="me-chat">
	                            <div class="me-chat-col">
	                                <span class="balloon">ㅇㅋ</span>
	                            </div>
	                            <time datetime="07:32:00+09:00">오전 7:32</time>
	                        </div>
	                        
	                        <div class="friend-chat">
	                            <img class="profile-img" src="/moneytto/resources/images/chat/default.png" alt="쀼프로필사진">
	                            <div class="friend-chat-col">
	                                <span class="profile-name">test1</span>
	                                <span class="balloon">test중중중</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                            </div>
	                            <time datetime="07:30:00+09:00">오전 7:30</time>
	                        </div>
	                        <div class="me-chat">
	                            <div class="me-chat-col">
	                                <span class="balloon">ㅇㅋ</span>
	                            </div>
	                            <time datetime="07:32:00+09:00">오전 7:32</time>
	                        </div>
	                        
	                        <div class="friend-chat">
	                            <img class="profile-img" src="/moneytto/resources/images/chat/default.png" alt="쀼프로필사진">
	                            <div class="friend-chat-col">
	                                <span class="profile-name">test1</span>
	                                <span class="balloon">test중중중</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                            </div>
	                            <time datetime="07:30:00+09:00">오전 7:30</time>
	                        </div>
	                        <div class="me-chat">
	                            <div class="me-chat-col">
	                                <span class="balloon">ㅇㅋ</span>
	                            </div>
	                            <time datetime="07:32:00+09:00">오전 7:32</time>
	                        </div>
	                        
	                        <div class="friend-chat">
	                            <img class="profile-img" src="/moneytto/resources/images/chat/default.png" alt="쀼프로필사진">
	                            <div class="friend-chat-col">
	                                <span class="profile-name">test1</span>
	                                <span class="balloon">test중중중</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                            </div>
	                            <time datetime="07:30:00+09:00">오전 7:30</time>
	                        </div>
	                        <div class="me-chat">
	                            <div class="me-chat-col">
	                                <span class="balloon">ㅇㅋ</span>
	                            </div>
	                            <time datetime="07:32:00+09:00">오전 7:32</time>
	                        </div>
	                        <div class="friend-chat">
	                            <img class="profile-img" src="/moneytto/resources/images/chat/default.png" alt="쀼프로필사진">
	                            <div class="friend-chat-col">
	                                <span class="profile-name">test1</span>
	                                <span class="balloon">test중중중</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                                <span class="balloon">안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어안녕안녕안녕안뇽옹오오오어어어</span>
	                            </div>
	                            <time datetime="07:30:00+09:00">오전 7:30</time>
	                        </div>
	                        <div class="me-chat">
	                            <div class="me-chat-col">
	                                <span class="balloon">ㅇㅋ</span>
	                            </div>
	                            <time datetime="07:32:00+09:00">오전 7:32</time>
	                        </div>
	                        
	                        
	                        
	                        
	                    </div>
	                </div>
              	  <!-- 채팅 입력창 -->
	                <div class="insert-content">
	                    <form name="chatform" action="#" method="post">
	                        <textarea name="chat-insert" required=""></textarea>
	                        <input type="submit" class="chat-submit" value="전송">
	                    </form>
	                    <!-- 채팅 입력 관련 기능(파일 첨부, 캡쳐 등) -->
	                    <div class="insert-menu">
	                        <i class="fa-regular fa-face-smile"></i>
	                       	<i class="fa-solid fa-paperclip"></i>
	                    </div>
	                </div>
                </div>
        </div>
	</div>
</body>
</html>