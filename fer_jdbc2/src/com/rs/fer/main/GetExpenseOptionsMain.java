package com.rs.fer.main;

import java.util.List;

import com.rs.fer.bean.Expense;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class GetExpenseOptionsMain {

	public static void main(String[] args) {

		// 1.Get the input

		int userId = 1;

		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		List<Expense> expenses = ferService.getExpenseOptions(userId);
		// 3.Show the status
		if (expenses.isEmpty()) {
			System.out.println("Expense is not found");
		} else {
			for (Expense expense : expenses) {
				System.out.println("ID:" + expense.getId());
				System.out.println("Expense Type:" + expense.getType());
				System.out.println("Date:" + expense.getDate());
				System.out.println("Price:" + expense.getPrice());
				System.out.println("Number Of Items:" + expense.getNumberofitems());
				System.out.println("Total:" + expense.getTotal());
				System.out.println("By Whom:" + expense.getBywhom());
				System.out.println("UserID:" + expense.getUserid());

				System.out.println("..............................................");
			}
		}
	}

}
