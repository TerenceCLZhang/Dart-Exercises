import 'dart:io';

/// Ask the user for a number. Depending on whether the number is even or odd,
/// print out an appropriate message to the user.

void main() {
  print("Enter a number:");
  int number = int.parse(stdin.readLineSync() ?? "0");
  if (number % 2 == 0) {
    print("It is an even number.");
  } else {
    print("It is an odd number");
  }
}
