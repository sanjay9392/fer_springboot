package com.rs.core.stream.iterator;

import java.util.ArrayList;
import java.util.List;

import com.rs.core.stream.Product;

public class IteratorExample {

	public static void main(String[] args) {
		/*
		 * Stream.iterate(1, element -> element + 1)
		 * 
		 * .filter(element -> element % 6 == 0)
		 * 
		 * .limit(5)
		 * 
		 * .forEach(System.out::println); }
		 */

		// filter and iterator
		List<Product> productsList = new ArrayList<Product>();
		// Adding Products
		productsList.add(new Product(1, "HP Laptop", 25000f));
		productsList.add(new Product(2, "Dell Laptop", 30000f));
		productsList.add(new Product(3, "Lenevo Laptop", 28000f));
		productsList.add(new Product(4, "Sony Laptop", 28000f));
		productsList.add(new Product(5, "Apple Laptop", 90000f));
		// This is more compact approach for filtering data
		
		productsList.stream()
		.filter(product -> product.price >= 28000)
				.forEach(product -> System.out.println(product.name));

	}

}
