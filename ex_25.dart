import 'dart:io';
import 'dart:math';

/// In this exercise, we will finish building Hangman. In the game of Hangman,
/// the player only has 6 incorrect guesses (head, body, 2 legs, and 2 arms)
/// before they lose the game.
///
/// In Part 1, we loaded a random word list and picked a word from it.
///
/// In Part 2, we wrote a logic for guessing the letter and displaying that
/// information to user.
///
/// In this exercise, we have to put it all together and add logic for handling
/// guesses.
///
///
/// Copy your code from Parts 1 and 2 into a new file as a starting point. Now
/// add the following features:
///
/// Only let the user guess 6 times, and tell the user how many guesses they
/// have left.
///
/// Keep track of the letters user guessed. If the user guesses a letter they
/// had already guessed, don’t penalize them - let them guess again.
///
///
/// Optional additions:
///
/// When the player wins or loses, let them start a new game.
///
/// Rather than telling the user "You have 4 incorrect guesses left", display
/// some picture art for the Hangman. This is challenging - do the other parts
/// of the exercise first!
///
/// Your solution will be a lot cleaner if you make use of functions to help
/// you!

void getHangmanImage(int index) {
  final List<String> hangmanImages = [
    '''
  +---+
  |   |
      |
      |
      |
      |
=========''',
    '''
  +---+
  |   |
  O   |
      |
      |
      |
=========''',
    '''
  +---+
  |   |
  O   |
  |   |
      |
      |
=========''',
    '''
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========''',
    '''
  +---+
  |   |
  O   |
 /|\\  |
      |
      |
=========''',
    '''
  +---+
  |   |
  O   |
 /|\\  |
 /    |
      |
=========''',
    '''
  +---+
  |   |
  O   |
 /|\\  |
 / \\  |
      |
========='''
  ];

  print(hangmanImages[index]);
}

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

String getWord() {
  String fileName = "SOWPODS.txt";
  List<String> wordList = readFromFile(fileName);
  String randomWord = pickRandomWord(wordList);
  return randomWord;
}

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
  String word = getWord();

  Map<String, bool> guessed = {};
  List<String> guessedLetters = [];

  final int numGuessesAllowed = 6;
  int numBadGuesses = 0;

  initiateGuessed(guessed, word);

  while (true) {
    getHangmanImage(numBadGuesses);
    printWord(word, guessed);
    stringGuessedLetters = guessedLetters.join(", ");
    print("Guessed Letters: $stringGuessedLetters\n");

    if (areAllValuesTrue(guessed) || (numBadGuesses >= numGuessesAllowed)) {
      break;
    }

    guess = getGuess(guessedLetters);
    if (guessed.keys.contains(guess)) {
      guessed[guess] = true;
    } else {
      numBadGuesses++;
    }

    guessedLetters.add(guess);
  }

  if (numBadGuesses < numGuessesAllowed) {
    print("You Win!");
  } else {
    print("You Lose. The word was $word.");
  }
}
