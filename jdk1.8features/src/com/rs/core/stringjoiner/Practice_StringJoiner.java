package com.rs.core.stringjoiner;

import java.util.StringJoiner;

public class Practice_StringJoiner {

	public static void main(String[] args) {
		
		StringJoiner stringJoiner = new StringJoiner(" ");
		System.out.println(stringJoiner+", "+stringJoiner.hashCode());
		
		stringJoiner.add("Rahul");
		stringJoiner.add("Raju");
		stringJoiner.add("Peter");
		stringJoiner.add("Raheem");
		
		System.out.println(stringJoiner+", "+stringJoiner.hashCode());
		
		StringJoiner stringJoiner1 = new StringJoiner("," , "{" , "}");
		System.out.println(stringJoiner1+", "+stringJoiner1.hashCode());
		
		stringJoiner1.add("Rahul");
		stringJoiner1.add("Raju");
		stringJoiner1.add("Peter");
		stringJoiner1.add("Raheem");
		
		System.out.println(stringJoiner1+", "+stringJoiner1.hashCode());
		String string =  stringJoiner1.toString();
		//stringJoiner1=stringJoiner1.concat("Rahul");
		System.out.println(string+", "+string.hashCode());
		
	}

}
