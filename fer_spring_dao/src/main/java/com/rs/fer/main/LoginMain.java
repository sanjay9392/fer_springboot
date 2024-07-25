package com.rs.fer.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rs.fer.service.FERService;

public class LoginMain {

	public static void main(String[] args) {

		// 1.Get the input

		String username = "Sanjay";
		String password = "SANJAY";
		// 2.Call the service by passing the input
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FERService ferService = (FERService) context.getBean("ferService");
		boolean isValidUser = ferService.login(username, password);
		// 3.Show the status
		if (isValidUser) {
			System.out.println("Welcome to the user:" + username + ".....! ");
		} else {
			System.out.println("Incorrect Username/Password...Please try again.....!");
		}
	}

}
