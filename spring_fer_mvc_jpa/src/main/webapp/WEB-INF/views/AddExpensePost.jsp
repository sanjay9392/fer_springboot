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

int userId = Integer.parseInt(session.getAttribute("userId").toString());
expense.setUserid(userId);

// 2.Call the service by passing the input
boolean isAddExpense = ferService.addExpense(expense);

// 3.Show the status
if (isAddExpense) {
	session.setAttribute("status", "Expense is added successfully.....! ");
} else {
	session.setAttribute("status", "Addd Expense is failed.....!");
}
%>
<jsp:include page="Dashboard.jsp"></jsp:include>