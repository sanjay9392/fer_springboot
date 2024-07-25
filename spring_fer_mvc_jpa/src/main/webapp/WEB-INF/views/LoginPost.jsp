
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>

<%!FERService ferService = new FERServiceImpl();%>

<%
	// 1.Get the input
String username = request.getParameter("username");
String password = request.getParameter("password");

//2.Get the Service by passing the input
int userId = ferService.login(username, password);

// 3.Show the status
String path = null;
if (userId > 0) {
	session.setAttribute("username", username);
	session.setAttribute("userId", userId);

	// Body
	session.setAttribute("status","Welcome to the user:" + username + "!");

	path = "Dashboard.jsp";
} else {
	out.println("Incorrect Username/Password...Please try again.....!");
	path = "Login.jsp";
}
%>
<jsp:include page="<%=path%>"></jsp:include>
