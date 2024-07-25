package com.rs.core.stream.reduce;

import java.util.ArrayList;
import java.util.List;

import com.rs.core.stream.Product;

public class ReduceMethod {

	public static void main(String[] args) {

		List<Product> productsList = new ArrayList<Product>();

		// Adding Products
		productsList.add(new Product(1, "HP Laptop", 25000f));
		productsList.add(new Product(2, "Dell Laptop", 30000f));
		productsList.add(new Product(3, "Lenevo Laptop", 28000f));
		productsList.add(new Product(4, "Sony Laptop", 28000f));
		productsList.add(new Product(5, "Apple Laptop", 90000f));

		// This is more compact approach for filtering data
		Float totalPrice = productsList.stream().map(product -> product.price)

				// accumulating price
				.reduce(0.0f, (sum, price) -> sum + price);

		System.out.println(totalPrice);

		// More precise code
		float totalPrice2 = productsList.stream().map(product -> product.price)

				// accumulating price, by referring method of Float class
				.reduce(0.0f, Float::sum);
		System.out.println(totalPrice2);

	}

}
