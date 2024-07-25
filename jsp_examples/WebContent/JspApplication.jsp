
<%
	out.print("Welcome " + request.getParameter("name")+"<Br>");
String driver = application.getInitParameter("dName");
out.print("driver name is=" + driver);
%>
