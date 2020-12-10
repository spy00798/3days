<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
String saleno = request.getParameter("saleno");
String scode = request.getParameter("scode");
String sale_date = request.getParameter("sale_date");
String pcode = request.getParameter("pcode");
String amount = request.getParameter("amount");

try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		Statement stmt = con.createStatement();
		
		String query = "INSERT INTO TBL_SALELIST_01c";
		ResultSet rs = stmt.executeQuery(query);
	
		while (rs.next()) {
			%> 
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=String.format("\\%,d", rs.getInt(3)) %></td>
				</tr>
			
			<%
		
		}
		stmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>