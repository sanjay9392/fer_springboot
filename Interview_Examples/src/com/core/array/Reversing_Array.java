package com.core.array;

public class Reversing_Array {

	public static void main(String[] args) {
		int[] array = new int[] { 1, 2, 3, 4, 5 };
		System.out.print("Original Array :");
		for (int i = 0; i <= array.length - 1; i++) {
			System.out.print(array[i] + " ");
		}
		System.out.println();
		System.out.print("Reversed Array :");
		for (int i = array.length - 1; i >= 0; i--) {
			System.out.print(array[i] + " ");
		}
	}

}
