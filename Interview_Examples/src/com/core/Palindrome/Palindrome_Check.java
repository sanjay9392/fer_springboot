package com.core.Palindrome;

public class Palindrome_Check {
	public static void main(String []args) {
		int n = 121;
		int temp = n;
		int r , sum = 0;
		while(n > 0) {
			r = n % 10;
			n = n / 10;
			sum = (sum * 10) + r;
		}
		if(temp == sum) {
			System.out.println(" Palindrome");
		}else {
			System.out.println(" Not a Palindrome");
		}
	}
}
	
