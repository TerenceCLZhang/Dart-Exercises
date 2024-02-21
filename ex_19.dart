import 'dart:io';

/// In a previous exercise we explored the idea of using a list of lists as a
/// “data structure” to store information about a tic tac toe game. In a tic
/// tac toe game, the “game server” needs to know where the Xs and Os are in
/// the board, to know whether player 1 or player 2 (or whoever is X and O) won.
///
/// There has also been an exercise (17) about drawing the actual tic tac toe
/// gameboard using text characters.
///
/// The next logical step is to deal with handling user input. When a player
/// (say player 1, who is X) wants to place an X on the screen, they can’t just
/// click on a terminal. So you are going to approximate this clicking simply
/// by asking the user for a coordinate of where they want to place their piece.

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
    if (board[x][y] == ".") {
      board[x][y] = move;
      return;
    }
    print("ERROR: Selected coordinate not empty.");
  }
}

void drawBoard(List<List<String>> board, int currentPlayer) {
  String move;
  if (currentPlayer == 1) {
    move = "X";
  } else {
    move = "0";
  }
  setCoordinates(board, currentPlayer, move);
  print(board);
}

void main() {
  List<List<String>> board = [
    [".", ".", "."],
    [".", ".", "."],
    [".", ".", "."]
  ];

  drawBoard(board, 1);
}
