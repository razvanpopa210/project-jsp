<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Distribuitor</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Distribuitor:</h1>
	<br />
	<p align="center">
		<a href="nou_distribuitor.jsp"><b>Adauga distribuitor.</b></a> <a
			href="index.jsp"><b>Home</b></a>
	</p>
	<%
		jb.connect();
		long aux = java.lang.Long.parseLong(request.getParameter("DistribuitorID"));
		String ProdusID = request.getParameter("ProdusID");
		String ProducatorID = request.getParameter("ProducatorID");
		String Nume = request.getParameter("Nume");
		String[] valori = { ProdusID, ProducatorID, Nume };
		String[] campuri = { "ProdusID", "ProducatorID", "Nume"};
		jb.modificaTabela("distribuitor", "DistribuitorID", aux, campuri, valori);
		jb.disconnect();
	%>
	<h1 align="center">Modificarile au fost efectuate !</h1>
	<p align="center">
		<a href="index.jsp"><b>Home</b></a> <br />
</body>
</html>