package com.core.Factorial.ex;

public class Factorial_Ex_While {

	public static void main(String[] args) {
		int n = 5;
		int factorial = 1;
		int i = 1;

		while (i <= n) {
			factorial *= i;
			i++;
		}
		System.out.println("The Factorial of " + n + " is : " + factorial);
	}

}
