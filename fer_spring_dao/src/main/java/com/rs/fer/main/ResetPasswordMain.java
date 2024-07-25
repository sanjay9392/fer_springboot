package com.rs.fer.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rs.fer.service.FERService;

public class ResetPasswordMain {

	public static void main(String[] args) {

		// 1.Get the input

		String newPassword = "SANJAY";
		String currentPassword = "rs";
		int id = 58;
		// 2.Call the service by passing the input
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FERService ferService = (FERService) context.getBean("ferService");
		boolean isResetPassword = ferService.resetPassword(newPassword, id, currentPassword);
		// 3.Shoe the status
		if (isResetPassword) {
			System.out.println("Password changed successfully.....! ");
		} else {
			System.out.println("Password reset is failed.....!");
		}
	}

}
