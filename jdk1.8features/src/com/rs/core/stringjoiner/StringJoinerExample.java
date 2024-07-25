package com.rs.core.stringjoiner;

//importing StringJoiner class  

import java.util.StringJoiner;

public class StringJoinerExample {

	public static void main(String[] args) {

		StringJoiner joinNames = new StringJoiner(",","[","]"); // passing comma(,) as delimiter
		System.out.println(joinNames+", "+joinNames.hashCode());
		// Adding values to StringJoiner
		joinNames.add("Rahul");
		joinNames.add("Raju");
		joinNames.add("Peter");
		joinNames.add("Raheem");

		System.out.println(joinNames+", "+joinNames.hashCode());
		
		String names = "";
		System.out.println(names+", "+names.hashCode());

		names = names.concat("Rahul").concat(",");
		names = names.concat("Raju").concat(",");
		names = names.concat("Peter").concat(",");
		names = names.concat("Raheem").concat(",");
		System.out.println(names+", "+names.hashCode());

		String object = new String("");
		System.out.println(object+", "+object.hashCode());
		object = object.concat("Rahul");
		System.out.println(object+", "+object.hashCode());
		object = object.concat(",");
		System.out.println(object+", "+object.hashCode());
		object = object.concat("Raju");
		System.out.println(object+", "+object.hashCode());
		object = object.concat(",");
		System.out.println(object+", "+object.hashCode());
		object = object.concat("Peter");
		System.out.println(object+", "+object.hashCode());
		object = object.concat(",");
		System.out.println(object+", "+object.hashCode());
		object = object.concat("Raheem");
		System.out.println(object+", "+object.hashCode());
		object = object.concat(",");
		
		System.out.println(object);
	}

}
