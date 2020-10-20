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
//		Connection connection = null;
//		Statement statement = null;
//		ResultSet resultSet = null;
//		String error;
	%>
	<%
//		try {
//			connection = DriverManager.getConnection("//localhost:3306/proiect", "root", "Dy@bOLyC21");
//			statement = connection.createStatement();
//			String sql = "select uname,pass from members";
//			resultSet = statement.executeQuery(sql);
//			connection.close();
			
//			String username = resultSet.getString("uname");
//			String password = resultSet.getString("pass");

			String username=session.getAttribute("uname").toString();
			String password=session.getAttribute("pass").toString();
			String[] s = request.getParameterValues("primarykey");


			if (username.equals("admin") && password.equals("admin123")){
			
//				String[] s = request.getParameterValues("primarykey");
				jb.connect();
				jb.stergeDateTabela(s, "clienti", "ClientID");
				jb.disconnect();
				
			}
//			connection.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//S		}
	
		
	%>
	
	<p align="center">
		<a href="index.jsp"><b>Home</b></a> <br />
	</p>
</body>
</html>