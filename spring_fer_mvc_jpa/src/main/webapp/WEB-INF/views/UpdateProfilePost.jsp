<%@page import="com.rs.fer.bean.Address"%>
<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>

<%!FERService ferService = new FERServiceImpl();%>

<%
	// Body
// 1.Get the input

User user = (User) session.getAttribute("user");
Address address = user.getAddress();

//2.Call the service by passing the input
boolean isUserUpdate = ferService.updateUser(user);

// 3.Show the status

if (isUserUpdate) {
	session.setAttribute("status", "User Profile Updated successfully");
} else {
	session.setAttribute("status", "User Profile Updated is failed");
}
%>

<jsp:include page="Dashboard.jsp"></jsp:include>