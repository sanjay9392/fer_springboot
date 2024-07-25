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

@WebServlet("/displayDeleteExpenseOptions")

public class DisplayDeleteExpenseOptionsServlet extends HttpServlet {
	
	FERService ferService = null;
	@Override
	public void init() throws ServletException {
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

		// 2.Call the service by passing the input

		List<Expense> expenses = ferService.getExpenseOptions(userId);

		// 3.Show the status

		if (expenses.isEmpty()) {
			out.println("Expense is not found");
		} else {
			out.println("Expense ID: &nbsp; &nbsp; &nbsp; &nbsp; <select");
			out.println("name='expenseId'>");
			out.println("<option value=''>Please Select Expense ID to delete</option>");

			int expenseId = 0;
			for (Expense expense : expenses) {
				expenseId = expense.getId();
				String text = null;
				text = expenseId+"--"+expense.getType()+"--"+expense.getDate()+"--"+expense.getTotal()+"--"+expense.getBywhom();
				out.println("<option value='" + expenseId + "'>" + text + "</option>");

			}
			out.println("</select> &nbsp;&nbsp;&nbsp;"
					+ "<input type = 'submit' value = 'Delete Expense' onclick=\"javascript: submitForm('deleteExpense')\">");
		}
		// Footer
		LayoutUtil.displayFooter(request, response);

	}
	@Override
	public void destroy() {

		ferService = null;
	}
}
