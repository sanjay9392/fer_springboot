<%@page import="com.rs.fer.bean.Expense"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<script>
	function validateEditExpenseForm() {

		//1.Get the form object and instantiate errors object
		var form = document.DashboardForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.type.value.trim() == '') {
			errors += 'Please enter Expense Type <br>';
		}
		if (form.date.value.trim() == '') {
			errors += 'Please enter Date <br>';
		}
		if (form.price.value.trim() == '') {
			errors += 'Please enter Price <br>';
		}
		if (form.numberOfItems.value.trim() == '') {
			errors += 'Please enter No Of Items <br>';
		}
		if (form.total.value.trim() == '') {
			errors += 'Please enter Total <br>';
		}
		if (form.byWhom.value.trim() == '') {
			errors += 'Please enter By Whom <br>';
		}

		//3.show the error if present otherwise submit the form
		if (errors != '') {
			//alert(errors);

			//Get the td element and write the errors to the td element
			var tdElement = document.getElementById("errorTdId");
			tdElement.innerHTML = errors;

			//Get the tr element and show
			var trElement = document.getElementById("errorTrId");
			trElement.style.display = '';//to show the already present data in element we use '' or block

		} else {
			submitForm("EditExpensePost.jsp");
		}
	}
</script>

<%!FERService ferService = new FERServiceImpl();%>

<%
	// Body

// 1.Get the input

int expenseId = Integer.parseInt(request.getParameter("expenseId"));
// load the expenseId into session object
session.setAttribute("expenseId", expenseId);

// 2.Call the service by passing the input
Expense expense = ferService.getExpense(expenseId);
// 3.Show the status
if (expense == null) {
	out.println("Expense is not found to edit");
} else {

	out.println("<table border='2' align='center'>");
	out.println("<tr>");
	out.println("	<td colspan=2; align='center'>EditExpense</td>");
	out.println("</tr>");

	out.println("<tr style='display:none; color:red' id ='errorTrId'>");
	out.println("	<td colspan=2; align='center'; id ='errorTdId'> </td>");
	out.println("</tr>");

	out.println("<tr>");
	out.println("	<td>Expense Type <font color = 'red'>*</font></td>");
	out.println("	<td><input type='text' name='type' value='" + expense.getType() + "'></td>");
	out.println("</tr>");

	out.println("<tr>");
	out.println("	<td>Date <font color = 'red'>*</font></td>");
	out.println("	<td><input type='text' name='date' value='" + expense.getDate() + "'></td>");
	out.println("</tr>");

	out.println("<tr>");
	out.println("	<td>Price <font color = 'red'>*</font></td>");
	out.println("	<td><input type='text' name='price' value='" + expense.getPrice() + "'></td>");
	out.println("</tr>");

	out.println("<tr>");
	out.println("	<td>No of Items <font color = 'red'>*</font></td>");
	out.println("<td><input type='text' name='numberOfItems' value='" + expense.getNumberofitems() + "'></td>");
	out.println("</tr>");

	out.println("<tr>");
	out.println("	<td>Total <font color = 'red'>*</font></td>");
	out.println("	<td><input type='text' name='total' value='" + expense.getTotal() + "'></td>");
	out.println("</tr>");

	out.println("<tr>");
	out.println("	<td>By Whom <font color = 'red'>*</font></td>");
	out.println("	<td><input type='text' name='byWhom' value='" + expense.getBywhom() + "'></td>");
	out.println("</tr>");

	out.println("	<td colspan=2; align='center'>"
	+ "<input type = 'button' value = 'Edit Expense' onclick=\"javascript: validateEditExpenseForm()\"</td>");
	out.println("</tr>");
	out.println("</table>");

}
%>

<jsp:include page="Layout/Footer.jsp"></jsp:include>