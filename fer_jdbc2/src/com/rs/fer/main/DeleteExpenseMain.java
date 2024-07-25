package com.rs.fer.main;

import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class DeleteExpenseMain {

	public static void main(String[] args) {

		// 1.Get the input
		int expenseid = 5;
		
		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isDeleteExpense = ferService.deleteExpense(expenseid);
		// 3.Show the status
		if (isDeleteExpense) {
			System.out.println("Expense deleted successfully.....! ");
		} else {
			System.out.println("Expense deletion  failed.....!");
		}
	}

}
