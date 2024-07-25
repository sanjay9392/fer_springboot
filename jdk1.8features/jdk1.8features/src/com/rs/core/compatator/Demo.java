package com.rs.core.compatator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Demo {

	public static void main(String[] args) {

		List<Integer> value = new ArrayList<Integer>();

		value.add(535);
		value.add(957);
		value.add(324);
		value.add(778);
		value.add(203);

		Comparator<Integer> com = new ComImpl();

		Collections.sort(value, com);

		for (int i : value) {
			System.out.println(i);
		}

	}

}
