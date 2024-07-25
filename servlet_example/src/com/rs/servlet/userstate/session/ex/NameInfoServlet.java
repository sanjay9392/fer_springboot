package com.rs.servlet.userstate.session.ex;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/nameInfoS")
public class NameInfoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.Get the input and print it in the console view
		String fullname = request.getParameter("fullname");
		System.out.println("NameInfoServlet::FullName:" + fullname);
		System.out.println(".........................................");

		// 2.Load the attribute into the session object
		HttpSession session = request.getSession();
		session.setAttribute("fullname", fullname);

		// 3.Redirect
		response.sendRedirect("ContactInfo.html");
	}

}
