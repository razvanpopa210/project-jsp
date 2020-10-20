<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Producatori</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
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
	<%
		jb.connect();
		long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
		ResultSet rs = jb.intoarceLinieDupaId("producator", "ProducatorID", aux);
		rs.first();
		String Denumire = rs.getString("Denumire");
		String TaraOrigine = rs.getString("TaraOrigine");
		String Adresa = rs.getString("Adresa");
		rs.close();
		jb.disconnect();
	%>
	<form action="m2_producator.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">ProducatorID:</td>
				<td><input type="text" name="ProducatorID" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Denumire:</td>
				<td><input type="text" name="Denumire" size="30"
					value="<%=Denumire%>" /></td>
			</tr>
			<tr>
				<td align="right">TaraOrigine:</td>
				<td><input type="text" name="TaraOrigine" size="30"
					value="<%=TaraOrigine%>" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="Adresa" size="30"
					value="<%=Adresa%>" /></td>
			</tr>
			
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center">
		<a href="index.jsp"><b>Home</b></a> <br />
</body>
</html>