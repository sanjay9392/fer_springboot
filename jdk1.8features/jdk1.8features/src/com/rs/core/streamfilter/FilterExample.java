package com.rs.core.streamfilter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class FilterExample {

	public static void main(String[] args) {

		List<String> names = Arrays.asList("Ramya", "Prathima", "Teja", "Neelima", "Lavanya", "Supriya", "Vineetha",
				"Thanmai", "Parvathi");
		
		List<String> finalNames = new ArrayList<String>();
		for(String name : names) {
			if(name.length() > 7) {
				finalNames.add(name);
			}
		}
		
		for(String finalName : finalNames ) {
			System.out.println(finalName);
		}
		
		System.out.println("....................................");
		
		// Creating the stream of all names
		//Stream<String> allNames = names.stream();

		// Creating another stream by filtering long names using filter()
		//Stream<String> longNames = names.stream().filter(name -> name.length() > 7);
		// displaying the long names
	
		names.stream().filter(name -> name.length() > 7).forEach(str -> System.out.print(str + " "));
	}

}
