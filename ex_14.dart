import 'dart:io';

/// Write a program (using functions!) that asks the user for a long string
/// containing multiple words. Print back to the user the same string, except
/// with the words in backwards order.
///
/// For example, say I type the string:
///
/// My name is Michele
///
/// Then I would see the string:
///
/// Michele is name My

String reverseWords(String original) {
  List<String> wordsList = original.split(RegExp(r'\s+'));
  wordsList = wordsList.map((word) => word.trim()).toList();
  List<String> reversedWordsList = wordsList.reversed.toList();
  String reversedString = reversedWordsList.join(" ");
  return reversedString;
}

void main() {
  print("Enter string:");
  String longString = stdin.readLineSync() ?? "";
  String reversedWords = reverseWords(longString);
  print(reversedWords);
}
