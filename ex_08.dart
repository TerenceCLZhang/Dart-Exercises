import 'dart:io';
import 'dart:math';

/// Make a two-player Rock-Paper-Scissors game against computer.
///
/// Ask for player's input, compare them, print out a message to the winner.

void main() {
  List<String> options = ["rock", "paper", "scissors"];
  Random random = Random();
  int computerIndex = random.nextInt(3);
  String computerOption = options[computerIndex];
  String playerOption;
  while (true) {
    while (true) {
      print("Enter Rock, Paper, or Scissors:");
      playerOption = stdin.readLineSync() ?? "";
      playerOption = playerOption.toLowerCase();

      if (!options.contains(playerOption)) {
        print("Invalid input.");
      } else {
        break;
      }
    }

    print("Computer chose $computerOption.");
    print("$playerOption $computerOption");
    if (playerOption == computerOption) {
      print("Tie. Play Again.");
    } else {
      bool playerWin = false;
      if (playerOption == "rock" && computerOption == "scissors" ||
          playerOption == "paper" && computerOption == "rock" ||
          playerOption == "scissors" && computerOption == "paper") {
        playerWin = true;
      }

      if (playerWin) {
        print("Player Wins.");
      } else {
        print("Computer Wins.");
      }
      break;
    }
  }
}
