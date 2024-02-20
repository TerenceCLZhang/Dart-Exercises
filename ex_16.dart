import 'dart:io';
import 'dart:math';

/// Create a program that will play the “cows and bulls” game with the user.
/// The game works like this:
///
/// Randomly generate a 4-digit number. Ask the user to guess a 4-digit number.
/// For every digit the user guessed correctly in the correct place, they have
/// a “cow”. For every digit the user guessed correctly in the wrong place is
/// a “bull.”
///
/// Every time the user makes a guess, tell them how many “cows” and “bulls”
/// they have. Once the user guesses the correct number, the game is over. Keep
/// track of the number of guesses the user makes throughout the game and tell
/// the user at the end.

int getGuess() {
  while (true) {
    try {
      print("Guess the number:");
      int guess = int.parse(stdin.readLineSync() ?? '0');
      if (guess.toString().length == 4) {
        return guess;
      } else {
        print("ERROR: Number must have four digits.");
      }
    } catch (e) {
      print("ERROR: Please enter an integer number.");
    }
  }
}

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(9000) + 1000;
}

List<int> getCowsBulls(int number, int guess) {
  List<int> cowsBullsList = [0, 0];
  for (int i = 0; i < 4; i++) {
    if (number.toString()[i] == guess.toString()[i]) {
      cowsBullsList[0]++;
    } else {
      cowsBullsList[1]++;
    }
  }
  return cowsBullsList;
}

void main() {
  int cows = 0;
  int bulls = 0;
  int attempts = 1;
  int randomNumber = generateRandomNumber();

  while (true) {
    int guess = getGuess();
    List<int> cowsBullsList = getCowsBulls(randomNumber, guess);
    cows = cowsBullsList[0];
    bulls = cowsBullsList[1];

    if (cows == 4) {
      print("You guessed the number!");
      print("It took you $attempts attempts");
      break;
    }

    print("\nAttempt: $attempts");
    print("Cows: $cows");
    print("Bulls: $bulls\n");

    attempts++;
  }
}
