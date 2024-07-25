<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>

<script>
	function validateExpenseReportSelectionForm() {

		//1.Get the form object and instantiate errors object
		var form = document.DashboardForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.type.value.trim() == '') {
			errors += 'Please enter Expense Type <br>';
		}
		if (form.fromDate.value.trim() == '') {
			errors += 'Please enter From Date <br>';
		}
		if (form.toDate.value.trim() == '') {
			errors += 'Please enter To Date <br>';
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
			submitForm("ExpenseReportPost.jsp");
		}
	}
</script>
<html:form action="/expenseReport?method=report">
	<table border='2' align="center">
		<tr height="20">
			<td colspan='2' align='center'>Expense Report</td>
		</tr>
		<tr>
			<td nowrap="nowrap">Expense Type <font color='red'>*</font>
			</td>
			<td><html:text name="ExpenseReportForm" property="type" /></td>
		</tr>
		<tr>
			<td nowrap="nowrap">From Date <font color='red'>*</font>
			</td>
			<td><html:text name="ExpenseReportForm" property="fromDate" /></td>
		</tr>
		<tr>
			<td nowrap="nowrap">To Date <font color='red'>*</font>
			</td>
			<td><html:text name="ExpenseReportForm" property="toDate" /></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><html:submit
					value="Expense Report" /></td>
		</tr>
	</table>
</html:form>
















