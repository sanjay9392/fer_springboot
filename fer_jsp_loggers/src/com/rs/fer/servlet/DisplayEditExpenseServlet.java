package com.rs.fer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rs.fer.bean.Expense;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;
import com.rs.fer.util.LayoutUtil;

@WebServlet("/displayEditExpense")

public class DisplayEditExpenseServlet extends HttpServlet {

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

		int expenseId = Integer.parseInt(request.getParameter("expenseId"));
		// load the expenseId into session object
		session.setAttribute("expenseId", expenseId);

		// 2.Call the service by passing the input
		Expense expense = ferService.getExpense(expenseId);
		// 3.Show the status
		if (expense == null) {
			out.println("Expense is not found to edit");
		} else {

			out.println("<table border='2' align='center'>");
			out.println("<tr>");
			out.println("	<td colspan=2; align='center'>EditExpense</td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("	<td>Expense Type</td>");
			out.println("	<td><input type='text' name='type' value='" + expense.getType() + "'></td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("	<td>Date </td>");
			out.println("	<td><input type='text' name='date' value='" + expense.getDate() + "'></td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("	<td>Price </td>");
			out.println("	<td><input type='text' name='price' value='" + expense.getPrice() + "'></td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("	<td>No of Items </td>");
			out.println("<td><input type='text' name='numberOfItems' value='" + expense.getNumberofitems() + "'></td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("	<td>Total </td>");
			out.println("	<td><input type='text' name='total' value='" + expense.getTotal() + "'></td>");
			out.println("</tr>");

			out.println("<tr>");
			out.println("	<td>By Whom </td>");
			out.println("	<td><input type='text' name='byWhom' value='" + expense.getBywhom() + "'></td>");
			out.println("</tr>");

			out.println("	<td colspan=2; align='center'>"
			+"<input type = 'submit' value = 'Edit Expense' onclick=\"javascript: submitForm('editExpense')\"</td>");
			out.println("</tr>");
			out.println("</table>");

		}
		
		// Footer
		LayoutUtil.displayFooter(request, response);

	}

	@Override
	public void destroy() {

		ferService = null;
	}
}
