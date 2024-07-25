package com.rs.core.functionalinterface;

public interface Doable {
	default void doIt() {
		System.out.println("Do it now");
	}
	default void doIt1() {
		System.out.println("Do it now");
	}
	void test();
	void test1();
}
