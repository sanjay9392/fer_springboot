
<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<%!FERService ferService = new FERServiceImpl();%>

<%
	// 1.Get the input

User user = new User();
user.setFirstName(request.getParameter("firstName"));
user.setMiddleName(request.getParameter("middleName"));
user.setLastName(request.getParameter("lastName"));
user.setEmail(request.getParameter("email"));
user.setUsername(request.getParameter("userName"));
user.setPassword(request.getParameter("password"));
user.setMobile(request.getParameter("mobile"));

// 2.Call the service by passing the input

boolean isRegister = ferService.registration(user);

// 3.Show the status

String path = null;
if (isRegister) {
	out.println("User Registration is done successfully.....! ");
	path = "Login.jsp";

} else {
	out.println("User Registration is failed.....!");
	path = "Registration.jsp";
}
%>
<jsp:include page="<%=path%>"></jsp:include>