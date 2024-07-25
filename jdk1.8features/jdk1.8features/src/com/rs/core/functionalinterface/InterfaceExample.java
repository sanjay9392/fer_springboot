package com.rs.core.functionalinterface;

public interface InterfaceExample {
	
	int amount = 100000;
	
	float getService();
	
	float getService2();
	
	default String getName() {
		return "test";
	}
	
}
