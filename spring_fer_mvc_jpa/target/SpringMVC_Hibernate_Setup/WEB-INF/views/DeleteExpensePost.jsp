<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>

<%!FERService ferService = new FERServiceImpl();%>

<%
	// Body
int expenseid = Integer.parseInt(request.getParameter("expenseId"));

// 2.Call the service by passing the input
FERService ferService = new FERServiceImpl();
boolean isDeleteExpense = ferService.deleteExpense(expenseid);
// 3.Show the status
if (isDeleteExpense) {
	session.setAttribute("status", "Expense deleted successfully.....! ");
} else {
	session.setAttribute("status", "Expense deletion  failed.....!");
}
%>

<jsp:include page="Dashboard.jsp"></jsp:include>