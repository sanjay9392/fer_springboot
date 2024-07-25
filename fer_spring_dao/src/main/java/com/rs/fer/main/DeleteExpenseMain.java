package com.rs.fer.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rs.fer.service.FERService;

public class DeleteExpenseMain {

	public static void main(String[] args) {

		// 1.Get the input
		int expenseid = 69;

		// 2.Call the service by passing the input
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FERService ferService = (FERService) context.getBean("ferService");
		boolean isDeleteExpense = ferService.deleteExpense(expenseid);
		// 3.Show the status
		if (isDeleteExpense) {
			System.out.println("Expense deleted successfully.....! ");
		} else {
			System.out.println("Expense deletion  failed.....!");
		}
	}

}
