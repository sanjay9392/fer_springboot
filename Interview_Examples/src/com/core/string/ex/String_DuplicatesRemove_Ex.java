package com.core.string.ex;

public class String_DuplicatesRemove_Ex {

	public static void main(String[] args) {
		String s = "sanjay";
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < s.length(); i++) {
			if (sb.toString().indexOf(s.charAt(i)) == -1) {
				sb.append(s.charAt(i));
			}
		}
		System.out.println(sb.toString());
	}

}
