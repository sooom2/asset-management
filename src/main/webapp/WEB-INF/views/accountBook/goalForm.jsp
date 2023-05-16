<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path }/resources/css/goal.css" rel="stylesheet">
<link href="${path }/resources/css/accountBook.css" rel="stylesheet">
<link href="${path }/resources/css/inc.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body id=goal>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="accountBookTop.jsp"></jsp:include>
	
	   <h1>목표 금액 및 저축 계획</h1>
    
    <%-- 입력 폼 --%>
    <form method="post" action="goalPro" id=goalForm>
      <label for="goalAmount">목표 금액:</label>
        <input type="number" name="goalAmount" id="goalAmount" required><br>
        
        <label for="endDate">저축 기한:</label>
        <input type="date" name="endDate" id="endDate" required><br>
        
        <input type="submit" value="계산">
    </form>
    
    <%-- 결과 출력 --%>
    <%-- 입력이 있을 경우에만 계산--%>
    <% if (request.getParameter("goalAmount") != null && request.getParameter("endDate") != null) {
        int goalAmount = Integer.parseInt(request.getParameter("goalAmount"));
        String endDateStr = request.getParameter("endDate");
        java.util.Date endDate = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
        java.util.Date currentDate = new java.util.Date();
        
        long duration = endDate.getTime() - currentDate.getTime();
        int daysRemain = (int) (duration / (24 * 60 * 60 * 1000));
        int weeksRemain = daysRemain / 7;
        int dailySave = goalAmount / daysRemain;
        int weeklySave = goalAmount / weeksRemain;
        int monthlySave = goalAmount / (weeksRemain / 4);
    %>
        <h2>목표 금액: <%= goalAmount %> 원</h2>
        <h2>저축 기한: <%= endDateStr %></h2>
        <h2>남은 일 수: <%= daysRemain %> 일</h2>
        <h2>일일 저축 금액: <%= dailySave %> 원</h2>
        <h2>주간 저축 금액: <%= weeklySave %> 원</h2>
        <h2>월간 저축 금액: <%= monthlySave %> 원</h2>
    <% } %>
    
	<jsp:include page="../footer.jsp" />
</body>
</html>