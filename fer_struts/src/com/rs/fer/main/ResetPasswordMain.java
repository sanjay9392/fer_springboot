package com.rs.fer.main;

import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class ResetPasswordMain {

	public static void main(String[] args) {

		// 1.Get the input
	
		String newPassword = "Sanjay";
		String currentPassword = "SANJAY";
		int id = 2;
		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isResetPassword = ferService.resetPassword(newPassword,id,currentPassword);
		// 3.Shoe the status
		if (isResetPassword) {
			System.out.println("Password changed successfully.....! ");
		} else {
			System.out.println("Password reset is failed.....!");
		}
	}

}
