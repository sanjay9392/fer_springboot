package com.rs.fer.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;

public class UpdateProfileMain {

	public static void main(String[] args) {

		// 1.Get the input

		int userId = 58;

		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		FERService ferService = (FERService) context.getBean("ferService");
		User user = ferService.getUser(userId);

		// Name.Info
		user.setFirstName("Sanjay");
		user.setMiddleName("kumar");
		user.setLastName("VASIREDDY");

		// Contact Info
		user.setEmail("SANJAY@MAIL");
		user.setMobile("9392456355");

		// AddressInfo
		Address address = user.getAddress();
		address.setLine1("100FT");
		address.setLine2("MADHAPUR");
		address.setCity("HYDERABAD");
		address.setState("TS");
		address.setPinCode("89893");
		address.setCountry("IND");

		// 2.Call the service by passing the input
		boolean isUpdateProfile = ferService.updateUser(user);

		// show the status
		if (isUpdateProfile) {
			System.out.println("Profile Updated successfully.....! ");
		} else {
			System.out.println("Profile Updation is failed.....!");
		}

	}

}
