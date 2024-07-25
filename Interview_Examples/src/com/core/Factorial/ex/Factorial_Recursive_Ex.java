package com.core.Factorial.ex;

public class Factorial_Recursive_Ex {
	public static int factorial(int n) {
		if (n == 0) {
			return 1;
		}
		return n * factorial(n - 1);
	}

	public static void main(String[] args) {
		int num = 6;
		int result = factorial(num);
		System.out.println("The Factorial of " + num + " is : " + result);

	}

}
