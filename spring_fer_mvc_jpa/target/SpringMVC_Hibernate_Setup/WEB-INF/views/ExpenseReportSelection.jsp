<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>Expense Report Selection</td>
	</tr>
	<tr>
		<td>Expense Type </td>
		<td><input type='text' name='type'></td>
	</tr>
	<tr>
		<td>From Date </td>
		<td><input type='text' name='fromDate'></td>
	</tr>
	<tr>
		<td>To Date </td>
		<td><input type='text' name='toDate'></td>
	</tr>
	<tr>
		<td colspan=2; align='center'><input type='Submit'
			value='Expense Report'
			onclick="javascript: submitForm('expenseReport')"></td>
	</tr>
</table>

<jsp:include page="Layout/Footer.jsp"></jsp:include>















