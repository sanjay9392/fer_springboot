package com.rs.fer.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;
import com.rs.fer.util.LayoutUtil;

@WebServlet("/review")

public class ReviewServlet extends HttpServlet {

	FERService ferService = null;

	@Override
	public void init() throws ServletException {
		ferService = new FERServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Header and LeftFrame
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		LayoutUtil.displayHeaderAndLeftFrame(request, response, out, session);

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
				+ "<input type = 'submit' value = 'Update Profile' onclick=\"javascript: submitForm('updateProfile')\"</td>");
		out.println("</tr>");

		out.println("</table>");

		// Footer
		LayoutUtil.displayFooter(request, response);

	}

	@Override
	public void destroy() {

		ferService = null;
	}
}
