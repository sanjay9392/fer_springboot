
<%
	out.print("Welcome " + request.getParameter("name")+"<Br>");

String driver = config.getInitParameter("dName");
out.print("driver name is=" + driver);
%>
