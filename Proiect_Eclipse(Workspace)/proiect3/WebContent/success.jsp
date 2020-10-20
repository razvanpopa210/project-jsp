<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>, Log Out if u want
<a href='logout.jsp'>Log out</a>
<%
%>
Or, go to main page
<a href='index.jsp'>Main Page</a>
<%
    }
%>