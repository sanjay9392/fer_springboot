package com.rs.core.optionalexample;

import java.util.Optional;

// If Value is not Present
public class OptionalExample1 {
	public static void main(String[] args) {
		String[] names = new String[5];
		Optional<String> opt = Optional.ofNullable(names[4]);
		if (opt.isPresent())  
			// check for value is present or not
			System.out.print(names[4]);
		 else
			System.out.println(" value is null");
	}
}
