package com.rs.fer.main;

import com.rs.fer.service.FERService;
import com.rs.fer.util.ContextUtil;

public class ResetPasswordMain {

	public static void main(String[] args) {

		// 1.Get the input
	
		String newPassword = "rs123";
		String currentPassword = "rs";
		int id = 3;
		// 2.Call the service by passing the input
		FERService ferService =  ContextUtil.getFERService();
		boolean isResetPassword = ferService.resetPassword(newPassword,id,currentPassword);
		// 3.Shoe the status
		if (isResetPassword) {
			System.out.println("Password changed successfully.....! ");
		} else {
			System.out.println("Password reset is failed.....!");
		}
	}

}