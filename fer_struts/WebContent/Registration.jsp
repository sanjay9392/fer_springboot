<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-Registration</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/registration">
			<table border='2' align="center" width='100' height='200'>
				<tr height="20">
					<td colspan='2' align='center'>Registration</td>
				</tr>
				<tr>
					<td nowrap="nowrap">First Name <font color='red'>*</font> </td>
					<td><html:text name="RegistrationForm" property="firstName" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Middle Name  <font color='red'>*</font></td>
					<td><html:text name="RegistrationForm" property="middleName" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Last Name  <font color='red'>*</font></td>
					<td><html:text name="RegistrationForm" property="lastName" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Email  <font color='red'>*</font></td>
					<td><html:text name="RegistrationForm" property="email" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Username  <font color='red'>*</font></td>
					<td><html:text name="RegistrationForm" property="username" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Password  <font color='red'>*</font></td>
					<td><html:password name="RegistrationForm" property="password" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Mobile  <font color='red'>*</font></td>
					<td><html:text name="RegistrationForm" property="mobile" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit value="Registration" />
						</td>
			</table>
		</html:form>
</body>
</html>