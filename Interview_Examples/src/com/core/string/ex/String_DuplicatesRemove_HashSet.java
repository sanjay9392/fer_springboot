package com.core.string.ex;

import java.util.HashSet;

public class String_DuplicatesRemove_HashSet {

	public static void main(String[] args) {
		String s = "sanjay";
		HashSet<Character> set = new HashSet<>();
		StringBuilder sb = new StringBuilder();

		for (char c : s.toCharArray()) {
			if (!set.contains(c)) {
				set.add(c);
				sb.append(c);
			}
		}
		System.out.println(sb.toString());
		
	}

}
