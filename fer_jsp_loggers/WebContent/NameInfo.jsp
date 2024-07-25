<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<script>
	function validateNameInfoForm() {

		//1.Get the form object and instantiate errors object
		var form = document.DashboardForm;
		var errors = '';

		//2.Validate the form and add error to the errors if the required field value is empty
		if (form.firstName.value.trim() == '') {
			errors += 'Please enter First Name <br>';
		}
		if (form.lastName.value.trim() == '') {
			errors += 'Please enter Last Name <br>';
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
			submitForm("ContactInfo.jsp");
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
// load the user into session object
session.setAttribute("user", user);
// 3.Show the status

out.println("<table border='2' align='center'>");
out.println("<tr>");
out.println("	<td colspan=2; align='center'>NameInfo</td>");
out.println("</tr>");

out.println("<tr style='display:none; color:red' id ='errorTrId'>");
out.println("	<td colspan=2; align='center'; id ='errorTdId'> </td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>First Name <font color = 'red'>*</font></td>");
out.println("	<td><input type='text' name='firstName' value='" + user.getFirstName() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Middle Name </td>");
out.println("	<td><input type='text' name='middleName' value='" + user.getMiddleName() + "'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Last Name <font color = 'red'>*</font> </td>");
out.println("	<td><input type='text' name='lastName' value='" + user.getLastName() + "'></td>");
out.println("</tr>");

out.println("	<td colspan=2; align='center'>"
		+ "<input type = 'button' value = 'Next' onclick=\'javascript: validateNameInfoForm()'\"></td>");
out.println("</tr>");

out.println("</table>");
%>

<jsp:include page="Layout/Footer.jsp"></jsp:include>