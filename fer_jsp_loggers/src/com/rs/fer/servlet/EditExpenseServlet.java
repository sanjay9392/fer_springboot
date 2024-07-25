package com.rs.fer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/editExpense")

public class EditExpenseServlet extends HttpServlet {
	FERService ferService = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
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
		Expense expense = new Expense();
		expense.setType(request.getParameter("type"));
		expense.setDate(request.getParameter("date"));
		expense.setPrice(Float.parseFloat(request.getParameter("price")));
		expense.setNumberofitems(Integer.parseInt(request.getParameter("numberOfItems")));
		expense.setTotal(Float.parseFloat(request.getParameter("total")));
		expense.setBywhom(request.getParameter("byWhom"));
		int expenseId = Integer.parseInt(session.getAttribute("expenseId").toString());
		expense.setId(expenseId);

		// 2.Call the service by passing the input
		boolean isEditExpense = ferService.editExpense(expense);
		// 3.Show the status
		if (isEditExpense) {
			out.println("Expense is updated successfully.....! ");
		} else {
			out.println(" Expense updation is failed.....!");
		}

		// Footer

		LayoutUtil.displayFooter(request, response);

	}

	@Override
	public void destroy() {
		ferService = null;
	}

}
