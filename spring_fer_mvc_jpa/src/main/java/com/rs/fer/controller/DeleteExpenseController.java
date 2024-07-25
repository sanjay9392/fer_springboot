package com.rs.fer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rs.fer.bean.Expense;
import com.rs.fer.service.FERService;

@Controller
public class DeleteExpenseController {
	@Autowired
	FERService ferService;

	@RequestMapping(value = "/showDeleteExpenseOptions", method = RequestMethod.POST)
	public ModelAndView displayOptions(HttpServletRequest request) {
		// 1.Get the input
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		// 2.Call the service by passing the input
		List<Expense> expenses = ferService.getExpenseOptions(userId);
		session.setAttribute("expenses", expenses);
		
		//3.
		return new ModelAndView("DeleteExpenseOptions");
	}
	
	@RequestMapping(value = "/deleteExpense", method = RequestMethod.POST)
	public ModelAndView delete(@RequestParam int expenseId, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setAttribute("expenseId", expenseId);
		
		// 2.Call the service by passing the input
		boolean isDeleteExpense = ferService.deleteExpense(expenseId);

		// 3.Show the status
		if (isDeleteExpense) {
			session.setAttribute("status", "Expense is deleted successfully.....! ");
		} else {
			session.setAttribute("status", "Delete Expense is failed.....!");
		}
		return new ModelAndView("Dashboard");
	}
}

