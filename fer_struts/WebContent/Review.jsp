<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-Review</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/updateProfile?method=update">
			<table border='2' align="center" width='100' height='200'>
				<tr height="20">
					<td colspan='2' align='center'>Review</td>
				</tr>
				<tr>
					<td nowrap="nowrap">First Name <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="firstName"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Middle Name <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="middleName"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Last Name <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="lastName"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Email <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="email"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Mobile <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="mobile"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Line 1 <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="line1"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Line 2 <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="line2"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">City <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="city"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">State <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="state"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Pin Code <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="pinCode"
							disabled='true' /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Country <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="country"
							disabled='true' /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit
							value="UpdateProfile" /> &nbsp;&nbsp;</td>
			</table>
		</html:form>
</body>
</html>