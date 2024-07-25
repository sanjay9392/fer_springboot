package com.rs.core.lambdafeatures;

public class WithoutLambda2 implements Drawable{
	int width = 10;

	public static void main(String[] args) {
		
		// without lambda, Drawable implementation using anonymous class
		Drawable d = new WithoutLambda2();
		d.draw();
	}

	@Override
	public void draw() {
		System.out.println("Drawing " + width);
		
	}
}