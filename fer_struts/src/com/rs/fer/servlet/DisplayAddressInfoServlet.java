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

@WebServlet("/displayAddressInfo")

public class DisplayAddressInfoServlet extends HttpServlet {

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

		out.println("<tr>");
		out.println("	<td>Line 1</td>");
		out.println("	<td><input type='text' name='line1' value='" + address.getLine1() + "'></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>Line 2</td>");
		out.println("	<td><input type='text' name='line2' value='" + address.getLine2() + "'></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>City</td>");
		out.println("	<td><input type='text' name='city' value='" + address.getCity() + "'></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>State</td>");
		out.println("	<td><input type='text' name='state' value='" + address.getState() + "'></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>Pin Code</td>");
		out.println("	<td><input type='text' name='pinCode' value='" + address.getPinCode() + "'></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>Country</td>");
		out.println("	<td><input type='text' name='country' value='" + address.getCountry() + "'></td>");
		out.println("</tr>");

		out.println("	<td colspan=2; align='center'>"
				+ "<input type = 'submit' value = 'Review' onclick=\"javascript: submitForm('review')\"</td>");
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
