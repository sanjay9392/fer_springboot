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

@WebServlet("/expenseReport")

public class ExpenseReportServlet extends HttpServlet {
	FERService ferService = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		ferService = new FERServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Header and LftFrame

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		LayoutUtil.displayHeaderAndLeftFrame(request, response, out, session);

		// Body

		// 1.Get the input
		
		int userId = Integer.parseInt(session.getAttribute("userId").toString());
		String expenseType = request.getParameter("type");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");

		// 2.Call the service by passing the input

		List<Expense> expenses = ferService.getExpenseReport(userId, expenseType, fromDate, toDate);

		// status
		
		if (expenses.isEmpty()) {
			out.println("Expense not found");
		} else {
			out.println("<table border='2' align='center'>");
			out.println("<tr> <td colspan=6; align='center'>Expense Report </td> </tr>");
			out.println("<tr>");
			out.println("<td>Expense Type</td>");
			out.println("<td>Date</td>");
			out.println("<td>Price</td>");
			out.println("<td>No Of Items</td>");
			out.println("<td>Total</td>");
			out.println("<td>By Whom</td>");
			out.println("</tr>");

			for (Expense expense : expenses) {

				out.println("<tr>");
				out.println("<td><input type='text' name='type' value = '" + expense.getType() + "'> </td>");
				out.println("<td><input type='text' name='date' value = '" + expense.getDate() + "'> </td>");
				out.println("<td><input type='text' name='price' value = '" + expense.getPrice() + "'> </td>");
				out.println("<td><input type='text' name='numberOfItems' value = '" + expense.getNumberofitems()
						+ "'> </td>");
				out.println("<td><input type='text' name='total' value = '" + expense.getTotal() + "'> </td>");
				out.println("<td><input type='text' name='byWhom' value = '" + expense.getBywhom() + "'> </td>");
				out.println("</tr>");

			}
			out.println("<tr>");
			out.println("<td colspan=6; align='center'><input type = 'submit' value ='Print'></td>");
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
