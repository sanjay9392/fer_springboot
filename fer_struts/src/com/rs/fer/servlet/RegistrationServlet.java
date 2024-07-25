package com.rs.fer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

@WebServlet("/registration")

public class RegistrationServlet extends HttpServlet {
	FERService ferService = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		ferService = new FERServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.Get the input

		User user = new User();
		user.setFirstName(request.getParameter("firstName"));
		user.setMiddleName(request.getParameter("middleName"));
		user.setLastName(request.getParameter("lastName"));
		user.setEmail(request.getParameter("email"));
		user.setUsername(request.getParameter("userName"));
		user.setPassword(request.getParameter("password"));
		user.setMobile(request.getParameter("mobile"));

		// 2.Call the service by passing the input

		boolean isRegister = ferService.registration(user);

		// 3.Show the status

		PrintWriter out = response.getWriter();
		String path = null;
		if (isRegister) {
			out.println("User Registration is done successfully.....! ");
			path = "Login.html";

		} else {
			out.println("User Registration is failed.....!");
			path = "Registration.html";
		}
		request.getRequestDispatcher(path).include(request, response);

	}

	@Override
	public void destroy() {
		ferService = null;
	}

}