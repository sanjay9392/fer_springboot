package com.core.prime.ex;

public class Prime_Check_Ex {

	public static void main(String[] args) {
		int n = 15;
		boolean isPrime = true;
		if (n <= 1) {
			isPrime = false;
		}
		for (int i = 2; i <= n; i++) {
			if (n % i == 0) {
				isPrime = false;
				break;
			}
		}
		if (isPrime) {
			System.out.println("n is Prime");
		} else {
			System.out.println("n is not a Prime");
		}
	}

}
	