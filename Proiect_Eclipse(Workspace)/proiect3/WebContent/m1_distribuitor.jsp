<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela distribuitor</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela distribuitor:</h1>
	<br />
	<p align="center">
		<a href="nou_distribuitor.jsp"><b>Adauga distribuitor.</b></a> <a
			href="index.jsp"><b>Home</b></a>
	</p>
	<%
		jb.connect();
		String Denumire,DataProducere, DataExpirare, Denumire1, TaraOrigine, Adresa, Nume;
		int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
		ResultSet rs = jb.intoarceDistribuitoriId(aux);
		rs.first();
		int id1 = rs.getInt("ProdusID_distribuitor");
		int id2 = rs.getInt("ProducatorID_distribuitor");
		Denumire = rs.getString("Denumire");
		DataProducere = rs.getString("DataProducere");
		DataExpirare = rs.getString("DataExpirare");
		Denumire1= rs.getString("Denumire");
		TaraOrigine = rs.getString("TaraOrigine");
		Adresa = rs.getString("Adresa");
		Nume = rs.getString("Nume");
		ResultSet rs1 = jb.vedeTabela("produsalimentar");
        ResultSet rs2 = jb.vedeTabela("producator");
		
		int ProducatorID, ProdusID;
		
	%>
	<form action="m2_distribuitor.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">DistribuitorID:</td>
				<td><input type="text" name="DistribuitorID" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">ProdusID:</td> 
				 <td> 
                        <SELECT NAME="ProdusID"> 
                            <% 
                                while (rs1.next()) {
                                    ProdusID = rs1.getInt("ProdusID"); 
                                    Denumire = rs1.getString("Denumire");
                                    DataProducere = rs1.getString("DataProducere");
                                    DataExpirare = rs1.getString("DataExpirare");
                            if(ProdusID != id2) {
                            %> 
                            <OPTION VALUE="<%= ProdusID%>"><%= ProdusID%>, <%= Denumire%>,<%= DataProducere%>,<%= DataProducere%></OPTION> 
                            <%
                                    } else {
                            %>
                        <OPTION selected="yes" VALUE="<%= ProdusID%>"><%= ProdusID%>, <%= Denumire%>,<%= DataProducere%>,<%= DataProducere%></OPTION> 
                            <% 
                                    }
                                }
                            %>
                        </SELECT>
                    </td>
			</tr>
			<tr>
				<td align="right">ProducatorID:</td> 
				 <td> 
                        <SELECT NAME="ProducatorID"> 
                            <% 
                                while (rs2.next()) {
                                    ProducatorID = rs2.getInt("ProducatorID"); 
                                    Denumire = rs2.getString("Denumire");
                                    TaraOrigine = rs2.getString("TaraOrigine");
                                    Adresa = rs2.getString("Adresa");
                            if(ProducatorID != id2) {
                            %> 
                            <OPTION VALUE="<%= ProducatorID%>"><%= ProducatorID%>, <%= Denumire1%>,<%= TaraOrigine%>,<%= Adresa%></OPTION> 
                            <%
                                    } else {
                            %>
                        <OPTION selected="yes" VALUE="<%= ProducatorID%>"><%= ProducatorID%>, <%= Denumire1%>,<%= TaraOrigine%>,<%= Adresa%></OPTION>
                            <% 
                                    }
                                }
                            %>
                        </SELECT>
                    </td>
			</tr>
			<tr>
				<td align="right">TipAliemnte:</td>
				<td><input type="text" name="Nume" size="30"
					value="<%=Nume%>" /></td>
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