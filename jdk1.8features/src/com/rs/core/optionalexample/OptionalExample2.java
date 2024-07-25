package com.rs.core.optionalexample;

import java.util.Optional;

// If Value is Present
public class OptionalExample2 {
	public static void main(String[] args) {
		String[] names = {"naresh", "vinay", "sai","rohith","Dilep","sharuk"};
		Optional<String> opt = Optional.ofNullable(names[3]);
		opt.ifPresent(s -> System.out.println(s));
	}
}