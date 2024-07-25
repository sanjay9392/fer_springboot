package com.rs.fer.main;

import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.util.ContextUtil;

public class RegistrationMain {

	public static void main(String[] args) {

		// 1.Get the input
		User user = new User();
		user.setFirstName("SANJAY");
		user.setMiddleName("KUMAR");
		user.setLastName("VASIREDDY");
		user.setEmail("sanjay@email.com");
		user.setUsername("sanjay");
		user.setPassword("rs");
		user.setMobile("1234567890");
		// 2.Call the service by passing the input
		FERService ferService =  ContextUtil.getFERService();
		boolean isRegister = ferService.registration(user);
		// 3.Shoe the status
		if (isRegister) {
			System.out.println("User Registration is done successfully.....! ");
		} else {
			System.out.println("User Registration is failed.....!");
		}
	}

}
