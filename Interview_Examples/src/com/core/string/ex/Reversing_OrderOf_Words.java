package com.core.string.ex;

public class Reversing_OrderOf_Words {

	public static void main(String[] args) {
		String sentence = "This is a Sentence";
		String[] words = sentence.split(" "); // split sentence into words
		StringBuilder reversedSentence = new StringBuilder();

		// Reverse words using String concatenation
		for (int i = words.length - 1; i >= 0; i--) {
			reversedSentence.append(words[i]).append(" ");
		}
		System.out.println("Original Sentence is :" + sentence);
		System.out.println("Reversed sentence is :" + reversedSentence);
	}

}
