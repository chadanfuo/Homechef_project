<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>추천 메뉴</title>
</head>
<body>
오늘의 <span id="city">${city }</span> 날씨는<br>
<%-- <jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="HH" var="hour" /> --%>
<p>${hour}</p>
<c:if test="${hour<12}">
${weather.amimg }<br>
${weather.amdes }<br>
${weather.amtemp }<br>
${weather.amrain }<br>
</c:if>
<c:if test="${hour>=12}">
${weather.pmimg }<br>
${weather.pmdes }<br>
${weather.pmtemp }<br>
${weather.pmrain }<br>
</c:if>
<p>오늘의 추천메뉴</p>
${category.division_num}
<a href="${pageContext.request.contextPath }/rcp/list?sorting=readCount&cateNum=${category.division_num}">${category.division_name}</a>


</body>
</html>