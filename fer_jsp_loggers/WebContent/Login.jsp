<html>
<head>
<title>FER login</title>
<script>
	function validateLoginForm() {

		//1.Get the form object and instantiate errors object
		var form = document.LoginForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.username.value.trim() == '') {
			errors += 'Please enter User Name <br>';
		}
		if (form.password.value.trim() == '') {
			errors += 'Please enter Password <br>';
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
	<form name="LoginForm" action='LoginPost.jsp' method='post'>
		<table border='2' align='center'>
			<tr>
				<td colspan=2; align='center'>Login</td>
			</tr>

			<tr style="display: none; color: red;" id="errorTrId">
				<td colspan=2; align='center' id="errorTdId"></td>
			</tr>

			<tr>
				<td>Username <font color='red'>*</font></td>
				<td><input type='text' name='username'></td>
			</tr>



			<tr>
				<td>Password <font color='red'>*</font></td>
				<td><input type='password' name='password'></td>
			</tr>



			<tr>
				<td colspan=2; align='center'><input type='button'
					value='Login' onclick="javascript: validateLoginForm()"> <a
					href='Registration.jsp'> &nbsp;&nbsp;&nbsp;Registration</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
