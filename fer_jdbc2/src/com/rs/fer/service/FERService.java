package com.rs.fer.service;

import java.util.List;

import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;

public interface FERService {
	boolean registration(User user);

	boolean login(String username, String password);

	boolean addExpense(Expense expense);

	boolean editExpense(Expense expense);

	boolean deleteExpense(int id);

	boolean resetPassword(int id, String newPassword, String currrentPassword);

	List<Expense> getExpenseOptions(int userId);

	Expense getExpense(int expenseId);

	List<Expense> getExpenseReport(int userId, String expenseType, String fromDate, String toDate);
	
	User getUser(int userId);
	
	boolean updateUser(User user);
	
}