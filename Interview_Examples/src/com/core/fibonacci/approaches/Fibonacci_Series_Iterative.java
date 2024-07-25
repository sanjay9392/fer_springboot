package com.core.fibonacci.approaches;

public class Fibonacci_Series_Iterative {

	public static void main(String[] args) {
		int n = 15, f1 = 0, f2 = 1;
		System.out.print("Fibonacci Series(Iterative):");

		for (int i = 0; i < n; i++) {
			System.out.print(f1 + " ");
			int fn = f1 + f2;
			f1 = f2;
			f2 = fn;
		}
	}

}
