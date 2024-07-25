package com.core.string.ex;

public class String_Rotation_Ex {
	public static boolean areRotations(String str1, String str2) {
		if (str1.length() != str2.length()) {
			return false;
		}
		String combinedStr = str1 + str2; // Concatenate str1 twice
		return combinedStr.contains(str2); // Check if str2 is a substring of the combined string
	}

	public static void main(String[] args) {
		String str1 = "apple";
		String str2 = "leapp";
		if (areRotations(str1, str2)) {
			System.out.println(str1 + " and " + str2 + " are Rotations");
		} else {
			System.out.println(str1 + " and " + str2 + " are not Rotations");

		}
	}

}
