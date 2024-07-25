<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-NameInfo</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/updateProfile?method=contact">
			<table border='2' align="center" width='100' height='200'>
				<tr height="20">
					<td colspan='2' align='center'>NameInfo</td>
				</tr>
				<tr>
					<td nowrap="nowrap">First Name <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="firstName" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Middle Name <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="middleName" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Last Name <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="lastName" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit value="Next" />
						&nbsp;&nbsp;</td>
			</table>
		</html:form>
</body>
</html>