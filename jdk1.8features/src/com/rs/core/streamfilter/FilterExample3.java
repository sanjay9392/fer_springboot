package com.rs.core.streamfilter;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

class Products {
	int id;
	String name;
	float price;

	public Products(int id, String name, float price) {
		this.id = id;
		this.name = name;
		this.price = price;
	}
}

public class FilterExample3 {
	public static void main(String[] args) {
		List<Product> productsList = new ArrayList<Product>();
		// Adding Products
		productsList.add(new Product(1, "HP Laptop", 25000f));
		productsList.add(new Product(2, "Dell Laptop", 30000f));
		productsList.add(new Product(6, "Dell Laptop", 30000f));
		productsList.add(new Product(3, "Lenevo Laptop", 28000f));
		productsList.add(new Product(4, "Sony Laptop", 23000f));
		productsList.add(new Product(5, "Apple Laptop", 90000f));
		Set<Float> pricesList = productsList.stream().filter(p -> p.price > 25000) // filtering price
				.map(pm -> pm.price) // fetching price
				.collect(Collectors.toSet());
		System.out.println(pricesList);
	}
}
