<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>

<%!FERService ferService = new FERServiceImpl();%>
<%
	// Body

// 1.Get the input

int id = Integer.parseInt(session.getAttribute("userId").toString());
String currentPassword = request.getParameter("currentPassword");
String newPassword = request.getParameter("newPassword");

// 2.Call the service by passing the input
FERService ferService = new FERServiceImpl();
boolean isResetPassword = ferService.resetPassword(id, currentPassword, newPassword);
// 3.Show the status
if (isResetPassword) {
	session.setAttribute("status", "Password changed successfully.....! ");
} else {
	session.setAttribute("status", "Password change is failed.....!");
}
%>
<jsp:include page="Dashboard.jsp"></jsp:include>