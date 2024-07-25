<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<script>
	function validateResetPasswordForm() {

		//1.Get the form object and instantiate errors object
		var form = document.DashboardForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.currentPassword.value.trim() == '') {
			errors += 'Please enter Current Password <br>';
		}
		if (form.newPassword.value.trim() == '') {
			errors += 'Please enter New Password <br>';
		}
		if (form.confirmNewPassword.value.trim() == '') {
			errors += 'Please enter Confirm New Password <br>';
		}

		//3.show the error if present otherwise submit the form
		if (errors != '') {
			//alert(errors);

			//Get the td element and write the errors to the td element
			var tdElement = document.getElementById("errorTdId");
			tdElement.innerHTML = errors;

			//Get the tr element and show
			var trElement = document.getElementById("errorTrId");
			trElement.style.display = '';//to show the already present data in element we use '' or block

		} else {
			submitForm("ResetPasswordPost.jsp");
		}
	}
</script>
<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>Reset Password</td>
	</tr>

	<tr style="display: none; color: red;" id="errorTrId">
		<td colspan=2; align='center' id="errorTdId"></td>
	</tr>

	<tr>
		<td>Current Password <font color='red'>*</font></td>
		<td><input type='password' name='currentPassword'></td>
	</tr>
	<tr>
		<td>New Password <font color='red'>*</font></td>
		<td><input type='password' name='newPassword'></td>
	</tr>
	<tr>
		<td>Confirm New Password <font color='red'>*</font></td>
		<td><input type='password' name='confirmNewPassword'></td>
	</tr>
	<tr>
		<td colspan=2; align='center'><input type="button" value="Update"
			onclick="javascript: validateResetPasswordForm()"></td>
	</tr>
</table>
<jsp:include page="Layout/Footer.jsp"></jsp:include>












