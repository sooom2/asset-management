<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머니머니머니또</title>
<link href="${path }/resources/css/socialBook.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<link href="${path }/resources/css/main.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style type="text/css">
.tabcontent {
	display: none;
}

.tabcontent.on {
	display: block;
}

.ddday{
    display: inline-block;
    background: #bb2649;
    color: white;
    padding: 12px;
    border-radius: 50%;
    font-size: 13px;
    font-weight: 400;
    box-shadow: 1px 1px 3px 1px rgb(0 0 0 / 43%);
    margin-top: 98px;
    margin-left: 170px;
    text-align: center;
    width: 60px;
    height: 60px;
}
</style>
<script type="text/javascript">
$(function() {
	$('ul.accountBookSel li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.accountBookSel li').removeClass('on');
		$('.tabcontent').removeClass('on');
		$(this).addClass('on');
		$('#' + activeTab).addClass('on');
	})
});
</script>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div id="account_container">
		<div id="account_contents" class="">
		<!-- inner-wrap -->
			<div class="inner-wrap">
				<a href="chatPage">생성후채팅방</a>
				<div class="accountBook_top">
					<h2 class="tit" style="display: inline-block;">소셜 가계부</h2>
					<div class="accountLoad"><a href=""><i class="fas fa-list" aria-hidden="true"></i>&nbsp;머니또방 생성</a></div>
				</div>
				<ul class="accountBookSel">
					<li class="on" data-tab="tab1"><a href="#">머니또 모집</a></li>
					<li data-tab="tab2"><a href="#">머니또 참여</a></li>
					<li data-tab="tab3"><a href="#">머니또 종료</a></li>
				</ul>
			<div style="background-color: #f4f4f4;">
			<div class="section group chall-board">
				<div class="challenge_list_wrap">
					<div class="top">
						<div class="challenge_title">소셜가계부</div>
					</div>
				</div>
				
				<!-- Tab  -->
				<div id="tab1" class="tabcontent on">
				<ul class="pickedContentContainer">
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div class="ddday">
									시작<br>D-10
								</div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[소비방]</div>
								<div class="con_tit">한달에 100000만원쓰기~~</div>
								<div class="con_detail">
									<div class="con_price"><span class="won">&nbsp;</span><span>2023.05.16 ~ 2024.05.16</span></div>
									<div class="con_price"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
								</div>
							</div>
							<a href="" class="clickArea">대화방바로가기</a>
						</div>
					</li>
					<li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div class="ddday">
									시작<br>D-10
								</div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[소비방]</div>
								<div class="con_tit">한달에 100000만원쓰기~~</div>
								<div class="con_detail">
									<div class="con_price"><span class="won">&nbsp;</span><span>2023.05.16 ~ 2024.05.16</span></div>
									<div class="con_price"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
								</div>
							</div>
							<a href="" class="clickArea">대화방바로가기</a>
						</div>
					</li><li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div class="ddday">
									시작<br>D-10
								</div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[소비방]</div>
								<div class="con_tit">한달에 100000만원쓰기~~</div>
								<div class="con_detail">
									<div class="con_price"><span class="won">&nbsp;</span><span>2023.05.16 ~ 2024.05.16</span></div>
									<div class="con_price"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
								</div>
							</div>
							<a href="" class="clickArea">대화방바로가기</a>
						</div>
					</li><li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div class="ddday">
									시작<br>D-10
								</div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[소비방]</div>
								<div class="con_tit">한달에 100000만원쓰기~~</div>
								<div class="con_detail">
									<div class="con_price"><span class="won">&nbsp;</span><span>2023.05.16 ~ 2024.05.16</span></div>
									<div class="con_price"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
								</div>
							</div>
							<a href="" class="clickArea">대화방바로가기</a>
						</div>
					</li><li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div class="ddday">
									시작<br>D-10
								</div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[소비방]</div>
								<div class="con_tit">한달에 100000만원쓰기~~</div>
								<div class="con_detail">
									<div class="con_price"><span class="won">&nbsp;</span><span>2023.05.16 ~ 2024.05.16</span></div>
									<div class="con_price"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
								</div>
							</div>
							<a href="" class="clickArea">대화방바로가기</a>
						</div>
					</li><li class="pickedContent">
						<div class="landingPickWrap">
							<div class="contentImage" style="background-image: url(&quot;https://financialshopping-cdn.banksalad.com/large-png_2023_TOP_7_850e6299f6.png&quot;);">
								<div class="ddday">
									시작<br>D-10
								</div>
							</div>
							<div class="contentBox">
								<div  class="con_period">[소비방]</div>
								<div class="con_tit">한달에 100000만원쓰기~~</div>
								<div class="con_detail">
									<div class="con_price"><span class="won">&nbsp;</span><span>2023.05.16 ~ 2024.05.16</span></div>
									<div class="con_price"><i class="fas fa-user"></i>&nbsp;4/5<span>명</span></div>
								</div>
							</div>
							<a href="" class="clickArea">대화방바로가기</a>
						</div>
					</li>
				</ul>
			</div>
			
			<div id="tab2" class="tabcontent">
			</div>
			
			<div id="tab3" class="tabcontent">
			</div>
			
			
			
		</div>
		</div>
				
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>