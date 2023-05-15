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
<title>머니또관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
					
					<!-- 무비 -->
					<div class="sb-sidenav-menu-heading">ACCOUNTBOOK</div>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#movie" aria-expanded="false" aria-controls="movie">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 가계부관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="movie" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_movie_register">소셜가계부관리</a>
							</nav>
						</div>
						<div class="collapse" id="movie" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_movie_register">오픈채팅관리</a>
							</nav>
						</div>
						<div class="collapse" id="movie" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_movie_register">신고관리</a>
							</nav>
						</div>
						
						<!-- board -->
						<div class="sb-sidenav-menu-heading">BOARD</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#boardMgm" aria-expanded="false" aria-controls="boardMgm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 게시판 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="boardMgm" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								<a class="nav-link" href="admin_notice_board"> 공지사항</a>
								<a class="nav-link" href="admin_oneOnOne">자유게시판</a>
								<a class="nav-link" href="admin_notice_board"> 챗봇</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">MEMBER</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#storeMgm" aria-expanded="false" aria-controls="storeMgm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="storeMgm" aria-labelledby="" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_item_pay">-</a>
							</nav>
						</div>
						<!-- lnb -->
					</div>
				</div>
			</nav>
		</div>
</body>
</html>