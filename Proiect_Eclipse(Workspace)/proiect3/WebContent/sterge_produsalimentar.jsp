<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Clienti</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	
	<%
	String username=session.getAttribute("uname").toString();
	String password=session.getAttribute("pass").toString();
	String[] s = request.getParameterValues("primarykey");


	if (username.equals("admin") && password.equals("admin123")){
	
//		String[] s = request.getParameterValues("primarykey");
		jb.connect();
		jb.stergeDateTabela(s, "produsalimentar", "ProdusID");
		jb.disconnect();
		
	}
		
	%>
	
	<p align="center">
		<a href="index.jsp"><b>Home</b></a> <br />
	</p>
</body>
</html>