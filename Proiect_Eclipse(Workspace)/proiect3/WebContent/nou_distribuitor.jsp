<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adauga Distribuitor</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%	int ProdusID, ProducatorID;
		String Denumire, TaraOrigine, Adresa, Denumire1, DataProducere, DataExpirare;
		String id1 = request.getParameter("ProdusID");
		String id2 = request.getParameter("ProducatorID");
		String Nume = request.getParameter("Nume");
		if (id1 != null) {
			jb.connect();
			jb.adaugaDistribuitor(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Nume);
			jb.disconnect();
	%>
	<p>Datele au fost adaugate.</p>
	<%

		} else {
			jb.connect();
	        ResultSet rs1 = jb.vedeTabela("produsalimentar"); 
	        ResultSet rs2 = jb.vedeTabela("producator");
	%>
	<h1>Suntem in tabela Distribuitor.</h1>
	<form action="nou_distribuitor.jsp" method="post">
		<table>
			<tr>
				<td align="right">ProdusID:</td>
				<td> Selectati Produsul
				 <SELECT NAME="ProdusID">
                            <% 
                                while(rs1.next()){
                                    ProdusID = rs1.getInt("ProdusID");
                                    Denumire1 = rs1.getString("Denumire"); 
                                    DataProducere = rs1.getString("DataProducere");
                                    DataExpirare = rs1.getString("DataExpirare");
                            %>
                            <OPTION VALUE="<%= ProdusID%>"><%= ProdusID%>,<%= Denumire1%>,<%=DataProducere%>,<%= DataExpirare%></OPTION>
                            <%
                                } 
                            %>
                </SELECT>
                </td>
			</tr>
			<tr>
				<td align="right">ProducatorID:</td>
				 <td>
                        Selectati producatorul:
                <SELECT NAME="ProducatorID">
                    <!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION --> 
                            <%
                                 while(rs2.next()){ 
                                    ProducatorID =rs2.getInt("ProducatorID");
                                    Denumire =rs2.getString("Denumire");
                                    TaraOrigine =rs2.getString("TaraOrigine");
                                    Adresa = rs2.getString("Adresa");
                            %>
                                <OPTION VALUE="<%= ProducatorID%>"><%= ProducatorID%>,<%= Denumire%>,<%= TaraOrigine%>,<%= Adresa%></OPTION>
                            <%
                                 }
                            %>
                </SELECT> 
                </td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="Nume" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Adauga Dsitribuitor" />
	</form>
	<%
}
%>
	<br />
	<a href="index.jsp"><b>Home</b></a>
	<br />
</body>
</html>