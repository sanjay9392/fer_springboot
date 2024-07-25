package com.rs.fer.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;

public class GetUserMain {

	public static void main(String[] args) {

		// 1.Get the input

		int userId = 58;

		// 2.Call the service by passing the input
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FERService ferService = (FERService) context.getBean("ferService");
		User user = ferService.getUser(userId);
		// 3.Show the status
		if (user == null) {
			System.out.println("User is not found");
		} else {
			System.out.println("............Name Info...........");

			System.out.println("FirstName:" + user.getFirstName());
			System.out.println("MiddleName:" + user.getMiddleName());
			System.out.println("LastName:" + user.getLastName());

			System.out.println("............Contact Info...........");

			System.out.println("Email:" + user.getEmail());
			System.out.println("Mobile:" + user.getMobile());

			System.out.println("............Address Info...........");

			Address address = user.getAddress();
			System.out.println("Line 1:" + address.getLine1());
			System.out.println("Line 2:" + address.getLine2());
			System.out.println("City:" + address.getCity());
			System.out.println("State:" + address.getState());
			System.out.println("Pin Code:" + address.getPinCode());
			System.out.println("Country:" + address.getCountry());
		}
	}

}
