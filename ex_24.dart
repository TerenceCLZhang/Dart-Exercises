import 'dart:io';

/// In the game of Hangman, a clue word is given by the program that the player
/// has to guess, letter by letter. The player guesses one letter at a time
/// until the entire word has been guessed. (In the actual game, the player can
/// only guess 6 letters incorrectly before losing).
///
/// Let’s say the word the player has to guess is EVAPORATE.
///
/// For this exercise:
///
/// Write the logic that asks a player to guess a letter and displays letters
/// in the clue word that were guessed correctly. For now, let the player guess
/// an infinite number of times until they get the entire word.
///
/// As a bonus, keep track of the letters the player guessed and display a
/// different message if the player tries to guess that letter again.
///
/// Remember to stop the game when all the letters have been guessed correctly!
/// Don’t worry about choosing a word randomly or keeping track of the number
/// of guesses the player has remaining - we will deal with those in a future
/// exercise.

void initiateGuessed(Map<String, bool> guessed, String word) {
  for (int charCode in word.runes) {
    String charLetter = String.fromCharCode(charCode);
    guessed.putIfAbsent(charLetter, () => false);
  }
}

bool areAllValuesTrue(Map<String, bool> map) {
  return map.values.every((value) => value == true);
}

bool isLetter(String char) {
  return char.length == 1 &&
      char.toLowerCase().compareTo('a') >= 0 &&
      char.toLowerCase().compareTo('z') <= 0;
}

String getGuess(List<String> guessedLetters) {
  while (true) {
    print("Enter guess:");
    String guess = (stdin.readLineSync() ?? "").toUpperCase();

    if (guess == "") {
      print("ERROR: Guess cannot be an empty string.");
    } else if (guessedLetters.contains(guess)) {
      print("ERROR: Letter has already been guessed.");
    } else if (!isLetter(guess)) {
      print("ERROR: Letter has not been entered.");
    } else {
      return guess;
    }
  }
}

void printWord(String word, Map<String, bool> guessed) {
  for (int charCode in word.runes) {
    String charLetter = String.fromCharCode(charCode);
    if (guessed[charLetter] == false) {
      stdout.write("_ ");
    } else {
      stdout.write("$charLetter ");
    }
  }
  stdout.write("\n");
}

void main() {
  String stringGuessedLetters, guess;
  String word = "EVAPORATE";
  Map<String, bool> guessed = {};
  List<String> guessedLetters = [];

  initiateGuessed(guessed, word);

  while (true) {
    printWord(word, guessed);

    if (areAllValuesTrue(guessed)) {
      break;
    }

    stringGuessedLetters = guessedLetters.join(", ");
    print("Guessed Letters: $stringGuessedLetters\n");

    guess = getGuess(guessedLetters);
    if (guessed.keys.contains(guess)) {
      guessed[guess] = true;
    }

    guessedLetters.add(guess);
  }

  print("You Win! The word was $word.");
}
