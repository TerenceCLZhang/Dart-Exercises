import 'dart:io';

/// Ask the user for a string and print out whether this string is a palindrome or not.
///
/// A palindrome is a string that reads the same forwards and backwards.

void main() {
  print("Enter a string:");
  String inputString = stdin.readLineSync() ?? "";
  int pointer1 = 0;
  int pointer2 = inputString.length - 1;
  while (pointer1 <= pointer2) {
    if (inputString[pointer1] != inputString[pointer2]) {
      print("The string is not a palindrome.");
      return;
    }
    pointer1++;
    pointer2--;
  }
  print("The string is a palindrome.");
}
