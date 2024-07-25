<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-AddressInfo</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/updateProfile?method=review">
			<table border='2' align="center" width='100' height='200'>
				<tr height="20">
					<td colspan='2' align='center'>AddressInfo</td>
				</tr>
				<tr>
					<td nowrap="nowrap">Line 1 <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="line1" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Line 2 <font color='red'>*</font>
					</td>
					<td><html:text name="UpdateProfileForm" property="line2" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">City <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="city" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">State <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="state" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Pin Code <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="pinCode" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">Country <font color='red'>*</font></td>
					<td><html:text name="UpdateProfileForm" property="country" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit value="Review" />
						&nbsp;&nbsp;</td>
			</table>
		</html:form>
</body>
</html>