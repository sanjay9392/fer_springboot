package com.rs.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginHS")

public class LoginHttpServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginHttpServlet::doGet()");
		// 1.
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");

		// 2.
		boolean isValidUser = false;
		if ("sanjay".equals(username) && "rs".equals(pwd)) {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginHttpServlet::doPost()");
		// 1.
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");

		// 2.
		boolean isValidUser = false;
		if ("sanjay".equals(username) && "rs".equals(pwd)) {
			isValidUser = true;
		}
		// 3.
		PrintWriter out = response.getWriter();
		if (isValidUser) {
			out.println("Welcome to the user:" + username);
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("Dashboard.html");
			//requestDispatcher.include(request, response);
			
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("Dashboard.html");
			//requestDispatcher.forward(request, response);
			
			//Relative Path
			//response.sendRedirect("Dashboard.html");
			
			//Absolute Path
			 response.sendRedirect("http://localhost:8080/servlet_example/Dashboard.html");
		} else {
			out.println("Incorrect Username/Password...Please try again...");
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.html");
			//requestDispatcher.include(request, response);
			
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.html");
			//requestDispatcher.forward(request, response);
			
			//response.sendRedirect("Login.html");
			
			//Absolute Path
			 response.sendRedirect("http://localhost:8080/servlet_example/Login.html");
		}
		System.out.println("..........................................");

	}

}
