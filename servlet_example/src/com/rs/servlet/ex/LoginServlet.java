package com.rs.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/login")
public class LoginServlet implements Servlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("LoginServlet::init()");

	}

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		System.out.println("LoginServlet::service()");
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
		System.out.println("LoginServlet::destroy()");
	}

	@Override
	public ServletConfig getServletConfig() {
		System.out.println("LoginServlet::getServletConfig()");
		return null;
	}

	@Override
	public String getServletInfo() {
		System.out.println("LoginServlet::getServletInfo()");
		return null;
	}

}
