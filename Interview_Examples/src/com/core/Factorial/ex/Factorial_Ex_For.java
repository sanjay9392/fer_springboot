package com.core.Factorial.ex;

public class Factorial_Ex_For {

	public static void main(String[] args) {
		int n = 5;
		int factorial = 1;

		for (int i = 1; i <= n; i++) {
			factorial *= i;
		}
		System.out.println("The Factorial of " + n + " is : " + factorial);

	}

}
