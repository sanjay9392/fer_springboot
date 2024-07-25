<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<script>
	function validateAddExpenseForm() {

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
		if (form.numberofitems.value.trim() == '') {
			errors += 'Please enter No Of Items <br>';
		}
		if (form.total.value.trim() == '') {
			errors += 'Please enter Total <br>';
		}
		if (form.bywhom.value.trim() == '') {
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
			submitForm("addExpense");
		}
	}
</script>

<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>AddExpense</td>
	</tr>

	<tr style="display: none; color: red;" id="errorTrId">
		<td colspan=2; align='center' id="errorTdId"></td>
	</tr>

	<tr>
		<td>Expense Type <font color='red'>*</font></td>
		<td><input type='text' name='type'></td>
	</tr>

	<tr>
		<td>Date <font color='red'>*</font></td>
		<td><input type='text' name='date'></td>
	</tr>
	<tr>
		<td>Price <font color='red'>*</font></td>
		<td><input type='text' name='price'></td>
	</tr>
	<tr>
		<td>Number Of Items <font color='red'>*</font></td>
		<td><input type='text' name='numberofitems'></td>
	</tr>
	<tr>
		<td>Total <font color='red'>*</font></td>
		<td><input type='text' name='total'></td>
	</tr>
	<tr>
		<td>By Whom <font color='red'>*</font></td>
		<td><input type='text' name='bywhom'></td>
	</tr>

	<tr>
		<td colspan=2; align='center'><input type='button'
			value='Save Expense' onclick="javascript: validateAddExpenseForm()"></td>
	</tr>
</table>
<jsp:include page="Layout/Footer.jsp"></jsp:include>
















