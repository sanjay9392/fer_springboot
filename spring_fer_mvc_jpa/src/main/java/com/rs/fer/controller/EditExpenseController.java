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
public class EditExpenseController {
	@Autowired
	FERService ferService;

	@RequestMapping(value = "/showEditExpenseOptions", method = RequestMethod.POST)
	public ModelAndView displayOptions(HttpServletRequest request) {
		// 1.Get the input
		HttpSession session = request.getSession();
		int userId = Integer.parseInt(session.getAttribute("userId").toString());

		// 2.Call the service by passing the input
		List<Expense> expenses = ferService.getExpenseOptions(userId);
		session.setAttribute("expenses", expenses);

		// 3.
		return new ModelAndView("EditExpenseOptions");
	}

	@RequestMapping(value = "/showEditExpense", method = RequestMethod.POST)
	public ModelAndView displayEditExpense(HttpServletRequest request, @RequestParam int expenseId) {
		// 1.Get the input
		HttpSession session = request.getSession();

		// load the expenseId into session object
		session.setAttribute("expenseId", expenseId);

		// 2.Call the service by passing the input
		Expense expense = ferService.getExpense(expenseId);
		session.setAttribute("expense", expense);
		return new ModelAndView("EditExpense");
	}

	@RequestMapping(value = "/editExpense", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute Expense expense, HttpServletRequest request) {

		HttpSession session = request.getSession();
		Expense expenseDB = (Expense) session.getAttribute("expense");

		expense.setUserId(expenseDB.getUserId());
		expense.setId(expenseDB.getId());

		// 2.Call the service by passing the input
		boolean isEditExpense = ferService.editExpense(expense);

		// 3.Show the status
		if (isEditExpense) {
			session.setAttribute("status", "Expense is added successfully.....! ");
		} else {
			session.setAttribute("status", "Add Expense is failed.....!");
		}
		return new ModelAndView("Dashboard");
	}
}
