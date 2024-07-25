package com.rs.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/loginGS")
public class LoginGenericServlet extends GenericServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("LoginGenericServlet::init()");

	}

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		System.out.println("LoginGenericServlet::service()");
		// 1.
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");

		// 2.
		boolean isValidUser = false;
		if ("sanjay".equals(username) && "rs".equals(pwd))
		{
			isValidUser = true;
		}
		// 3.
		PrintWriter out = response.getWriter();
		if (isValidUser) {
			out.println("Welcome to the user:" + username);
		} else {
			out.println("Incorrect Username/Password...Please try again...");
		}
		System.out.println("..........................................");
	}

	@Override
	public void destroy() {
		System.out.println("LoginGenericServlet::destroy()");
	}
}
