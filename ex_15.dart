import 'dart:io';
import 'dart:math';

/// Write a password generator in Dart. Be creative with how you generate
/// passwords - strong passwords have a mix of lowercase letters, uppercase
/// letters, numbers, and symbols. The passwords should be random, generating
/// a new password every time the user asks for a new password. Include your
/// run-time code in a main method.
///
/// Ask the user how strong they want their password to be. For weak
/// passwords, pick a word or two from a list.

int getStrength() {
  while (true) {
    print("How strong do you want your password? Weak, Medium or Strong?");
    String response = (stdin.readLineSync() ?? "").toLowerCase();
    if (response == "weak") {
      return 5;
    } else if (response == "medium") {
      return 10;
    } else if (response == "strong") {
      return 25;
    } else {
      print("ERROR: Please enter weak, medium or strong.");
    }
  }
}

String generatePassword(int length) {
  String password = "";
  Random random = Random();
  for (int i = 0; i < length; i++) {
    int randomAsciiValue = random.nextInt(95) + 32;
    String randomAsciiCharacter = String.fromCharCode(randomAsciiValue);
    if (randomAsciiCharacter == " ") {
      randomAsciiCharacter = "_";
    }
    password += randomAsciiCharacter;
  }
  return password;
}

void main() {
  int password_length = getStrength();
  String password = generatePassword(password_length);
  print("Password: $password");
}
