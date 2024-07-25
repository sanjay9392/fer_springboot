package com.rs.fer.main;

import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class ResetPasswordMain {

	public static void main(String[] args) {

		// 1.Get the input
	
		String newPassword = "qwe";
		String currentPassword = "1234";
		int id = 3;
		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isResetPassword = ferService.resetPassword(id,newPassword,currentPassword);
		// 3.Show the status
		if (isResetPassword) {
			System.out.println("Password changed successfully.....! ");
		} else {
			System.out.println("Password reset is failed.....!");
		}
	}

}
