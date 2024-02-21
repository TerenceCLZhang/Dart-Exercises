import 'dart:io';
import 'dart:math';

/// You, the user, will have in your head a number between 0 and 100. The
/// program will guess a number, and you, the user, will say whether it is too
/// high, too low, or your number.
///
/// At the end of this exchange, your program should print out how many guesses
/// it took to get your number.

int generateGuess(int min, int max) {
  Random random = Random();
  int randomNumber = min + random.nextInt(max - min + 1);
  return randomNumber;
}

int getOption() {
  int option;
  while (true) {
    try {
      print("Select:");
      print("1. Yes, thats the number.");
      print("2. No, it's a higher.");
      print("3. No, it's a lower.");
      stdout.write("Enter (1 - 3): ");
      option = int.parse(stdin.readLineSync() ?? "");
      if (1 <= option && option <= 3) {
        return option;
      }
      print("ERROR: Please enter an integer between 1 and 3 inclusive.");
    } catch (e) {
      print("ERROR: Please enter a valid integer.");
    }
  }
}

void main() {
  int guess;
  int attempts = 1;
  int min = 0;
  int max = 100;

  stdout.write(
      "Think of a Number between 0 and 100. Press enter once you have done that.");
  stdin.readLineSync();

  while (true) {
    int option;
    guess = generateGuess(min, max);
    print("\nIs $guess the number?");
    option = getOption();
    if (option == 1) {
      break;
    } else if (option == 2) {
      min = guess + 1;
    } else {
      max = guess - 1;
    }
    attempts++;
  }

  print("\nI guessed your number in $attempts attempts.");
}
