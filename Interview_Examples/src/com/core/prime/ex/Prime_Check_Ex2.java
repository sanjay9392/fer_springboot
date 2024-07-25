package com.core.prime.ex;

public class Prime_Check_Ex2 {
	public static boolean isPrime(int n) {
		if(n <= 1) {
			return false;
		}
		for(int i = 2; i <= Math.sqrt(n); i++) {
			if(n % i == 0) {
				return false;
			}
		}
		return true;
	}
	public static void main(String [] args) {
		int n = 87;
		if(isPrime(n)) {
			System.out.println(n + " " + "is a Prime number");
		}else {
			System.out.println(n + " " + "is not a Prime number");
		}
	}
}
	