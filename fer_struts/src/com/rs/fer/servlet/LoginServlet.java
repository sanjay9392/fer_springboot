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

import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;
import com.rs.fer.util.LayoutUtil;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {
	FERService ferService = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		ferService = new FERServiceImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.Get the input

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//2.Get the Service by passing the input
		int userId = ferService.login(username, password);
		// 3.Show the status
		PrintWriter out = response.getWriter();
		if (userId > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("userId",userId);
			
			/*//Header
			request.getRequestDispatcher("Layout/Header.html").include(request, response);
			out.println(session.getAttribute("username"));
			//Left Frame
			request.getRequestDispatcher("Layout/LeftFrame.html").include(request, response);*/
			LayoutUtil.displayHeaderAndLeftFrame(request, response, out, session);
			
			// Body
			out.println("Welcome to the user:" + username + "!");
			
			/*//Footer
			request.getRequestDispatcher("Layout/Footer.html").include(request, response);*/
			LayoutUtil.displayFooter(request, response);
			
		} else {
			out.println("Incorrect Username/Password...Please try again.....!");
			request.getRequestDispatcher("Login.html").include(request, response);
		}
	}

	@Override
	public void destroy() {
		ferService = null;
	}

}
