package com.core.string.ex;

import java.util.Arrays;

public class Anagram_Check_Ex {

	public static void main(String[] args) {
		String str1 = "Race";
		String str2 = "Care";
		if (isAnagram(str1, str2)) {
			System.out.println(str1 + " and " + str2 + " are Anagarams");
		} else {
			System.out.println(str1 + " and " + str2 + " are not Anagarams");

		}
	}

	private static boolean isAnagram(String str1, String str2) {
		if (str1.length() != str2.length()) {
			return false;
		}
		char[] array1 = str1.toLowerCase().toCharArray();
		char[] array2 = str2.toLowerCase().toCharArray();
		Arrays.sort(array1);
		Arrays.sort(array2);
		return Arrays.equals(array1, array2);
	}

}
