package com.rs.servlet.userstate.cookie.ex;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/nameInfoC")
public class NameInfoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.Get the input and print it in the console view
		String fullname = request.getParameter("fullname");
		System.out.println("NameInfoServlet::FullName:" + fullname);
		System.out.println(".........................................");

		// 2.Create and add cookie into the local object
		Cookie cookie = new Cookie("fullname", fullname);
		response.addCookie(cookie);
		// 3.Redirect
		response.sendRedirect("ContactInfo.html");
	}

}
