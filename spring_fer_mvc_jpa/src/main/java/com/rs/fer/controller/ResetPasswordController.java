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
public class ResetPasswordController {
	@Autowired
	FERService ferService;

	@RequestMapping(value = "/showResetPassword", method = RequestMethod.POST)
	public ModelAndView display() {
		return new ModelAndView("ResetPassword");
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public ModelAndView reset(@RequestParam String currentPassword, @RequestParam String newPassword,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("userId").toString());

		// 2.Call the service by passing the input
		boolean isResetPassword = ferService.resetPassword(newPassword, id, currentPassword);

		// 3.Show the status
		if (isResetPassword) {
			session.setAttribute("status", "Password changed successfully.....! ");
		} else {
			session.setAttribute("status", "Password Update is failed.....!");
		}
		return new ModelAndView("Dashboard");
	}
}
