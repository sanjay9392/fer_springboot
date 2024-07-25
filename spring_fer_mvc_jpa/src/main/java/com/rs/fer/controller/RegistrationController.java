package com.rs.fer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;

@Controller
public class RegistrationController {
	@Autowired
	FERService ferService;

	@RequestMapping(value = "/showRegistration", method = RequestMethod.GET)
	public ModelAndView Register() {
		return new ModelAndView("Registration");
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView RegisterUser(@ModelAttribute User user, HttpServletRequest request) {

		// 2.Call the service by passing the input

		boolean isRegister = ferService.registration(user);

		// 3.Show the status
		HttpSession session = request.getSession();
		String viewName = null;
		if (isRegister) {
			session.setAttribute("status", "User Registration is done successfully.....! ");
			viewName = "Login";

		} else {
			session.setAttribute("status", "User Registration is failed.....!");
			viewName = "Registration";
		}
		return new ModelAndView(viewName);
	}
}
