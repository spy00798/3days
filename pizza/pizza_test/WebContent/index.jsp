<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	<section>
	<%
	String section = request.getParameter("section") != null ? request.getParameter("section") : "";
		switch(section) {
		case "pizza_registration":
		%><%@include file="page/pizza_registration.jsp" %> <%
		break;
		case "pizza_lookup":
		%><%@include file="page/pizza_lookup.jsp" %> <%
		break;
		case "pizza_lookup_by_salelist":
		%><%@include file="page/pizza_lookup_by_salelist.jsp" %> <%
		break;
		case "pizza_lookup_by_shop":
		%><%@include file="page/pizza_lookup_by_shop.jsp" %> <%
		break;
		default:
		%><%@include file="static/index.jsp" %> <%
		break;
		}
	%>
	</section>
	<%@ include file="static/footer.jsp" %>
</body>
</html>
