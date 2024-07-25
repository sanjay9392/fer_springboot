package com.rs.core.sorting;

	import java.util.Arrays;

	public class ParallelArraySorting2 {
		public static void main(String[] args) {
			// Creating an integer array
			int[] arr = { 5,8,1,0,6,60,50,-3};

			// Iterating array elements
			for (int i : arr) {
				System.out.print(i + " ");
			}

			// Sorting array elements parallel and passing start, end index
			Arrays.parallelSort(arr, arr.length-5, arr.length );
			System.out.println("\nArray elements after sorting");

			// Iterating array elements
			for (int i : arr) {
				System.out.print(i + " ");
			}
		}
	}