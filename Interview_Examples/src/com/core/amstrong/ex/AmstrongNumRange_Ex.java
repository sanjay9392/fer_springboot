package com.core.amstrong.ex;

public class AmstrongNumRange_Ex {

	public static boolean isAmstrong(int n) {
		int temp = n;
		int r, sum = 0;

		while (n > 0) {
			r = n % 10;
			n = n / 10;
			sum = sum + r * r * r;
		}
		if (temp == sum) {
			return true;
		}
		return false;

	}

	public static void main(String[] args) {
		int a = 1;
		int b = 500;
		System.out.println("Amstrong Numbers between " + a + " and " + b + ":");
		for (int n = a; n <= b; n++) {
			if (isAmstrong(n)) {
				System.out.println(n + " ");
			}
		}

	}
}
