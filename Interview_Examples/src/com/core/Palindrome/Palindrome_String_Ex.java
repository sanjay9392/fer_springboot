package com.core.Palindrome;

public class Palindrome_String_Ex {

	public static void main(String[] args) {
		// o = original string
		// r = reversed string
		String o = "madam";
		String r = "";
		
		for(int i = o.length() - 1;i >= 0;i--) {
			r += o.charAt(i);
			System.out.println(r);
		}
		if(o.equals(r)) {
			System.out.println(o+" is a palindrome");
		}else {
			System.out.println(o+" is not a palindrome");

		}
	}

}
