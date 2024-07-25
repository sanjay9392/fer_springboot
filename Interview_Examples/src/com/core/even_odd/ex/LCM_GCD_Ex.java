package com.core.even_odd.ex;

public class LCM_GCD_Ex {

	public static void main(String[] args) {
		int n = 12, m = 18;
		int gcd = findGCD(n, m);
		int lcm = (n * m) / gcd;

		System.out.println("GCD of " + n + " and " + m + " is: " + gcd);
		System.out.println("LCM of " + n + " and " + m + " is: " + lcm);
	}

	private static int findGCD(int a, int b) {
		if (b == 0) {
			return a;
		}
		return findGCD(b, a % b);
	}

}
