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
	<form action="action/insert_pizza.jsp" method="post" name="action_form">
		<table border="1">
			<tr>
				<td>매출전표번호</td>
				<td><input type="number" name="saleno"></td>
			</tr>
			<tr>
				<td>지점코드</td>
				<td><input type="text" name="scode"></td>
			</tr>
			<tr>
				<td>판매일자</td>
				<td><input type="date" name="sale_date"></td>
			</tr>
			<tr>
				<td>피자코드</td>
				<td>
					<select name="pcode">
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
 					<option value="<%=rs.getString(1)%>"><%=String.format("[%s] %s", rs.getString(1), rs.getString(2)) %></option>
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
				<td><input type="number" name="amount"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="전표 등록" onclick="suubmit_form()">
					<input type="button" value="다시쓰기" onclick="reset_form()">
				</td>
			</tr>
		</table>
	</form>
	<script>
		function submit_form() {
			if(document.action_form.saleno.value === "") {
				alert("매출전표번호가 입력되지 않았습니다.");
				document.action_form.saleno.focus();
				return;
			}
			if(document.action_form.scode.value === "") {
				alert("지점코드가 입력되지 않았습니다.");
				document.action_form.scode.focus();
				return;
			}
			if(document.action_form.sale_date.value === "") {
				alert("판매일자가 입력되지 않았습니다.");
				document.action_form.sale_date.focus();
				return;
			}
			if(document.action_form.pcode.value === "") {
				alert("피자코드가 입력되지 않았습니다.");
				document.action_form.pcode.focus();
				return;
			}
			if(document.action_form.amount.value === "") {
				alert("판매수량이 입력되지 않았습니다.");
				document.action_form.amount.focus();
				return;
			}
			
			alert("매출전표가 정상적으로 등록되었습니다.")
			document.action_form.submit();
		}
		
		function reset_form() {
			document.action_form.reset();
		}
	</script>
</body>
</html>