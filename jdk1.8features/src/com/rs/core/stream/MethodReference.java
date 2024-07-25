package com.rs.core.stream;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class MethodReference {

	public static void main(String[] args) {

		List<Product> productsList = new ArrayList<Product>();

		// Adding Products
		productsList.add(new Product(1, "HP Laptop", 25000f));
		productsList.add(new Product(2, "Dell Laptop", 30000f));
		productsList.add(new Product(3, "Lenevo Laptop", 28000f));
		productsList.add(new Product(4, "Sony Laptop", 28000f));
		productsList.add(new Product(5, "Apple Laptop", 90000f));

		List<Product> productPriceList = productsList.stream()
				.filter(product -> product.price > 30000) // filtering data
				//.map(Product::getPrice) // fetching price by referring getPrice method
				.collect(Collectors.toList()); // collecting as list
		System.out.println(productPriceList);
		
		Set<Product> productPriceSet = productsList.stream()
				.filter(product -> product.price > 30000) // filtering data
				//.map(Product::getPrice) // fetching price by referring getPrice method
				.collect(Collectors.toSet()); // collecting as list
		System.out.println(productPriceSet);
		
		List<Product> temp = new ArrayList<Product>();
		Iterator<Product> iterator = productsList.iterator();
		Product product = null;
		while(iterator.hasNext()) {
			product = iterator.next();
			if(product.getPrice() > 30000) {
				temp.add(product);
			}
		}
		System.out.println("temp: "+temp);
		
		
		List<Integer> productPriceList2 = productsList.stream()
				.filter(product2 -> product2.price > 25000) // filtering data
				.map(Product::getId) // fetching id by referring getId method
				.collect(Collectors.toList()); // collecting as list
		System.out.println(productPriceList2);
	}

}
