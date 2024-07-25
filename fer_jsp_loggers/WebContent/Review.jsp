<%@page import="com.rs.fer.bean.Address"%>
<%@page import="com.rs.fer.bean.User"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<jsp:include page="Layout/Header_LeftFrame.jsp"></jsp:include>

<%!FERService ferService = new FERServiceImpl();%>

<%
	// Body

// 1.Get the input

User user = (User) session.getAttribute("user");
Address address = user.getAddress();

// 2.Load address field values to the address object

address.setLine1(request.getParameter("line1"));
address.setLine2(request.getParameter("line2"));
address.setCity(request.getParameter("city"));
address.setState(request.getParameter("state"));
address.setPinCode(request.getParameter("pinCode"));
address.setCountry(request.getParameter("country"));

// 3.Show the status

out.println("<table border='2' align='center'>");
out.println("<tr>");
out.println("	<td colspan=2; align='center'>Review Profile Update</td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>First Name</td>");
out.println("	<td><input type='text' name='firstName' value='" + user.getFirstName() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Middle Name </td>");
out.println("	<td><input type='text' name='middleName' value='" + user.getMiddleName() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Last Name </td>");
out.println("	<td><input type='text' name='lastName' value='" + user.getLastName() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Email</td>");
out.println("	<td><input type='text' name='email' value='" + user.getEmail() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td> Mobile </td>");
out.println("	<td><input type='text' name='mobile' value='" + user.getMobile() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Line 1</td>");
out.println("	<td><input type='text' name='line1' value='" + address.getLine1() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Line 2</td>");
out.println("	<td><input type='text' name='line2' value='" + address.getLine2() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>City</td>");
out.println("	<td><input type='text' name='city' value='" + address.getCity() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>State</td>");
out.println("	<td><input type='text' name='state' value='" + address.getState() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Pin Code</td>");
out.println("	<td><input type='text' name='pinCode' value='" + address.getPinCode() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("<tr>");
out.println("	<td>Country</td>");
out.println("	<td><input type='text' name='country' value='" + address.getCountry() + "'disabled = 'true'></td>");
out.println("</tr>");

out.println("	<td colspan=2; align='center'>"
		+ "<input type = 'submit' value = 'Update Profile' onclick=\"javascript: submitForm('UpdateProfilePost.jsp')\"</td>");
out.println("</tr>");

out.println("</table>");
%>

<jsp:include page="Layout/Footer.jsp"></jsp:include>