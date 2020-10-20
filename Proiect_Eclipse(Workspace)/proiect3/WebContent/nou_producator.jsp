<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga producator</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
		String Denumire = request.getParameter("Denumire");
		String TaraOrigine = request.getParameter("TaraOrigine");
		String Adresa = request.getParameter("Adresa");
		if (Denumire != null) {
			jb.connect();
			jb.adaugaProducator(Denumire, TaraOrigine, Adresa);
			jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%
		} else {
	%>
	<h1>Suntem in tabela Producator.</h1>
	<form action="nou_producator.jsp" method="post">
		<table>
			<tr>
				<td align="right">Denumire Producator:</td>
				<td><input type="text" name="Denumire" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Tara Origine Producator:</td>
				<td><input type="text" name="TaraOrigine" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Adresa Producator:</td>
				<td><input type="text" name="Adresa" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga Producatorul" />
	</form>
	<%
}
%>
	<br />
	<a href="index.jsp"><b>Home</b></a>
	<br />
</body>
</html>