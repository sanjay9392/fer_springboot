package com.core.string.ex;

public class Non_Repeating_Char {

	public static void main(String[] args) {
		// Find first non repeating character in a string
		String str = "sanjay";

		System.out.println("The given string is : " + str);

		for (int i = 0; i < str.length(); i++) {
			boolean unique = true; // Assume the character at index 'i' is unique initially.

			for (int j = 0; j < str.length(); j++) {
				// Check if the characters at positions 'i' and 'j' are the same but not at the
				// same index.

				if (i != j && str.charAt(i) == str.charAt(j)) {
					// If found, set unique to false and break the loop.
					unique = false;
					break;
				}
			}
			if (unique) {
				System.out.println("The first non-repeated character in the String is: " + str.charAt(i));
				break;
			}
		}

	}

}
