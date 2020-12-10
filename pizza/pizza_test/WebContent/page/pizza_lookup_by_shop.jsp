<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>지점별 매출 현황</h3>
<table border="1">
 	<tr>
 		<td>지점코드</td>
 		<td>지점명</td>
 		<td>총매출액</td>
 	</tr>
 		<%
 		try {
 			Class.forName("oracle.jdbc.OracleDriver");
 			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
 			
 			Statement stmt = con.createStatement();
 			
 			String query = "SELECT "+
 			"SHOP.SCODE, SHOP.SNAME, SUM(PIZZA.COST * SALELIST.AMOUNT) "+"FROM "+
 			"TBL_SALELIST_01 SALELIST, TBL_SHOP_01 SHOP, TBL_PIZZA_01 PIZZA "+
 			"WHERE "+
 					"SALELIST.SCODE = SHOP.SCODE "+
 			"AND "+"SALELIST.PCODE = PIZZA.PCODE "+
 					"GROUP BY "+
 					"SHOP.SCODE,SHOP.SNAME "+
 					"ORDER BY "+
 							"SCODE asc";
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
 </table>