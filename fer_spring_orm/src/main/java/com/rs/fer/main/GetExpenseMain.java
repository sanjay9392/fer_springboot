package com.rs.fer.main;


import com.rs.fer.bean.Expense;
import com.rs.fer.service.FERService;
import com.rs.fer.util.ContextUtil;

public class GetExpenseMain {

	public static void main(String[] args) {

		// 1.Get the input

		int expenseId = 5;

		// 2.Call the service by passing the input
		FERService ferService =  ContextUtil.getFERService();
		Expense expense = ferService.getExpense(expenseId);
		// 3.Show the status
		if (expense==null) {
			System.out.println("Expense is not found");
		} else {
				System.out.println("ID:" + expense.getId());
				System.out.println("Expense Type:" + expense.getType());
				System.out.println("Date:" + expense.getDate());
				System.out.println("Price:" + expense.getPrice());
				System.out.println("Number Of Items:" + expense.getNumberofitems());
				System.out.println("Total:" + expense.getTotal());
				System.out.println("By Whom:" + expense.getBywhom());
				System.out.println("UserID:" + expense.getUserId());

				System.out.println("..............................................");
			}
		}
	}

