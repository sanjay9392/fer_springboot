package com.core.fibonacci.approaches;

public class Fibonacci_Array_Ex {

	public static void main(String[] args) {
		int n = 10;
		System.out.print("Fibonacci Series(Array):");

		int[] fibonacciArray = new int[n];
		fibonacciArray[0] = 0;
		fibonacciArray[1] = 1;
		System.out.print(fibonacciArray[0] + " " + fibonacciArray[1] + " ");

		for (int i = 2; i < n; i++) {
			fibonacciArray[i] = fibonacciArray[i - 1] + fibonacciArray[i - 2];
			System.out.print(fibonacciArray[i] + " ");
		}

	}

}
