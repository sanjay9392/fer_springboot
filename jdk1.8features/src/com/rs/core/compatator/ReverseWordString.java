package com.rs.core.compatator;

public class ReverseWordString {

	public static String reverseWord(String str) {
	 String words[] = str.split(" ");
		String reverseWord = "";
		for (String w : words) {
			StringBuilder sb = new StringBuilder(w);
			sb.reverse();
			reverseWord += sb.toString() + " ";
		}
		return reverseWord.trim();
	}

	public static void main(String[] args) {
		String s1 = "This is is Sample String String Example Sample Example";

		System.out.println(ReverseWordString.reverseWord(s1));
	}

}
