<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>Reset Password</td>
	</tr>

	<tr>
		<td>Current Password </td>
		<td><input type='password' name='currentPassword'></td>
	</tr>
	<tr>
		<td>New Password </td>
		<td><input type='password' name='newPassword'></td>
	</tr>
	<tr>
		<td>Confirm New Password </td>
		<td><input type='password' name='confirmNewPassword'></td>
	</tr>
	<tr>
		<td colspan=2; align='center'><input type="Submit" value="Update"
			onclick="javascript: submitForm('resetPassword')"></td>
	</tr>
</table>
<jsp:include page="Layout/Footer.jsp"></jsp:include>












