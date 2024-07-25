package com.rs.fer.main;

import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class LoginMain {

	public static void main(String[] args) {

		// 1.Get the input
	
		String username = "Sanjay";
		String password = "rs";
		// 2.Call the service by passing the input
		FERService ferService = new FERServiceImpl();
		boolean isValidUser = ferService.login(username, password);
		// 3.Shoe the status
		if (isValidUser) {
			System.out.println("Welcome to the user:Sanjay.....! ");
		} else {
			System.out.println("Incorrect Username/Password...Please try again.....!");
		}
	}

} 
