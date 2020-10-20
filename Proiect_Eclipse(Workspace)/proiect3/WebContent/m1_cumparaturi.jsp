<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Cumparaturi</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Cumparaturi:</h1>
	<br />
	<p align="center">
		<a href="nou_cumparaturi.jsp"><b>Adauga noi cumparaturi.</b></a> <a
			href="index.jsp"><b>Home</b></a>
	</p>
	<%
		jb.connect();
		String Nume, Prenume, Adresa, Denumire, DataProducere, DataExpirare,TipAlimente;
		int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
		ResultSet rs = jb.intoarceCumparaturiId(aux);
		rs.first();
		int id1 = rs.getInt("ClientID_cumparaturi");
		int id2 = rs.getInt("ProdusID_cumparaturi");
		Nume = rs.getString("Nume");
		Prenume = rs.getString("Prenume");
		Adresa = rs.getString("Adresa");
		Denumire = rs.getString("Denumire");
		DataProducere = rs.getString("DataProducere");
		DataExpirare = rs.getString("DataExpirare");
		TipAlimente = rs.getString("TipAlimente");
		
		ResultSet rs1 = jb.vedeTabela("clienti");
        ResultSet rs2 = jb.vedeTabela("produsalimentar");
		
		int ClientID, ProdusID;
	%>
	<form action="m2_cumparaturi.jsp" method="post">
		<table align="center">
			<tr>
				<td align="right">CumparaturiID:</td>
				<td><input type="text" name="CumparaturiID" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr> 	
					<td align="right">ClientID:</td>
					<td>
                    
                        <SELECT NAME="ClientID">
                            <%
                            while (rs1.next()) {
                                ClientID= rs1.getInt("ClientID"); 
                                Nume = rs1.getString("Nume");
                                Prenume = rs1.getString("Prenume");
                                Adresa = rs1.getString("Adresa");
                                if (ClientID != id1) {
                            %>
                            <OPTION VALUE="<%= ClientID%>"><%= ClientID%>, <%= Nume%>, <%= Prenume%>, <%= Adresa%></OPTION>
                                <%
                                        } else {
                                %>
                                <OPTION selected="yes" VALUE="<%= ClientID%>"><%= ClientID%>, <%= Nume%>, <%= Prenume%>, <%= Adresa%></OPTION> 
                                <%
                                        } 
                                    } 
                                %> 
                        </SELECT>
                    </td>
                </tr>
                <tr> 
                	<td align="right">ProdusID:</td> 
                    <td>
                        <SELECT NAME="ProdusID"> 
                            <% 
                                while (rs2.next()) {
                                    ProdusID = rs2.getInt("ProdusID"); 
                                    Denumire = rs2.getString("Denumire");
                                    DataProducere = rs2.getString("DataProducere");
                                    DataExpirare = rs2.getString("DataExpirare");
                            if(ProdusID != id2) {
                            %> 
                            <OPTION VALUE="<%= ProdusID%>"><%= ProdusID%>, <%= Denumire%>,<%= DataProducere%>,<%= DataExpirare%></OPTION> 
                            <%
                                    } else {
                            %>
                        <OPTION selected="yes" VALUE="<%= ProdusID%>"><%= ProdusID%>, <%= Denumire%>,<%= DataProducere%>,<%= DataExpirare%></OPTION> 
                            <% 
                                    }
                                }
                            %>
                        </SELECT>
                    </td>
                </tr>
                <tr> 
			<tr>
				<td align="right">TipAliemnte:</td>
				<td><input type="text" name="TipAlimente" size="30"
					value="<%=TipAlimente%>" /></td>
			</tr>
			
		</table>
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<p align="center">
		<a href="index.jsp"><b>Home</b></a> <br />
</body>
<% 
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %> 
</html>