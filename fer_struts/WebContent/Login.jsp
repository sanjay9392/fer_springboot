<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-Login</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/login">
			<table border='2' align="center" width='100' height='200'>
				<tr height="20">
					<td colspan='2' align='center'>Login</td>
				</tr>
				<tr>
					<td nowrap="nowrap">UserName <font color='red'>*</font> </td>
					<td><html:text name="LoginForm" property="username" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Password  <font color='red'>*</font></td>
					<td><html:password name="LoginForm" property="password" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit value="Login" />
						&nbsp;&nbsp;<a href="Registration.jsp">Register</a></td>
			</table>
		</html:form>
</body>
</html>