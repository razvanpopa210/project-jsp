<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga client</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
		String Nume = request.getParameter("Nume");
		String Prenume = request.getParameter("Prenume");
		String Adresa = request.getParameter("Adresa");
		if (Nume != null) {
			jb.connect();
			jb.adaugaClient(Nume, Prenume, Adresa);
			jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
		} else {
	%>
	<h1>Suntem in tabela Clienti.</h1>
	<form action="nou_client.jsp" method="post">
		<table>
			<tr>
				<td align="right">Nume Client:</td>
				<td><input type="text" name="Nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume Client:</td>
				<td><input type="text" name="Prenume" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="Adresa" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga clientul" />
	</form>
	<%
}
%>
	<br />
	<a href="index.jsp"><b>Home</b></a>
	<br />
</body>
</html>