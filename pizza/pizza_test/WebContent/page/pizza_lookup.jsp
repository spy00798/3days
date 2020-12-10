<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>통합매출조회</h3>
<%@ page import="java.sql.*" %>
 <table border="1">
 	<tr>
 		<td>매출전표번호</td>
 		<td>지점</td>
 		<td>판매일자</td>
 		<td>피자코드</td>
 		<td>피자명</td>
 		<td>판매수량</td>
 		<td>매출액</td>
 	</tr>
 		<%
 		try {
 			Class.forName("oracle.jdbc.OracleDriver");
 			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
 			
 			Statement stmt = con.createStatement();
 			
 			String query = "SELECT "+
 			"SALENO, TBL_SHOP_01.SCODE, SNAME, SALEDATE, TBL_PIZZA_01.PCODE, PNAME, AMOUNT, COST*AMOUNT "+
			"FROM "+
 					"TBL_PIZZA_01, TBL_SALELIST_01, TBL_SHOP_01 "+
 			"WHERE TBL_PIZZA_01.PCODE = TBL_SALELIST_01.PCODE "+
 					"AND "+
 					"TBL_SHOP_01.SCODE = TBL_SALELIST_01.SCODE "+
 							"ORDER BY " +
 		 	                "TBL_SALELIST_01.SALENO ";
 			ResultSet rs = stmt.executeQuery(query);
 		
 			while (rs.next()) {
 				%> 
 					<tr>
 						<td><%=rs.getString(1) %></td>
 						<td><%=rs.getString(2) + "-" + rs.getString(3)  %></td>
 						<td><%=rs.getDate(4) %></td>
 						<td><%=rs.getString(5) %></td>
 						<td><%=rs.getString(6) %></td>
 						<td><%=rs.getString(7) %></td>
 						<td><%=String.format( "\\%,d", rs.getInt(8)) %></td>
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