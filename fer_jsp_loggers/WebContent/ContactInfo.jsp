<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<script>
	function validateContactInfoForm() {

		//1.Get the form object and instantiate errors object
		var form = document.DashboardForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.email.value.trim() == '') {
			errors += 'Please enter Email <br>';
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
			submitForm("AddressInfo.jsp");
		}
	}
</script>

<%!FERService ferService = new FERServiceImpl();%>
<%
	// Body

//1.Get the input
User user = (User) session.getAttribute("user");

//Load the name field values into the user object
user.setFirstName(request.getParameter("firstName"));
user.setMiddleName(request.getParameter("middleName"));
user.setLastName(request.getParameter("lastName"));
// 3.Show the status

out.println("<table border='2' align='center'>");
out.println("<tr>");
out.println("	<td colspan=2; align='center'>ContactInfo</td>");
out.println("</tr>");

out.println("<tr style='display:none; color:red' id ='errorTrId'>");
out.println("	<td colspan=2; align='center'; id ='errorTdId'> </td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Email <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='email' value='" + user.getEmail() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td> Mobile <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='mobile' value='" + user.getMobile() + "'></td>");
out.println("</tr>");

out.println("	<td colspan=2; align='center'>"
		+ "<input type = 'button' value = 'Next' onclick=\"javascript: validateContactInfoForm()\"</td>");
out.println("</tr>");

out.println("</table>");
%>

<jsp:include page="Layout/Footer.jsp"></jsp:include>