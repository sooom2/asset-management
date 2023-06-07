<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>머니머니또관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
					<!-- board -->

						<div class="sb-sidenav-menu-heading">ACCOUNT</div>
							<a class="nav-link" href="adminAccount">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 계좌관리
						</a>
						<div class="sb-sidenav-menu-heading">TRADE</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#tradeMgm" aria-expanded="false" aria-controls="tradeMgm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 
							거래관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="tradeMgm" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="adminNoticeBoard">중고거래</a>
								<a class="nav-link" href="adminAuction">경매관리</a>
								<a class="nav-link" href="adminFreeBoard">오픈채팅</a>
							</nav>
						</div>
						
						<div class="sb-sidenav-menu-heading">BOARD</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#boardMgm" aria-expanded="false" aria-controls="boardMgm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 
							게시판관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="boardMgm" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="adminNoticeBoard"> 공지사항</a>
								<a class="nav-link" href="adminFreeBoard">커뮤니티</a>
							</nav>
						</div>					
					<!-- 경매 -->
					
						<div class="sb-sidenav-menu-heading">MEMBER</div>
						<a class="nav-link collapsed" href="adminMember">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원관리
						</a>
						<!-- 중고거래 -->
					<div class="sb-sidenav-menu-heading">ETC</div>
						<a class="nav-link" href="adminChatBot">
							<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>챗봇
						</a>
						<a class="nav-link" href="adminReport">
							<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>신고관리
						</a>
						<!-- lnb -->
					</div>
				</div>
			</nav>
		</div>
</body>
</html>	