import 'dart:io';
import 'dart:math';

/// Generate a random number between 1 and 100. Ask the user to guess the
/// number, then tell them whether they guessed too low, too high, or exactly right.
///
/// Keep track of how many guesses the user has taken, and when the game ends,
/// print this out.

int getGuess() {
  while (true) {
    print("Guess number (1-100):");
    int guess = int.parse(stdin.readLineSync() ?? '0');

    if (1 <= guess && guess <= 100) {
      return guess;
    } else {
      print("ERROR: Enter a number between 1 and 100.");
    }
  }
}

void main() {
  Random random = Random();
  int randomNumber = random.nextInt(100) + 1;
  int guess;
  while (true) {
    guess = getGuess();
    if (guess == randomNumber) {
      print("You guessed the number!");
      break;
    } else if (guess < randomNumber) {
      print("You guessed to low.");
    } else {
      print("You guessed to high.");
    }
  }
}
