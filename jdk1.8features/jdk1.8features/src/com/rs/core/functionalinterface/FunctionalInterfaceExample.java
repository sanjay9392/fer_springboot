package com.rs.core.functionalinterface;

public class FunctionalInterfaceExample implements Sayable {

	public void say(String msg) {
		System.out.println(msg);
	}

	public static void main(String[] args) {
		FunctionalInterfaceExample file = new FunctionalInterfaceExample();
		file.say("Hello there");
		file.doIt();

	}

	@Override
	public void test() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void test1() {
		// TODO Auto-generated method stub
		
	}

}
