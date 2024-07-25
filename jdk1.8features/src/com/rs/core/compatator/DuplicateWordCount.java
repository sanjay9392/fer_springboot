package com.rs.core.compatator;

import java.util.List;

public class DuplicateWordCount {

	public static void main(String[] args) {
		String s2 = "This is is Sample String String Example Sample Example This is is Sample String String Example Sample Example";
		int count;

		// Converts the string into lowercase
		// s2 = s2.toLowerCase();

		// Split the string into words using built-in function
		String words[] = s2.split(" ");

		System.out.println("Duplicate words in a given string and count ");
		for (int i = 0; i < words.length; i++) {
			count = 1;
			for (int j = i + 1; j < words.length; j++) {
				if (words[i].equalsIgnoreCase(words[j])) {
					count++;

					// Set words[j] to 0 to avoid printing visited word
					words[j] = "0";
				}
			}

			// Displays the duplicate word if count is greater than 1
			if (count > 1 && words[i] != "0")
				System.out.println(words[i] + " " + count);

		}

	}

}