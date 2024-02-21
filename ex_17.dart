import 'dart:io';

/// Time for some fake graphics! Let’s say we want to draw game boards that
/// look like this:
///
///  --- --- ---
/// |   |   |   |
///  --- --- ---
/// |   |   |   |
///  --- --- ---
/// |   |   |   |
///  --- --- ---
///
/// This one is 3x3 (like in tic tac toe).
///
/// Ask the user what size game board they want to draw, and draw it for them
/// to the screen using Dart’s print statement.

int userInput() {
  while (true) {
    try {
      print("Enter size:");
      int num = int.parse(stdin.readLineSync() ?? "");
      if (num >= 0) {
        return num;
      }
      print("ERROR: Enter an integer greater than zero.");
    } catch (e) {
      print("ERROR: Enter a valid integer.");
    }
  }
}

void main() {
  int size = userInput();
  for (int i = 0; i < size; i++) {
    print(" ---" * size);
    print("|   " * (size + 1));
  }
  print(" ---" * size);
}
