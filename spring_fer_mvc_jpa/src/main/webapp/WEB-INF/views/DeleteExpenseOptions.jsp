<%@page import="com.rs.fer.bean.Expense"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<c:if test="${expenses.size() == 0 }">
	Expense not found to delete.....!
</c:if>

<c:if test="${expenses.size() != 0 }">
	Expense ID:
	&nbsp;&nbsp;
	 <select name='expenseId'>
		<option value=''>Please Select Expense ID to delete</option>
		<c:forEach var="expense" items="${expenses}">
			<option value='${expense.id}'>${expense.id}--${expense.type }--${expense.date }--${expense.total }--${expense.bywhom }</option>
		</c:forEach>
	</select> &nbsp;&nbsp;&nbsp;
	 <input type='submit' value='Delete'
		onclick="javascript:submitForm('deleteExpense')">
</c:if>

<jsp:include page="Layout/Footer.jsp"></jsp:include>