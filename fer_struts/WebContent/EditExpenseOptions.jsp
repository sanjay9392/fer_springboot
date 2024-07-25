<%@page import="java.util.List"%>
<%@page import="com.rs.fer.bean.Expense"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>

<script>
	function validateEditExpenseOptionsForm() {

		//1.Get the form object and instantiate errors object
		var form = document.DashboardForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.expenseId.value.trim() == '') {
			errors += 'Please enter Expense Id <br>';
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
			submitForm("EditExpense.jsp");
		}
	}
</script>

<%!FERService ferService = new FERServiceImpl();%>
<html:form action="/editExpense?method=display">
	<%
		// Body
	// 1.Get the input

	int userId = Integer.parseInt(session.getAttribute("userId").toString());

	// 2.Call the service by passing the input

	List<Expense> expenses = ferService.getExpenseOptions(userId);

	// 3.Show the status

	if (expenses.isEmpty()) {
		out.println("Expense is not found to edit");
	} else {
		out.println("<table>");
		out.println("<tr border='2' style='display:none; color:red' id ='errorTrId'>");
		out.println("	<td colspan=2; align='center'; id ='errorTdId'> </td>");
		out.println("</tr>");
		out.println("Expense ID <font color='red'>*</font>: &nbsp; &nbsp; <select");
		out.println("name='expenseId'>");
		out.println("<option value=''>Please Select Expense ID to edit</option>");

		int expenseId = 0;
		for (Expense expense : expenses) {
			expenseId = expense.getId();
			String text = null;
			text = expenseId + "--" + expense.getType() + "--" + expense.getDate() + "--" + expense.getTotal() + "--"
			+ expense.getBywhom();
			out.println("<option value='" + expenseId + "'>" + text + "</option>");

		}
		out.println("</select> &nbsp;&nbsp;&nbsp;");
	}
	out.println("</table>");
	%>
	<html:submit value="Next" />
</html:form>