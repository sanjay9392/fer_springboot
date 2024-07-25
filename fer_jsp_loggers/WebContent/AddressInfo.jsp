<%@page import="com.rs.fer.bean.Address"%>
<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<script>
	function validateAddressInfoForm() {

		//1.Get the form object and instantiate errors object
		var form = document.DashboardForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.line1.value.trim() == '') {
			errors += 'Please enter Line1 <br>';
		}
		if (form.line2.value.trim() == '') {
			errors += 'Please enter Line2 <br>';
		}
		if (form.city.value.trim() == '') {
			errors += 'Please enter City <br>';
		}
		if (form.state.value.trim() == '') {
			errors += 'Please enter State <br>';
		}
		if (form.pinCode.value.trim() == '') {
			errors += 'Please enter Pin Code <br>';
		}
		if (form.country.value.trim() == '') {
			errors += 'Please enter Country <br>';
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
			submitForm("Review.jsp");
		}
	}
</script>

<%!FERService ferService = new FERServiceImpl();%>

<%
	// Body

// 1.Get the input

int userId = Integer.parseInt(session.getAttribute("userId").toString());

// 2.Call the service by passing the input

User user = ferService.getUser(userId);
Address address = user.getAddress();

// Load contact field values to the user object

user.setEmail(request.getParameter("email"));
user.setMobile(request.getParameter("mobile"));

// 3.Show the status

out.println("<table border='2' align='center'>");
out.println("<tr>");
out.println("	<td colspan=2; align='center'>AddressInfo</td>");
out.println("</tr>");

out.println("<tr style='display:none; color:red' id ='errorTrId'>");
out.println("	<td colspan=2; align='center'; id ='errorTdId'> </td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Line 1 <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='line1' value='" + address.getLine1() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Line 2 <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='line2' value='" + address.getLine2() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>City <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='city' value='" + address.getCity() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>State <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='state' value='" + address.getState() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Pin Code <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='pinCode' value='" + address.getPinCode() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Country <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='country' value='" + address.getCountry() + "'></td>");
out.println("</tr>");

out.println("	<td colspan=2; align='center'>"
		+ "<input type = 'button' value = 'Review' onclick=\"javascript: validateAddressInfoForm()\"</td>");
out.println("</tr>");

out.println("</table>");
%>

<jsp:include page="Layout/Footer.jsp"></jsp:include>