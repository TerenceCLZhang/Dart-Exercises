import 'dart:io';

/// In 3 previous exercises, we built up a few components needed to build a Tic
/// Tac Toe game in Dart
///
/// Draw the Tic Tac Toe game board
/// Checking whether a game board has a winner
/// Handle a player move from user input
///
/// The next step is to put all these three components together to make a
/// two-player Tic Tac Toe game!
///
/// Your challenge in this exercise is to use the functions from those previous
/// exercises all together in the same program to make a two-player game that
/// you can play with a friend. There are a lot of choices you will have to
/// make when completing this exercise, so you can go as far or as little as
/// you want with it.
///
/// Here are a few things to keep in mind:
///
/// You should keep track of who won - if there is a winner, show a
/// congratulatory message on the screen.
///
/// If there are no more moves left, don’t ask for the next player’s move!
///
/// Keep in mind, the current solution is not just a copy pase of functions
/// from the previous exercises, but rather a rework of them.

void printBoard(board) {
  for (int i = 0; i < 3; i++) {
    print(" ---" * 3);
    for (int j = 0; j < 3; j++) {
      String tile = board[i][j];
      stdout.write("| $tile ");
    }
    stdout.write("|\n");
  }
  print(" ---" * 3);
}

bool checkWon(List<List<String>> board) {
  for (int i = 0; i < board.length; i++) {
    if (board[i][0] != " " &&
        board[i][0] == board[i][1] &&
        board[i][1] == board[i][2] &&
        board[i][0] == board[i][2]) {
      return true;
    }

    if (board[0][i] != " " &&
        board[0][i] == board[1][i] &&
        board[1][i] == board[2][i] &&
        board[0][i] == board[2][i]) {
      return true;
    }
  }

  if ((board[0][0] != " " &&
          board[0][0] == board[1][1] &&
          board[1][1] == board[2][2] &&
          board[0][0] == board[2][2]) ||
      (board[2][0] != " " &&
          board[2][0] == board[1][1] &&
          board[1][1] == board[0][2] &&
          board[2][0] == board[0][2])) {
    return true;
  }

  return false;
}

int getCoordinate(int currentPlayer, String direction) {
  int coordinate;
  while (true) {
    try {
      print(
          "Player $currentPlayer, please enter the $direction coordinate (0 - 2):");
      coordinate = int.parse(stdin.readLineSync() ?? "");
      if (coordinate >= 0 && coordinate <= 2) {
        return coordinate;
      }
      print("ERROR: Enter an integer between 0 and 2 inclusive.");
    } catch (e) {
      print("ERROR: Enter a valid integer.");
    }
  }
}

void setCoordinates(List<List<String>> board, int currentPlayer, String move) {
  while (true) {
    int x = getCoordinate(currentPlayer, "x");
    int y = getCoordinate(currentPlayer, "y");
    if (board[x][y] == " ") {
      board[x][y] = move;
      return;
    }
    print("ERROR: Selected coordinate not empty.");
  }
}

bool hasEmptySpace(List<List<String>> board) {
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (board[i][j] == " ") {
        return true;
      }
    }
  }
  return false;
}

void main() {
  List<List<String>> board = [
    [" ", " ", " "],
    [" ", " ", " "],
    [" ", " ", " "]
  ];

  int currentPlayer = 1;
  String move;

  while (true) {
    if (currentPlayer == 1) {
      move = "X";
    } else {
      move = "0";
    }
    printBoard(board);
    setCoordinates(board, currentPlayer, move);

    if (checkWon(board)) {
      print("Player $currentPlayer has Won!");
      return;
    }

    if (!hasEmptySpace(board)) {
      print("Tie.");
      return;
    }

    if (currentPlayer == 1) {
      currentPlayer = 2;
    } else {
      currentPlayer = 1;
    }
  }
}
