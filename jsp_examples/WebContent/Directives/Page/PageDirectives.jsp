<%@ page import="java.util.Date" errorPage="Error.jsp" isELIgnored = "false"
isThreadSafe="false"%>
<html>
<body>
    Today is:<%=new Date()%>
    
<%
  String username = request.getParameter("username");
  session.setAttribute("username",username);
  out.println("Using out:"+session.getAttribute("username"));
%>
<br>

Using Expression tag:<%=session.getAttribute("username") %>
<br>

Using EL(Expression Language): ${username }
<br>
<%
 int i=1000/0;
%>
</body>
</html>
