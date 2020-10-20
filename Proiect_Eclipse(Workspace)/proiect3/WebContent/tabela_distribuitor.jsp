<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Distribuitor</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Distribuitor:</h1>
	<br />
	<p align="center">
		<a href="nou_distribuitor.jsp"><b>Adauga noi distribuitori. </b></a> <a
			href="index.jsp"><b>Home</b></a>
	</p>
	<form action="sterge_distribuitor.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>DistribuitorID</b></td>
				<td><b>ProdusID</b></td>
				<td><b>Denumire</b></td>
				<td><b>DataProducere</b></td>
				<td><b>DataExpirare</b></td>
				<td><b>ProducatorID</b></td>
				<td><b>Denumire</b></td>
				<td><b>TaraOrigine</b></td>
				<td><b>Adresa</b></td>				
				<td><b>Nume</b></td>
			</tr>
			<%
				jb.connect();
				ResultSet rs = jb.vedeDistribuitori();
				long x;
				while (rs.next()) {
					x = rs.getLong("DistribuitorID");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getInt("ProdusID_distribuitor")%></td>
				<td><%=rs.getString("Denumire")%></td>
				<td><%=rs.getString("DataProducere")%></td>
				<td><%=rs.getString("DataExpirare")%></td>
				<td><%=rs.getInt("ProducatorID_distribuitor")%></td>
				<td><%=rs.getString("Denumire")%></td>
				<td><%=rs.getString("TaraOrigine")%></td>
				<td><%=rs.getString("Adresa")%></td>
				<td><%=rs.getString("Nume")%></td>
				<%
					}
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
rs.close();
jb.disconnect();
%>
	<br />
	<p align="center">
		<a href="index.jsp"><b>Home</b></a> <br />
	</p>
</body>
</html>