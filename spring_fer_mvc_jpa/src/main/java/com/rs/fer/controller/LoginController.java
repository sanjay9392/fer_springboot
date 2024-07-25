package com.rs.fer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.service.FERService;

@Controller
public class LoginController {
	@Autowired
	FERService ferService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("Login");
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView authenticateUser(@RequestParam String username, @RequestParam String password,
			HttpServletRequest request) {

		// 2.Get the Service by passing the input
		int userId = ferService.login(username, password);

		// 3.Show the status
		String viewName = null;
		HttpSession session = request.getSession();
		if (userId > 0) {
			session.setAttribute("username", username);
			session.setAttribute("userId", userId);

			// Body
			session.setAttribute("status", "Welcome to the user:" + username + "!");

			viewName = "Dashboard";
		} else {
			session.setAttribute("status", "Incorrect Username/Password...Please try again.....!");
			viewName = "Login";
		}
		return new ModelAndView(viewName);
	}
}
