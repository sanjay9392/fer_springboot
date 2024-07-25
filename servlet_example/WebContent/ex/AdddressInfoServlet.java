package com.rs.servlet.userstate.session.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addressInfoS")
public class AdddressInfoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 1.Get the input and print it in the console view
		String fullname = (String) session.getAttribute("fullname");
		System.out.println("AddressInfoServlet::Full Name:" + fullname);

		String mobile = (String) session.getAttribute("mobile");
		System.out.println("AddressInfoServlet::Mobile:" + mobile);

		String city =  request.getParameter("city");
		System.out.println("AddressInfoServlet::City:" + city);

		System.out.println("...................................");

		// 2.

		// 3.Display
		PrintWriter out = response.getWriter();
		out.println("Review Update Profile");
		out.println("<BR>");

		out.println("FullName:" + fullname);
		out.println("<BR>");

		out.println("Mobile:" + mobile);
		out.println("<BR>");

		out.println("City:" + city);
		out.println("<BR>");

	}

}
