package com.core.pyramids.ex;

public class Left_Angled_Pyramid {

	public static void main(String[] args) {
		int rows = 5;
		for (int k = 1; k <= rows; k++) {
			for (int i = 1; i <= rows - k; i++) {
				System.out.print(" ");
			}
			for (int j = 1; j <= k; j++) {
				System.out.print("*");
			}
			System.out.println();
		}

	}
}
