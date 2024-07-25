package com.core.string.ex;

public class Finding_Duplicates {

	public static void main(String[] args) {
		String s = "sanjay";
		char[] array = s.toCharArray();
		System.out.println("The String is: " + s);
		System.out.print("The Duplicate elements are : ");
		for (int i = 0; i < s.length(); i++) {
			for (int j = i + 1; j < s.length(); j++) {
				if (array[i] == array[j]) {
					System.out.println(array[j] + "");
					break;
				}
			}
		}
	}

}
