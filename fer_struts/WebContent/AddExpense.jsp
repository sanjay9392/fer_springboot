<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-AddExpense</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/addExpense?method=save">
			<table border='2' align="center" >
				<tr height="20">
					<td colspan='2' align='center'>AddExpense</td>
				</tr>
				<tr>
					<td nowrap="nowrap">Expense Type <font color='red'>*</font> </td>
					<td><html:text name="AddExpenseForm" property="type" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Date <font color='red'>*</font> </td>
					<td><html:text name="AddExpenseForm" property="date" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Price <font color='red'>*</font> </td>
					<td><html:text name="AddExpenseForm" property="price" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Number Of Items <font color='red'>*</font> </td>
					<td><html:text name="AddExpenseForm" property="numberofitems" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Total <font color='red'>*</font> </td>
					<td><html:text name="AddExpenseForm" property="total" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">By Whom<font color='red'>*</font> </td>
					<td><html:text name="AddExpenseForm" property="bywhom" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit value="Save Expense" />
						</td>
			    </tr>
			</table>
		</html:form>
</body>
</html>