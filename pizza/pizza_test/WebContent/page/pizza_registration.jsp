<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert_pizza" method="" name="action_form">
		<table>
			<tr>
				<td>매출전표번호</td>
				<td><input type="text" name="saleno"></td>
			</tr>
			<tr>
				<td>지점코드</td>
				<td><td><input type="text" name="scode"></td></td>
			</tr>
			<tr>
				<td>판매일자</td>
				<td><td><input type="date" name="sale_date"></td></td>
			</tr>
			<tr>
				<td>피자코드</td>
				<td>
					<select>
						<option value="0">피자선택</option>
						<%
 		try {
 			Class.forName("oracle.jdbc.OracleDriver");
 			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
 			
 			Statement stmt = con.createStatement();
 			
 			String query = "SELECT PCODE, PNAME FROM TBL_PIZZA_01";
 			ResultSet rs = stmt.executeQuery(query);
 			while (rs.next()) {
 				%> 
 					<option value="<%=rs.getString(1)%>"><%=String.format("[%s]", "%s", rs.getString(1), rs.getString(2)) %></option>
 				<%
 			}
 			stmt.close();
 			con.close();
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		%>
					</select>
				</td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="number" name="amoount"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="전표 등록">
					<input type="button" value="다시쓰기" onclick="reset_form()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>