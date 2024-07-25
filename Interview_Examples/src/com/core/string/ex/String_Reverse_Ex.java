package com.core.string.ex;

public class String_Reverse_Ex {

	public static void main(String[] args) {
		String s = "sanjay";
		String r = "";
		for (int i = s.length() - 1; i >= 0; i--) {
			r += s.charAt(i);
		}
		System.out.println(r);
	}

}
