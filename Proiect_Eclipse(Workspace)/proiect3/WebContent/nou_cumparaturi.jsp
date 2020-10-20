<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Cumparturi</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%	int ClientID, ProdusID;
		String Nume, Prenume, Adresa, Denumire, DataProducere, DataExpirare;
		String id1 = request.getParameter("ClientID");
		String id2 = request.getParameter("ProdusID");
		String TipAlimente = request.getParameter("TipAlimente");
		if (id1 != null) {
			jb.connect();
			jb.adaugaCumparaturi(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), TipAlimente);
			jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%

		} else {
			jb.connect();
	        ResultSet rs1 = jb.vedeTabela("clienti"); 
	        ResultSet rs2 = jb.vedeTabela("produsalimentar");
	%>
	<h1>Suntem in tabela Cumparaturi.</h1>
	<form action="nou_cumparaturi.jsp" method="post">
		<table>
			<tr>
				<td align="right">ClientID:</td>
				<td> Selectati Clientul
				 <SELECT NAME="ClientID">
                            <% 
                                while(rs1.next()){
                                    ClientID = rs1.getInt("ClientID");
                                    Nume = rs1.getString("Nume"); 
                                    Prenume = rs1.getString("Prenume");
                                    Adresa = rs1.getString("Adresa");
                            %>
                            <OPTION VALUE="<%= ClientID%>"><%= ClientID%>,<%= Nume%>,<%=Prenume%>,<%= Adresa%></OPTION>
                            <%
                                } 
                            %>
                </SELECT>
                </td>
			</tr>
			<tr>
				<td align="right">ProdusID:</td>
				 <td>
                        Selectati produsul:
                <SELECT NAME="ProdusID">
                    <!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION --> 
                            <%
                                 while(rs2.next()){ 
                                    ProdusID =rs2.getInt("ProdusID");
                                    Denumire =rs2.getString("Denumire");
                                    DataProducere =rs2.getString("DataProducere");
                                    DataExpirare = rs2.getString("DataExpirare");
                            %>
                                <OPTION VALUE="<%= ProdusID%>"><%= ProdusID%>,<%= Denumire%>,<%= DataProducere%>,<%= DataExpirare%></OPTION>
                            <%
                                 }
                            %>
                </SELECT> 
                </td>
			</tr>
			<tr>
				<td align="right">TipAlimente:</td>
				<td><input type="text" name="TipAlimente" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga Cumparaturi" />
	</form>
	<%
}
%>
	<br />
	<a href="index.jsp"><b>Home</b></a>
	<br />
</body>
</html>