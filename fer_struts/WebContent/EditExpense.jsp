<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-EditExpense</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/editExpense?method=update">
			<table border='2' align="center">
				<tr height="20">
					<td colspan='2' align='center'>EditExpense</td>
				</tr>
				<tr>
					<td nowrap="nowrap">Expense Type <font color='red'>*</font>
					</td>
					<td><html:text name="EditExpenseForm" property="type" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Date <font color='red'>*</font>
					</td>
					<td><html:text name="EditExpenseForm" property="date" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Price <font color='red'>*</font>
					</td>
					<td><html:text name="EditExpenseForm" property="price" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Number Of Items <font color='red'>*</font>
					</td>
					<td><html:text name="EditExpenseForm" property="numberofitems" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Total <font color='red'>*</font>
					</td>
					<td><html:text name="EditExpenseForm" property="total" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">By Whom<font color='red'>*</font>
					</td>
					<td><html:text name="EditExpenseForm" property="bywhom" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit
							value="Edit Expense" /></td>
				</tr>
			</table>
		</html:form>
</body>
</html>