<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Cumparaturi</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Cumparaturi:</h1>
	<br />
	<p align="center">
		<a href="nou_cumparaturi.jsp"><b>Adauga un noi cumparaturi.</b></a> <a
			href="index.jsp"><b>Home</b></a>
	</p>
	<form action="m1_cumparaturi.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>CumparaturiID</b></td>
				<td><b>ClientID</b></td>
				<td><b>Nume</b></td>
				<td><b>Prenume</b></td>
				<td><b>Adresa</b></td>
				<td><b>ProdusID</b></td>
				<td><b>Denumire</b></td>
				<td><b>DataProducere</b></td>
				<td><b>DataExpirare</b></td>
				<td><b>TipAlimente</b></td>
			</tr>
			<%
				jb.connect();
				ResultSet rs = jb.vedeCumparaturi();
				long x;
				while (rs.next()) {
					x = rs.getLong("CumparaturiID");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getInt("ClientID_cumparaturi")%></td>
				<td><%=rs.getString("Nume")%></td>
				<td><%=rs.getString("Prenume")%></td>
				<td><%=rs.getString("Adresa")%></td>
				<td><%=rs.getInt("ProdusID_cumparaturi")%></td>
				<td><%=rs.getString("Denumire")%></td>
				<td><%=rs.getString("DataProducere")%></td>
				<td><%=rs.getString("DataExpirare")%></td>				
				<td><%=rs.getString("TipAlimente")%></td>
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