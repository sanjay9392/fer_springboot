<%@page import="com.rs.fer.bean.User"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>ContactInfo</td>
	</tr>

	<tr>
		<td>Email</td>
		<td><input type='text' name='email' value='${user.email}'></td>
	</tr>

	<tr>
		<td>Mobile</td>
		<td><input type='text' name='mobile' value='${user.mobile}'></td>
	</tr>

	<td colspan=2; align='center'><input type='button' value='Next'
		onclick="javascript:submitForm('showAddressInfo')"></td>
	</tr>

</table>

<jsp:include page="Layout/Footer.jsp"></jsp:include>