package com.core.even_odd.ex;

public class LeapYear_Ex {

	public static void main(String[] args) {
		int year = 2024;
		if (isLeapYear(year)) {
			System.out.println(year + " is a leap year");
		} else {
			System.out.println(year + " is not a leap year");

		}
	}

	private static boolean isLeapYear(int year) {
		if (year % 400 == 0) {
			return true;
		}
		if (year % 100 == 0) {
			return false;
		}
		if (year % 4 == 0) {
			return true;

		}
		return false;
	}
}
