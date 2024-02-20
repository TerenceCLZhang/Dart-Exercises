import 'dart:io';

/// Create a program that asks the user to enter their name and their age.
/// Print out a message that tells how many years they have to be 100 years old.

void main() {
  print("What is your age?");
  int age = int.parse(stdin.readLineSync() ?? '0');
  int yearsToHundred = 100 - age;
  print("You have $yearsToHundred years left until you will be 100.");
}
