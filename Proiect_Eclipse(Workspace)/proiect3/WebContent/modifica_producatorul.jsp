<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Producatori</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Producatori:</h1>
	<br />
	<p align="center">
		<a href="nou_producator.jsp"><b>Adauga un nou producator.</b></a> <a
			href="index.jsp"><b>Home</b></a>
	</p>
	<form action="m1_producator.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>ProducatorID:</b></td>
				<td><b>Denumire Producator:</b></td>
				<td><b>Tara Origine Producator:</b></td>
				<td><b>Adresa:</b></td>
			</tr>
			<%
				jb.connect();
				ResultSet rs = jb.vedeTabela("producator");
				long x;
				while (rs.next()) {
					x = rs.getLong("ProducatorID");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getString("Denumire")%></td>
				<td><%=rs.getString("TaraOrigine")%></td>
				<td><%=rs.getString("Adresa")%></td>
				<%
					}
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<%
		jb.disconnect();
	%>
	<br />
	<p align="center">
		<a href="index.jsp"><b>Home</b></a> <br />
	</p>
</body>
</html>