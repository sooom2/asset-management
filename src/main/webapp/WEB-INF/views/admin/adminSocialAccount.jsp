<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>머니또관리자페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${path }resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${path }/resources/js/jquery-3.6.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${path }/resources/js/admin.js"></script>
<script type="text/javascript">

$(function () {
    $('.modal').draggable({
      handle: ".justify-content-center"
    });
 });

function doLatest() {
	let dis = document.querySelector(".admin-modal-latest");
	if (dis.style.display = "none") {
		dis.style.display = "block"
	} else {
		dis.style.display = "none";
	}
}

function doMovieRegister(){
	let dis = document.querySelector(".admin-modal-register");
	if (dis.style.display = "none") {
		dis.style.display = "block"
	} else {
		dis.style.display = "none";
	}
}

function modalClose() {
	$("form")[0].reset();
	let dis = document.querySelector(".admin-modal-register");
	let dis2 = document.querySelector(".admin-modal-latest");
// 	let dis3 = document.querySelector(".admin-modal-modify");
	dis.style.display = "none";
	dis2.style.display = "none";
// 	dis3.style.display = "none";
	
	
}

$(function(){
	$("form").submit(function(){
		
		if($("#info_movie_code").val() == null || $("#info_movie_code").val() == ""){
			alert("영화 코드를 확인해주세요.")
			return false;
		}
		
		if($("#info_rating").val() == null || $("#info_rating").val() == ""){
			console.log("관람등급을 확인해주세요.")
			return false;
		}
		
	});	
})


//이미지올리기
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

 
		var files = targetObj.files;
		
		
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			alert(prevImg);
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '170px'; 
			img.style.height = '210px';
			preview.appendChild(img);
			
			alert(targetObj.files.name);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			}
		}
}

</script>


</head>
<body>
		<jsp:include page="admin_nav_top.jsp" />
	<div id="layoutSidenav">
		<!-- 고정  -->
		<jsp:include page="admin_nav_side.jsp" />
		
		<!-- 고정 -->

		<div id="layoutSidenav_content">
			<!-- 들어갈내용 -->
			<main>
				<!-- 영화등록모달 -->
				<div class="container modal admin-modal-register" style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header">
									<button type="button" class="close-modal" onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">영화코드로 조회</h3>
									<input type="text" name="movieCdSearch" id="movieCdSearch">
								 <input onclick="movieCdSearch()"type="button" value="검색">
								</div>
								<div class="card-body">
									<form action="registMoviePro">
									<div class="row mb-4">
                                   		<div class="col-md-3 moviePoster">
                                       		<div id='View_area' style='position:relative; height: 210px; dispaly: inline;'></div>
                                        </div>
                                        
                                        <div class="col-md-8">
											<div class="filebox">
										    <input type="file" name="profile_pt" id="profile_pt" class="upload-name" onchange="previewImage(this,'View_area')">
											</div>
											
                                        </div>
                                        
                                        	
                                     </div>
									
										
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_movie_code"class="form-control" id="info_movie_code" type="text" value="" />
													<label for="info_movie_code">영화코드</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating">
													<input name="info_movie_title" class="form-control" id="info_movie_title" type="text" /> 
													<label for="info_movie_title">영화제목</label>
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating">
													<input name="info_year" class="form-control" id="info_year" type="text"/>
													<label for="info_year">제작년도</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_time" class="form-control" id="info_time" type="" />
													<label for="info_time">상영시간</label>
												</div>
											</div>
										</div>
										<!-- 04.22 추가 -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating">
													<input class="form-control" id="info_rating" name="info_rating" type="text" value=""/>
													<label for="info_rating">관람등급</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="info_genre" name="info_genre" type="text" value="" />
													<label for="info_genre">장르</label>
												</div>
											</div>
										</div>
										<!--  -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_showdate" class="form-control" id="info_showdate" type="date"/>
													<label for="info_showdate">상영일</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_enddate" class="form-control" id="info_enddate" type="date" />
													 <label for="info_enddate">종영일</label>
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md">
												<div class="form-floating mb-3 mb-md-0">
													<input name="info_story" class="form-control" id="info_story" type="text" style="max-width: 100%"/>
													<label for="inputFirstName">줄거리</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="d-grid">
												<input class="btn btn-primary btn-block" type="submit" value="등록"> 
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="container modal admin-modal-latest"	style="display: none">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card border-1 mt-5">
								<div class="card-header" style="text-align: center">
									<button type="button" class="close-modal" onclick="modalClose()" style="border: none;">닫기</button>
									<h3 class="text-center font-weight-light my-4">최신영화등록</h3>
									<span>최신개봉 영화 목록 고르기</span><br><br>
									<select id="api" name="api"> </select>
								 <input onclick="apibutton()"type="button" value="검색">	
								</div>
								<div class="card-body">
									<div class="container">
										<div class="content">
											<div class="subscribe">
												<div class="motto">
													<form action="registMoviePro" >
														<div class="row mb-4">
					                                      	<h6 style="text-align:left"></h6>
					                                   		<div class="col-md-3 moviePoster">
					                                       		<div id='View_area' class="poster" style='position:relative; height: 210px; dispaly: inline;'>
					                                       		</div>
					                                        </div>
					                                        
					                                        <div class="col-md-8">
																<div class="filebox">
															    <input type="file" name="profile_pt" id="profile_pt" class="upload-name" onchange="previewImage(this,'View_area')">
																</div>
					                                        </div>
					                                     </div>
										                                     
														<div class="row mb-3">
															<div class="col-md-6">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_movie_code" name="info_movie_code" type="text" value="" />
																	<label for="info_movie_code">영화코드</label>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-floating">
																	<input class="form-control" id="info_movie_title" name="info_movie_title" type="text" value="" /> 
																	<label for="info_movie_title">영화제목</label>
																</div>
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-md-6">
																<div class="form-floating">
																	<input class="form-control" id="info_year" name="info_year" type="text" value=""/>
																	<label for="info_year">제작년도</label>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_time" name="info_time" type="text" value="" />
																	<label for="info_time">상영시간</label>
																</div>
															</div>
														</div>
														<!-- 04.22 추가 -->
														<div class="row mb-3">
															<div class="col-md-6">
																<div class="form-floating">
																	<input class="form-control" id="info_rating" name="info_rating" type="text" value=""/>
																	<label for="info_rating">관람등급</label>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_genre" name="info_genre" type="text" value="" />
																	<label for="info_genre">장르</label>
																</div>
															</div>
														</div>
														<!--  -->	
														<div class="row mb-3">
															<div class="col-md-6">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_showdate" name="info_showdate" type="date" value="2023-02-23"/>
																	<label for="info_showdate">상영일</label>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_enddate" name="info_enddate" type="date" value="" />
																	 <label for="info_enddate">종영일</label>
																</div>
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-md">
																<div class="form-floating mb-3 mb-md-0">
																	<input class="form-control" id="info_story" name="info_story" type="text" style="max-width: 100%"/>
																	<label for="info_story">줄거리</label>
																</div>
															</div>
														</div>
														<div class="row mb-3">
															<div class="col-md">
																<div class="form-floating mb-3 mb-md-0">
																	<select class="form-control" id="info_status" name="info_status"  style="max-width: 100%">
																		<option value="screening">현재상영중</option>
																		<option value="comming">상영예정</option>
																		<option value="end">상영종료</option>
																		<option value="reScreening">재상영</option>
																	</select>
																	<label for="info_status">상영상태</label>
																</div>
															</div>
														</div>
														<!-- hidden 영역 -->
														<input type="hidden" name = "info_director">
														<input type="hidden" name = "info_nation">
														<input type="hidden" name = "info_movie_poster">
														<!-- hidden 영역 -->
														<div class="row">
															<div class="d-grid">
																<input class="btn btn-primary btn-block" type="submit" value="등록"> 
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- 테이블 -->
				<div class="datatable-container">
					<h3 class="text-center font-weight-light my-4">소셜가계부 관리</h3>
					<input class="btn btn-block btn-more" type="button" value="소셜가계부 관리" onclick="doMovieRegister()"> 
					<table id="datatablesSimple" class="datatable-table">
						<thead>
							<tr>
								<th data-sortable="true" style="width: 8%;"><a href="" class="datatable-sorter">가계부코드</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="" class="datatable-sorter">가계부이름</a></th>
								<th data-sortable="true" style="width: 8%;"><a href="#" class="datatable-sorter">Account#</a></th>
								<th data-sortable="true" style="width: 15%;"><a href="" class="datatable-sorter">Account#</a></th>
								<th data-sortable="true" style="width: 8%;"><a href=""	class="datatable-sorter">Account#</a></th>
								<th data-sortable="true" style="width: 8%;"><a href=""	class="datatable-sorter">Account#</a></th>
								<th data-sortable="true" style="width: 8%;"><a href=""	class="datatable-sorter">Account#</a></th>
								<th data-sortable="true" style="width: 8%;"><a href=""	class="datatable-sorter">Account#</a></th>
								<th data-sortable="true" style="width: 10%;"><a href="#" class="">수정/삭제</a></th>
							</tr>
						</thead>
						<!-- 영화목록 -->
						<c:forEach var="movie" items="${movieList }">
						<tbody>
							<tr style="text-align: center;" data-index="0">
								<td>${movie.get("info_movie_code") }</td>
								<td>${movie.get("info_movie_title") }</td>
								<td>${movie.get("info_status") }</td>
								<td id="info_story">${movie.get("info_story") }</td>
								<td>${movie.get("info_year") }</td>
								<td>${movie.get("info_time") }</td>
								<td>${movie.get("info_showdate") }</td>
								<td>${movie.get("info_enddate") }</td>
<%-- 								<td><img alt="" src="${movie.get('info_movie_poster') }"></td> --%>
								<td class="modi">
										 			 
								<input onclick="location.href='selectMovie?info_movie_code=${movie.get('info_movie_code')}'" class="btn btn-block btn-more" type="button" value="M O R E">
<!-- 								</a> -->
								</td>
							</tr>
						</tbody>
						</c:forEach>
	
					</table>
				</div>
				<!-- 테이블 -->

			</main>

			<!--들어갈내용 -->

			<!-- 푸터 -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; IMOVIE 2023</div>
						<div></div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
