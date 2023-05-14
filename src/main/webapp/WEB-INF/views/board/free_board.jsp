<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>머니또</title>
</head>
<link href="${pageContext.request.contextPath }/resources/css/inc.css" rel="stylesheet">
<!-- 상단 -->
<link href="${pageContext.request.contextPath }/resources/css/sub.css"
	rel="stylesheet">
<!-- 본문 -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script src="resources/js/jquery-3.6.4.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
<script type="text/javascript">

function search(idx) {
	idx = parseInt(idx);
	document.querySelector("input[name=pageNum]").value = (Number(idx)+1);
	document.querySelector("input[name=startNum]").value = Number(idx)*10;
	document.querySelector("input[name=endNum]").value = (Number(idx)+1)*10 - Number(idx)*10;
	let form = document.querySelector('#iForm');
	form.action = 'one_list';
	form.method = 'post';
	form.submit();
}

// function goDetail(table_name, code) {
// 	document.querySelector("input[name=table_name]").value = table_name;
// 	document.querySelector("input[name=code]").value = code;
// 	let form = document.querySelector('#iForm');
// 	form.action = 'one_detail';
// 	form.method = 'post';
// 	form.submit();
// }

//비밀번호 입력 모달창
function goDetail(table_name, code){
	document.querySelector("input[name=table_name]").value = table_name;
	document.querySelector("input[name=code]").value = code;
	let dis = document.querySelector(".modal-type2");
	if(dis.style.display="none"){
		dis.style.display="block"
	} else{
		dis.style.display="none";
	}
}
// 비밀번호 입력 모달창 닫기
function modalClose(){
	 $('.modal-type2').hide();
	 $("#resultArea").html("");
}

function chkPasswd() {
// 	document.querySelector("input[name=table_name]").value = table_name;
// 	document.querySelector("input[name=code]").value = code;
	let code = document.querySelector("input[name=code]").value;
	let table_name = document.querySelector("input[name=table_name]").value;
// 	debugger;
// 	var lost_code = $("#lost_subject > a").attr("data-code");
// var result;
// 	cosole.log($("#table_name") + $("#code"));
	$.ajax({
		url: 'one_detail_pro',
		type: 'POST',
// 		async : false,
// 		dataType: "json",
		dataType: "text",
		data: {
			code : code,
			table_name : table_name,
			passwd : $("#passwd").val(),
			memberName : "${paramMap.memberName}",
			memberTel : ${paramMap.memberTel},
			memberEmail :"${paramMap.memberEmail}"
		},
		success : function(result) {
			console.log(result);
// 			return "location.href='lost_detail'";
			
			if(result == "true") {
// 				alert(result);
				let url = 'one_detail?code=' + code + "&table_name=" + table_name + "&memberName=" + "${paramMap.memberName}" + "&memberTel=" + "${paramMap.memberTel}" + "&memberEmail=" + "${paramMap.memberEmail}";
				location.replace(url);
			} else {
				console.log($(this).find("#resultArea"));
				$("#passwd").val("").focus();
				$("#resultArea").html("비밀번호가 틀렸습니다").css('color', 'red');
				
			}
		}
		
	})
	
}

</script>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container has-lnb">

		<div class="inner-wrap">
			<div id="contents">
			<form id="iForm">
				<h2 class="tit">내가 문의한 내역</h2>

				<div class="board-list-util">
					<p class="result-count">
						<strong>전체 <em class="font-gblue">${paramMap.totalCnt == null ? 0 : paramMap.totalCnt}</em>건
						</strong>
					</p>

					<div class="dropdown bootstrap-select">
						<div class="form-floating mb-3 mb-md-0 selectbox">
							<div class="cinema_name">
								<select name="rep_board" onchange="" style="margin-top: 0px; !important">
									<option value="전체" <c:if test="${paramMap.rep_board eq '전체'}">selected</c:if>>전체</option>
									<option value="답변완료" <c:if test="${paramMap.rep_board eq '답변완료'}">selected</c:if>>답변완료</option>
									<option value="미답변" <c:if test="${paramMap.rep_board eq '미답변'}">selected</c:if>>미답변</option>
								</select>
							</div>
						</div>
					</div>

					<div class="board-search">
						<input type="text" id="searchTxt" name="searchKeyword" title="검색어를 입력해 주세요."
							placeholder="검색어를 입력해 주세요." class="input-text" value="${paramMap.searchKeyword}"
							maxlength="15">
						<button type="button" id="searchBtn" class="btn-search-input" onclick="search('0');">검색</button>
					</div>
				</div>

				<div class="table-wrap">
					<table class="board-list">
						<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
						<colgroup>
							<col style="width: 72px;">
							<col style="width: 133px;">
							<col style="width: 95px;">
							<col>
							<col style="width: 116px;">
						</colgroup>
						<thead>
							<tr style="line-height: 38px">
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">문의유형</th>
								<th scope="col">제목</th>
								<th scope="col">답변상태</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<input type="hidden" name="memberName" value="${paramMap.memberName}">
							<input type="hidden" name="memberTel" value="${paramMap.memberTel}">
							<input type="hidden" name="memberEmail" value="${paramMap.memberEmail}">
							<input type="hidden" name="startNum" value="${paramMap.startNum}">
							<input type="hidden" name="endNum" value="${paramMap.endNum}">
							<input type="hidden" name="pageNum" value="${paramMap.pageNum}">
							<input type="hidden" name="table_name" value="">
							<input type="hidden" name="code" value="">
							<c:forEach var="oneBoard" items="${oneBoardList }" >
								<tr data-index="0">
									<td>${oneBoard.rownum }</td>
									<td>${oneBoard.cinema_name }</td>
									<td>${oneBoard.question_type }</td>
									<td id="one_subject"><a
										href="javascript:goDetail('${oneBoard.table_name}','${oneBoard.code}')">${oneBoard.subject }</a>
									</td>
									<td>${oneBoard.rep_board }</td>
									<td>${oneBoard.write_date }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!-- 글 조회 비밀번호 입력 모달창 -->
					<div class="modal modal-type2" id="chkPasswd" tabindex="-1" style="display: none;" align="left">
						<div class="modal-dialog" style="max-width: 400px; margin-top: 322.5px;">
							<div class="modal-content">
								<div class="modal-header">
									<h3 class="tit">
										비밀번호 입력
									</h3>
									<button type="button" class="close-modal"  onclick="modalClose()">닫기</button>
								</div>
								<div class="modal-body">
<!-- 									<p>글 작성시 입력한 비밀번호를 입력해주세요.</p> -->
<!-- 									<input type="password" id="passwd" title="비밀번호 입력" class="input-text w250px"> -->
<!-- 									<p class="font-red mt10 mb0" style="display: none;">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</p> -->
									<h3 class="h3-member">글 작성시 입력한 비밀번호를 입력해주세요.</h3>
									<div class="inp-box1 mb20">
										<input type="password" id="passwd" name="passwd" class="inp-member onlyNumber" placeholder="비밀번호를 입력해주세요">
									</div>
									<div id="resultArea"></div>
								</div>
								<div class="modal-bottom flex">
									<button type="button" class="btn-modal1" onclick="modalClose()">취소</button>
									<button type="button" class="btn-modal2" onclick="chkPasswd()">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 글 조회 비밀번호 입력 모달창 -->

				<!-- pagination -->
				<nav class="pagination">
					<c:if test="${1 < paramMap.pageNum }">
						<a title="처음 페이지 보기" href="javascript:search('0')" class="control first" pagenum="1">first</a>
						<a title="이전 페이지 보기" href="javascript:search('${paramMap.pageNum-2}')" class="control prev" pagenum="1">prev</a>
					</c:if>
					<c:forEach begin="${paramMap.pageNum-paramMap.pageNum%10}" end="${(paramMap.totalCnt == null ? 1 : paramMap.totalCnt/10) + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}" varStatus="status">
						<c:choose>
							<c:when test="${paramMap.pageNum eq status.index+1}">
								<strong class="active">${status.index+1}</strong>
							</c:when>
							<c:otherwise>
								<a title="${status.index+1}페이지보기" href="javascript:search('${status.index}')" pageNum="${status.index+1}">${status.index+1}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${paramMap.totalCnt > 10*paramMap.pageNum }">
						<a title="이후 페이지 보기" href="javascript:search('${paramMap.pageNum}')" class="control next" pagenum="11">next</a> 
						<a title="마지막 페이지 보기" href="javascript:search('${paramMap.totalCnt/10 + (paramMap.totalCnt%10> 0 ? 1 : 0) -1}')" class="control last" pagenum="586">last</a>
					</c:if>
				</nav>
				<!--// pagination -->
			</form>	
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>