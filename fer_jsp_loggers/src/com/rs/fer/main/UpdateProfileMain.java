package com.rs.fer.main;

import com.rs.fer.bean.Address;
import com.rs.fer.bean.Expense;
import com.rs.fer.bean.User;
import com.rs.fer.service.FERService;
import com.rs.fer.service.impl.FERServiceImpl;

public class UpdateProfileMain {

	public static void main(String[] args) {

		// 1.Get the input

		int userId = 1;

		FERService ferService = new FERServiceImpl();
		User user = ferService.getUser(userId);

		// Name.Info
		user.setFirstName("SANJAY");
		user.setMiddleName("KUMAR");
		user.setLastName("VASIREDDY");

		// Contact Info
		user.setEmail("SANJAY@MAIL");
		user.setMobile("9392456355");

		// AddressInfo
		Address address = user.getAddress();
		address.setLine1("100FT ROAD");
		address.setLine2("MADHAPUR");
		address.setCity("HYDERABAD");
		address.setState("TG");
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
