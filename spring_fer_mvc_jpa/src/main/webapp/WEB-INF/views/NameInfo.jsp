<%@page import="com.rs.fer.bean.User"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>


<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>NameInfo</td>
	</tr>

	<tr>
		<td>First Name</td>
		<td><input type='text' name='firstName' value='${user.firstName}'></td>
	</tr>

	<tr>
		<td>Middle Name</td>
		<td><input type='text' name='middleName'
			value='${user.middleName}'></td>
	</tr>

	<tr>
		<td>Last Name</td>
		<td><input type='text' name='lastName' value='${user.lastName}'></td>
	</tr>

	<td colspan=2; align='center'><input type='Submit' value='Next'
		onclick="javascript: submitForm('showContactInfo')"></td>
	</tr>

</table>


<jsp:include page="Layout/Footer.jsp"></jsp:include>