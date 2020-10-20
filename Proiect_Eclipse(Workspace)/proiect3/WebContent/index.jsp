<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
	<hr>
	<hr>
	<br />
	<h2>Vizualizari + Adaugari (guest version of login)</h2>
	<p>
		<a href="tabela_clienti.jsp"><b><strong>Clienti</strong></b></a>
		<a href="tabela_cumparaturi.jsp"><b><strong>Cumparaturi</strong></b></a>
		<a href="tabela_distribuitor.jsp"><b><strong>Distribuitori</strong></b></a>
		<a href="tabela_producator.jsp"><b><strong>Producatori</strong></b></a>
		<a href="tabela_produsalimentar.jsp"><b><strong>Produse Alimentare</strong></b></a>
	</p>
	<br />
	<hr>
	<ul>
		<li><a href="modifica_client.jsp"><b><strong>Modifica
						Clienti</strong></b></a></li>
		<li><a href="modifica_cumparaturi.jsp"><b><strong>Modifica
						Cumparaturi</strong></b></a></li>
		<li><a href="modifica_distribuitor.jsp"><b><strong>Modifica
						Distribuitori</strong></b></a></li>
		<li><a href="modifica_producatorul.jsp"><b><strong>Modifica
						Producatori</strong></b></a></li>
		<li><a href="modifica_produsalimentar.jsp"><b><strong>Modifica
						Produse Alimentare</strong></b></a></li>
		<li><a href="logout.jsp"><b><strong>Logout</strong></b></a></li>												
	</ul>
	<hr>
	<hr>
	<br />
</body>
</html>