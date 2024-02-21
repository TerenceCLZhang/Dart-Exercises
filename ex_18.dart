/// As you may have guessed, we are trying to build up to a full tic-tac-toe
/// board.
///
/// For now, we will simply focus on checking whether someone has WON the game,
/// not worrying about how the moves were made.
///
/// If a game of Tic Tac Toe is represented as a list of lists, like so:
///
/// game = [[1, 2, 0],
///         [2, 1, 0],
///         [2, 1, 1]]
///
/// where a 0 means an empty square, a 1 means that player 1 put their token in
/// that space, and a 2 means that player 2 put their token in that space.
///
/// Your task: given a 3 by 3 list of lists that represents a Tic Tac Toe game
/// board, tell whether anyone has won, and tell which player won, if any.
///
/// A Tic Tac Toe win is 3 in a row - either in a row, a column, or a diagonal.
/// Don’t worry about the case where TWO people have won - assume that in every
/// board there will only be one winner.

bool checkWon(List<List<int>> board) {
  for (int i = 0; i < board.length; i++) {
    if (board[i][0] != 0 &&
        board[i][0] == board[i][1] &&
        board[i][1] == board[i][2] &&
        board[i][0] == board[i][2]) {
      return true;
    }

    if (board[0][i] != 0 &&
        board[0][i] == board[1][i] &&
        board[1][i] == board[2][i] &&
        board[0][i] == board[2][i]) {
      return true;
    }
  }

  if ((board[0][0] != 0 &&
          board[0][0] == board[1][1] &&
          board[1][1] == board[2][2] &&
          board[0][0] == board[2][2]) ||
      (board[2][0] != 0 &&
          board[2][0] == board[1][1] &&
          board[1][1] == board[0][2] &&
          board[2][0] == board[0][2])) {
    return true;
  }

  return false;
}

void main() {
  List<List<int>> game = [
    [1, 2, 0],
    [2, 1, 0],
    [2, 1, 1]
  ];

  bool gameWon = checkWon(game);
  print(gameWon);
}
