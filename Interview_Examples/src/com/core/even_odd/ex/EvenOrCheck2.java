package com.core.even_odd.ex;

import java.util.Scanner;

public class EvenOrCheck2 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
		int n = scanner.nextInt();
		if(n % 2 == 0) {
			System.out.println(n + " "+ "is a Even Number");
		}else {
			System.out.println(n + " "+ "is a odd Number");

		}
	}

}
