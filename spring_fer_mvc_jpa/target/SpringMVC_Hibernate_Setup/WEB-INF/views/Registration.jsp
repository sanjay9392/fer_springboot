<html>
<head>
<title>FER Registration</title>
<script>
	function validateRegistrationForm() {

		//1.Get the form object and instantiate errors object
		var form = document.RegistrationForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.firstName.value.trim() == '') {
			errors += 'Please enter First Name <br>';
		}
		if (form.lastName.value.trim() == '') {
			errors += 'Please enter Last Name <br>';
		}
		if (form.email.value.trim() == '') {
			errors += 'Please enter Email <br>';
		}
		if (form.userName.value.trim() == '') {
			errors += 'Please enter User Name <br>';
		}
		if (form.password.value.trim() == '') {
			errors += 'Please enter Password <br>';
		}
		if (form.mobile.value.trim() == '') {
			errors += 'Please enter Mobile <br>';
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
			form.submit();
		}
	}
</script>
</head>
<body>
	<font color='red'> ${status } </font>
	<br>
	<form name="RegistrationForm" action='registration' method='post'>
		<table border='2' align='center'>
			<tr>
				<td colspan=2; align='center'>Registration</td>
			</tr>

			<tr style="display: none; color: red;" id="errorTrId">
				<td colspan=2; align='center' id="errorTdId"></td>
			</tr>

			<tr>
				<td>First Name <font color='red'>*</font>
				</td>
				<td><input type='text' name='firstName'></td>
			</tr>
			<tr>
				<td>Middle Name</td>
				<td><input type='text' name='middleName'></td>
			</tr>
			<tr>
				<td>Last Name <font color='red'>*</font>
				</td>
				<td><input type='text' name='lastName'></td>
			</tr>
			<tr>
				<td>Email <font color='red'>*</font>
				</td>
				<td><input type='email' name='email'></td>
			</tr>
			<tr>
				<td>User Name <font color='red'>*</font>
				</td>
				<td><input type='text' name='username'></td>
			</tr>
			<tr>
				<td>Password <font color='red'>*</font>
				</td>
				<td><input type='password' name='password'></td>
			</tr>

			<tr>
				<td>Mobile Number <font color='red'>*</font>
				</td>
				<td><input type='text' name='mobile'></td>
			</tr>
			<tr>
				<td colspan=2; align='center'><input type='button'
					value='Registration'
					onclick="javascript: validateRegistrationForm()"></td>
			</tr>
		</table>
	</form>
</body>
</html>



















