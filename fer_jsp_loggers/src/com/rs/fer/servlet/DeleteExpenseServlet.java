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

@WebServlet("/deleteExpense")

public class DeleteExpenseServlet extends HttpServlet {
	
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
		
        int expenseid = Integer.parseInt(request.getParameter("expenseId"));
		
		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isDeleteExpense = ferService.deleteExpense(expenseid);
		// 3.Show the status
		if (isDeleteExpense) {
			out.println("Expense deleted successfully.....! ");
		} else {
			out.println("Expense deletion  failed.....!");
		}
		
		LayoutUtil.displayFooter(request, response);
	}


	
	@Override
	public void destroy() {

		ferService = null;
	}
}
