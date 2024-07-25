package com.rs.fer.main;

import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class AddExpenseMain {

	public static void main(String[] args) {

		// 1.Get the input
		Expense expense = new Expense();
		expense.setType("coffee");
		expense.setDate("04-01-2024");
		expense.setPrice(15);
		expense.setNumberofitems(4);
		expense.setTotal(60);
		expense.setBywhom("me");
		expense.setUserid(1);
		
		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isAddExpense = ferService.addExpense(expense);
		// 3.Show the status
		if (isAddExpense) {
			System.out.println("Expense is added successfully.....! ");
		} else {
			System.out.println("Addd Expense is failed.....!");
		}
	}

}
