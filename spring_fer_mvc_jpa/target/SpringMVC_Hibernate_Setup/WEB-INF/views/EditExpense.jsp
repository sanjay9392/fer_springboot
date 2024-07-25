<%@page import="com.rs.fer.bean.Expense"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<c:if test="${expense == null}">
 Expense is not found......!
</c:if>

<c:if test="${expense != null}">

	<table border='2' align='center'>
		<tr>
			<td colspan=2; align='center'>EditExpense</td>
		</tr>

		<tr>
			<td>Expense Type</td>
			<td><input type='text' name='type' value='${expense.type}'></td>
		</tr>

		<tr>
			<td>Date</td>
			<td><input type='text' name='date' value='${expense.date}'></td>
		</tr>

		<tr>
			<td>Price</td>
			<td><input type='text' name='price' value='${expense.price}'></td>
		</tr>

		<tr>
			<td>No of Items</td>
			<td><input type='text' name='numberofitems'
				value='${expense.numberofitems}'></td>
		</tr>

		<tr>
			<td>Total</td>
			<td><input type='text' name='total' value='${expense.total}'></td>
		</tr>

		<tr>
			<td>By Whom</td>
			<td><input type='text' name='bywhom' value='${expense.bywhom}'></td>
		</tr>

		<td colspan=2; align='center'><input type='submit'
			value='Edit Expense' onclick="javascript: submitForm('editExpense')"></td>
		</tr>
	</table>
</c:if>

<jsp:include page="Layout/Footer.jsp"></jsp:include>