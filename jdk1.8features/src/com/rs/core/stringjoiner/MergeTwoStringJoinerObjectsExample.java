package com.rs.core.stringjoiner;

//importing StringJoiner class  

import java.util.StringJoiner;

public class MergeTwoStringJoinerObjectsExample {

	public static void main(String[] args) {

		StringJoiner joinNames = new StringJoiner(",", "[", "]"); // passing comma(,) and square-brackets as delimiter

		// Adding values to StringJoiner
		joinNames.add("Rahul");
		joinNames.add("Raju");
		System.out.println(joinNames);
		
		// Creating StringJoiner with :(colon) delimiter
		StringJoiner joinNames2 = new StringJoiner(":", "[", "]"); // passing colon(:) and square-brackets as delimiter

		// Adding values to StringJoiner
		joinNames2.add("Peter");
		joinNames2.add("Raheem");
		System.out.println(joinNames2);
		
		// Merging two StringJoiner
		StringJoiner merge = joinNames.merge(joinNames2);
		System.out.println(merge);
	}

}
