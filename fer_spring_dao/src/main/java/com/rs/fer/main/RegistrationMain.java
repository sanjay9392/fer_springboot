package com.rs.fer.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;

public class RegistrationMain {

	public static void main(String[] args) {

		// 1.Get the input
		User user = new User();
		user.setFirstName("Sanjay");
		user.setMiddleName("kumar");
		user.setLastName("Vasireddy");
		user.setEmail("info@gmail.com");
		user.setUsername("sanjay");
		user.setPassword("rs");
		user.setMobile("9392414122");
		// 2.Call the service by passing the input
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FERService ferService = (FERService) context.getBean("ferService");
		boolean isRegister = ferService.registration(user);
		// 3.Shoe the status
		if (isRegister) {
			System.out.println("User Registration is done successfully.....! ");
		} else {
			System.out.println("User Registration is failed.....!");
		}
	}

}
