package com.rs.core.compatator;

import java.util.HashMap;

public class FrequencyOfEachWord {

	public static void main(String[] args) {

		String str = "42344dsr32rfdsr32rfdsde23213ewqsda";
		char[] arr = str.toCharArray();

		HashMap<Character, Integer> hMap = new HashMap<>();

		for (int i = 0; i < arr.length; i++) {
			if (hMap.containsKey(arr[i])) {
				int count = hMap.get(arr[i]);
				hMap.put(arr[i], count + 1);
			} else {
				hMap.put(arr[i], 1);
			}
		}
		System.out.println(hMap);
	}
}
