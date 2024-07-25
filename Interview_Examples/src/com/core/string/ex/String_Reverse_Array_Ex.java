package com.core.string.ex;

public class String_Reverse_Array_Ex {

	public static void main(String[] args) {
		String s = "sanjay";
		char[] array = s.toCharArray();
		for (int i = array.length - 1; i >= 0; i--) {
			System.out.print(array[i]);
		}
	}

}
