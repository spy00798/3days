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
 			"SALENO, SCODE, SALEDATE, TBL_PIZZA_01.PCODE, PNAME, AMOUNT, COST*AMOUNT "+
			"FROM "+
 					"TBL_PIZZA_01, TBL_SALELIST_01 "+
 			"WHERE TBL_PIZZA_01.PCODE = TBL_SALELIST_01.PCODE";
 			ResultSet rs = stmt.executeQuery(query);
 		
 			while (rs.next()) {
 				String scode = null;
 				switch(rs.getString(2)) {
 				
 				case "S001":
 					scode = "강남점";
 					break;
 				case "S002":
 					scode = "강서점";
 					break;
 				case "S003":
 					scode = "강동점";
 					break;
 				case "S004":
 					scode = "영동점";
 				case "S005":
 					scode = "시청점";
 				case "S006":
 					scode = "인천점";
 				}
 				%> 
 					<tr>
 						<td><%=rs.getString(1) %></td>
 						<td><%=rs.getString(2) + "-" + scode %></td>
 						<td><%=rs.getDate(3) %></td>
 						<td><%=rs.getString(4) %></td>
 						<td><%=rs.getString(5) %></td>
 						<td><%=rs.getString(6) %></td>
 						<td><%=String.format( "\\%,d", rs.getInt(7)) %></td>
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