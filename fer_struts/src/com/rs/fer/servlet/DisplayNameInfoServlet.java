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

import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;
import com.rs.fer.util.LayoutUtil;

@WebServlet("/displayNameInfo")

public class DisplayNameInfoServlet extends HttpServlet {

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
		// load the user into session object
		session.setAttribute("user", user);
		// 3.Show the status

		out.println("<table border='2' align='center'>");
		out.println("<tr>");
		out.println("	<td colspan=2; align='center'>NameInfo</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>First Name</td>");
		out.println("	<td><input type='text' name='firstName' value='" + user.getFirstName() + "'></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>Middle Name </td>");
		out.println("	<td><input type='text' name='middleName' value='" + user.getMiddleName() + "'></td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("	<td>Last Name </td>");
		out.println("	<td><input type='text' name='lastName' value='" + user.getLastName() + "'></td>");
		out.println("</tr>");

		out.println("	<td colspan=2; align='center'>"+ "<input type = 'submit' value = 'Next' onclick=\"javascript: submitForm('displayContactInfo')\"</td>");
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
