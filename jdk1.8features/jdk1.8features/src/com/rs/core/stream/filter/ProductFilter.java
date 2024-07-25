package com.rs.core.stream.filter;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.rs.core.stream.Product;

public class ProductFilter {

	public static void main(String[] args) {
		List<Product> productsList = new ArrayList<Product>();

		// Adding Products
		productsList.add(new Product(1, "HP Laptop", 25000f));
		productsList.add(new Product(2, "Dell Laptop", 30000f));
		productsList.add(new Product(3, "Lenevo Laptop", 28000f));
		productsList.add(new Product(4, "Sony Laptop", 28000f));
		productsList.add(new Product(5, "Apple Laptop", 90000f));
		
		/*
		// without stream

		List<Float> productPriceList = new ArrayList<Float>();
		
		Iterator<Product> iterator = productsList.iterator();
		Product product = null;
		
		while(iterator.hasNext()) {

			product = iterator.next();
			
			// filtering data of list

			if (product.price >= 30000) {

				// adding price to a productPriceList

				productPriceList.add(product.price);
			}
		}

		// displaying data

		System.out.println(productPriceList);
		*/
		
		// with stream
		Set<Float> productPriceList2 = productsList.stream()

				// filtering data
				.filter(product -> product.price > 25000)

				// fetching price
				.map(product -> product.price)

				// collecting as list
				.collect(Collectors.toSet());

		System.out.println(productPriceList2);

		Set<Product> productPriceList3 = productsList.stream()

				// filtering data
				.filter(product -> product.price > 25000)

				// collecting as list
				.collect(Collectors.toSet());
		
		System.out.println(productPriceList3);
	}

}
