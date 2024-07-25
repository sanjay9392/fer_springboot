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

@WebServlet("/resetPassword")

public class ResetPasswordServlet extends HttpServlet {
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

		int id = Integer.parseInt(session.getAttribute("userId").toString());
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");

		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isResetPassword = ferService.resetPassword(id, currentPassword, newPassword);
		// 3.Show the status
		if (isResetPassword) {
			out.println("Password changed successfully.....! ");
		} else {
			out.println("Password change is failed.....!");
		}

		// Footer

		LayoutUtil.displayFooter(request, response);

	}

	@Override
	public void destroy() {
		ferService = null;
	}

}
