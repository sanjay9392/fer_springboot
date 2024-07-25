package com.rs.core.lambdafeatures;

public class WithLambdaExpressions {
	public static void main(String[] args) {
		int width = 10;

		// with lambda
		Drawable d2 = () -> {
			System.out.println("Drawing " + width);
		};
		d2.draw();
	}
}