package com.core.fibonacci.approaches;

public class Fibonacci_Recursive_Ex {

	public static void main(String[] args) {
		int n = 10;
		System.out.print("Fibonacci Series(Recursive):");
		for (int i = 0; i < n; i++) {
			System.out.print(fibonacci(i) + " ");
		}

	}

	private static int fibonacci(int n) {
		if (n <= 1) {
			return n;
		} else {
			return (fibonacci(n - 1) + fibonacci(n - 2));
		}
	}

}
