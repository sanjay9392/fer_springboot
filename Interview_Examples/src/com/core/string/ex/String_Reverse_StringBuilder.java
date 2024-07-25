package com.core.string.ex;

public class String_Reverse_StringBuilder {

	public static void main(String[] args) {
		String s = "sanjay ";
		StringBuilder stringBuilder = new StringBuilder(s);
		stringBuilder.reverse();
		System.out.println(stringBuilder);
	}

}
