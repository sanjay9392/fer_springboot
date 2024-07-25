package com.core.Palindrome;

public class Palindromes_InBetween_Ex {
	public static boolean isPalindrome(int n) {
		int temp = n;
		int r, sum = 0;
		
		while(n > 0) {
			r = n % 10;
			n = n / 10;
			sum = (sum * 10) + r;
		}
		if(temp == sum) {
			return true;
		}
		return false;
	}

	public static void main(String[] args) {
		int a = 100;
		int b = 1000;
		for(int n = a;n <= b;n++) {
			if(isPalindrome(n)) {
				System.out.print(n + " ");
			}
		}
		
		
	}

}
