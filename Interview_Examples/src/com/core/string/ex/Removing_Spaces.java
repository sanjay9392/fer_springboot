package com.core.string.ex;

public class Removing_Spaces {

	public static void main(String[] args) {
		String str = "Removing all the white spaces";
		str = str.replaceAll("\\s+", "");
		System.out.println("String after removing all the white spaces : " + str);
		
	}

}
