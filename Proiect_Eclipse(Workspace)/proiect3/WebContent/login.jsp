<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proiect",
            "root", "Dy@bOLyC21");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + userid + "' and pass='" + pwd + "'");
    session.setAttribute("uname", userid);
	session.setAttribute("pass", pwd);
    if (userid.equals("admin") && pwd.equals("admin123")) {
        response.sendRedirect("AdminHome.jsp");
    } else {
        
    
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='log_index.jsp'>try again</a>");
    }
  }
%>