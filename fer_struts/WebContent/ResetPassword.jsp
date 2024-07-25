<%@taglib uri="WEB-INF/struts-html.tld" prefix="html"%>
<html>
<head>
<title>FER-ResetPassword</title>
</head>
<body>
	<div style="color: red">
		<html:errors />
		${status }
	</div>
	<table border="2">
		<html:form action="/resetPassword?method=reset">
			<table border='2' align="center" width='100' height='200'>
				<tr height="20">
					<td colspan='2' align='center'>Reset Password</td>
				</tr>
				<tr>
					<td nowrap="nowrap">Current Password <font color='red'>*</font> </td>
					<td><html:text name="ResetPasswordForm" property="currentPassword" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap">New Password  <font color='red'>*</font></td>
					<td><html:password name="ResetPasswordForm" property="newPassword" /></td>
				</tr>
				<tr>
					<td nowrap="nowrap"> Confirm New Password  <font color='red'>*</font></td>
					<td><html:password name="ResetPasswordForm" property="confirmNewPassword" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><html:submit value="Update Password" />
					</td>
				</tr>
			</table>
		</html:form>
</body>
</html>