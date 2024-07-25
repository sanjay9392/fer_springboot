package com.rs.servlet.userstate.cookie.ex;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contactInfoC")
public class ContactInfoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.Get the input and print it in the console view
		String fullname = request.getParameter("fullname");
		System.out.println("ContactInfoServlet::FullName:" + fullname);

		String mobile = request.getParameter("mobile");
		System.out.println("ContactInfoServlet::Mobile:" + mobile);

		// 2.Create and add cookie into the local object
		Cookie cookie = new Cookie("mobile", mobile);
		response.addCookie(cookie);

		// 3.Redirect
		response.sendRedirect("AddressInfo.html");
	}

}
