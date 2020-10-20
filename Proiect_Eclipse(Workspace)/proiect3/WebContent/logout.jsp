<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("log_index.jsp");
%>