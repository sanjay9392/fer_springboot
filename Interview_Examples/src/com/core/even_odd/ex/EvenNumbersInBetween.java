package com.core.even_odd.ex;

public class EvenNumbersInBetween {
	public static void main(String[] args) {
		int n = 1;
		while(n <= 20) {
			if(n % 2 == 0) {
				System.out.println(n + " ");
				n++;
			}
		}
	}

}