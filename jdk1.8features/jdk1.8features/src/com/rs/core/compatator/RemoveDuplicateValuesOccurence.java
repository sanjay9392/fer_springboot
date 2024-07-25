package com.rs.core.compatator;

import java.util.Arrays;
import java.util.LinkedHashSet;

public class RemoveDuplicateValuesOccurence {

	public static void main(String[] args) {

		String s2 = "This is is Sample String String Example Sample Example This is is Sample String String Example Sample Example";

		System.out.println("Original String: ");
		System.out.println(s2);

		/*
		 * Since the words are separated by space, we will split the string by one or
		 * more space
		 */

		String[] strWords = s2.split("\\s+");

		// convert String array to LinkedHashSet to remove duplicates
		LinkedHashSet<String> SetWords = new LinkedHashSet<String>(Arrays.asList(strWords));

		// join the words again by space
		StringBuilder sbTemp = new StringBuilder();
		int index = 0;

		for (String s : SetWords) {

			if (index > 0)
				sbTemp.append(" ");

			sbTemp.append(s);
			index++;
		}

		s2 = sbTemp.toString();

		System.out.println("String after removing duplicate words: ");
		System.out.println(s2);

	}
}
