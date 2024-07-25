<%@page import="com.rs.fer.bean.Expense"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>

<%!FERService ferService = new FERServiceImpl();%>

<%
	// Body

// 1.Get the input
Expense expense = new Expense();
expense.setType(request.getParameter("type"));
expense.setDate(request.getParameter("date"));
expense.setPrice(Float.parseFloat(request.getParameter("price")));
expense.setNumberofitems(Integer.parseInt(request.getParameter("numberOfItems")));
expense.setTotal(Float.parseFloat(request.getParameter("total")));
expense.setBywhom(request.getParameter("byWhom"));
int expenseId = Integer.parseInt(session.getAttribute("expenseId").toString());
expense.setId(expenseId);

// 2.Call the service by passing the input
boolean isEditExpense = ferService.editExpense(expense);
// 3.Show the status
if (isEditExpense) {
	session.setAttribute("status", "Expense is updated successfully.....! ");
} else {
	session.setAttribute("status", " Expense updation is failed.....!");
}
%>

<jsp:include page="Dashboard.jsp"></jsp:include>