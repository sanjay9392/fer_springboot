<%@page import="com.rs.fer.bean.Address"%>
<%@page import="com.rs.fer.bean.User"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<table border='2' align='center'>
	<tr>
		<td colspan=2; align='center'>AddressInfo</td>
	</tr>

	<tr>
		<td>Line 1 <font color='red'>*</font></td>
		<td><input type='text' name='line1' value='${address.line1}'></td>
	</tr>

	<tr>
		<td>Line 2 <font color='red'>*</font></td>
		<td><input type='text' name='line2' value='${address.line2}'></td>
	</tr>

	<tr>
		<td>City <font color='red'>*</font></td>
		<td><input type='text' name='city' value='${address.city}'></td>
	</tr>

	<tr>
		<td>State <font color='red'>*</font></td>
		<td><input type='text' name='state' value='${address.state}'></td>
	</tr>

	<tr>
		<td>Pin Code <font color='red'>*</font></td>
		<td><input type='text' name='pinCode' value='${address.pinCode}'></td>
	</tr>

	<tr>
		<td>Country <font color='red'>*</font></td>
		<td><input type='text' name='country' value='${address.country}'></td>
	</tr>

	<td colspan=2; align='center'><input type='Review' value='Review'
		onclick="javascript: submitForm('review')"></td>
	</tr>

</table>

<jsp:include page="Layout/Footer.jsp"></jsp:include>