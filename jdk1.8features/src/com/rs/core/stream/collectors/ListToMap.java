package com.rs.core.stream.collectors;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.rs.core.stream.Product;

public class ListToMap {

	public static void main(String[] args) {

		List<Product> productsList = new ArrayList<Product>();

		// Adding Products
		productsList.add(new Product(1, "HP Laptop", 25000f));
		productsList.add(new Product(2, "Dell Laptop", 30000f));
		productsList.add(new Product(3, "Lenevo Laptop", 28000f));
		productsList.add(new Product(4, "Sony Laptop", 28000f));
		productsList.add(new Product(5, "Apple Laptop", 90000f));
		
		/*
		Iterator<Product> iterator = productsList.iterator();
		Map<Integer, Product> map = new LinkedHashMap<Integer, Product>();
		Product product = null;
		while(iterator.hasNext()) {
			product = iterator.next();
			
			map.put(product.getId(), product);
		}
		*/
		
		// Converting Product List into a Map
		Map<Object, Object> productPriceMap = productsList.stream()
				.collect(Collectors.toMap(product -> product.id, product -> product));

		System.out.println(productPriceMap);
	}

}
