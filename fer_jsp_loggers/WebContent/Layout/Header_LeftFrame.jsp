<html>
<head>
<title>FER Dashboard</title>
<script>
function submitForm(path){
	//get the form object
	var form = document.DashboardForm;
	
	//load the path into the action attribute
	form.action = path;
	
	//submit the form object
	form.submit();
}
</script>
</head>
<body>
	<form name='DashboardForm' method = 'post'>
		<table border='2' align='center' height='600px' width='800px'>
			<tr>
				<td colspan=2; align='center' height='75'>Family Expense Report
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User: ${username }
					</td>
			</tr>

			<tr>
				<td width='150' align='center'><br> <br> <a
					href="javascript:submitForm('AddExpense.jsp')">Add Expense</a> <br> <br> <a
					href="javascript:submitForm('EditExpenseOptions.jsp')">Edit Expense</a> <br>
				<br> <a href="javascript:submitForm('DeleteExpenseOptions.jsp')">Delete Expense</a> <br>
				<br> <a href="javascript:submitForm('ExpenseReportSelection.jsp')">ExpenseReport</a> <br>
				<br> <a href="javascript:submitForm('ResetPassword.jsp')">Reset Password</a> <br>
				<br> <a href="javascript:submitForm('NameInfo.jsp')">Update Profile</a> <br>
				<br></td>
				<td align='center' width='650'>