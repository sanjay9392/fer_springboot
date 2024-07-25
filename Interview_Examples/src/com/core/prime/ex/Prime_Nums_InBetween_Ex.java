package com.core.prime.ex;

public class Prime_Nums_InBetween_Ex {

	public static void main(String[] args) {
		int n = 100;
		while (n < 300) {
			if (isPrime(n)) {
				System.out.print(n + " ");
			}
			n++;
		}
	}

	private static boolean isPrime(int n) {
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
}
