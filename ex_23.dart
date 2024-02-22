import 'dart:io';
import 'dart:math';

/// In this exercise, the task is to write a function that picks a random word
/// from a list of words from the SOWPODS dictionary.
///
/// Download this file and save it in the same directory as your Dart code.
/// Each line in the file contains a single word.
///
/// Use the Dart random library for picking a random word.

List<String> readFromFile(String fileName) {
  File file = File(fileName);
  List<String> fileContents = file.readAsLinesSync();
  return fileContents;
}

String pickRandomWord(List<String> wordList) {
  Random random = Random();
  int wordListLength = wordList.length;
  int index = random.nextInt(wordListLength - 1);
  return wordList[index];
}

void main() {
  String fileName = "SOWPODS.txt";
  List<String> wordList = readFromFile(fileName);
  String randomWord = pickRandomWord(wordList);
  print(randomWord);
}
