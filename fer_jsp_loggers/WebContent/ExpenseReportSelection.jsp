<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

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
<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>Expense Report Selection</td>
	</tr>

	<tr style="display: none; color: red;" id="errorTrId">
		<td colspan=2; align='center' id="errorTdId"></td>
	</tr>


	<tr>
		<td>Expense Type <font color='red'>*</font></td>
		<td><input type='text' name='type'></td>
	</tr>
	<tr>
		<td>From Date <font color='red'>*</font></td>
		<td><input type='text' name='fromDate'></td>
	</tr>
	<tr>
		<td>To Date <font color='red'>*</font></td>
		<td><input type='text' name='toDate'></td>
	</tr>


	<tr>
		<td colspan=2; align='center'><input type='button'
			value='Expense Report'
			onclick="javascript: validateExpenseReportSelectionForm()"></td>
	</tr>
</table>

<jsp:include page="Layout/Footer.jsp"></jsp:include>















