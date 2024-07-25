package com.core.prime.ex;

public class Prime_Nums_InBetween_Ex2 {
	int a, b;

	public static boolean isPrime(int n) {
		if (n <= 1) {
			return false;
		}

		for (int i = 2; i * i <= n; i++) {
			if (n % i == 0) {
				return false;
			}
		}
		return true;
	}

	public static void main(String[] args) {
		int a = 200, b = 400;
		if (a > b) {
			System.out.println("Invalid Input");
			return;
		}
		for (int n = a; n <= b; n++) {
			if (isPrime(n)) {
				System.out.print(n + " ");
			}
		}

	}

}
