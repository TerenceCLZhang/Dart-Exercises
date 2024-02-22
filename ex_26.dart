import 'dart:io';

/// For this exercise, we will keep track of when our friend’s birthdays are,
/// and be able to find that information based on their name.
///
/// Create a dictionary (in your file) of names and birthdays. When you run
/// your program it should ask the user to enter a name, and return the birthday
/// of that person back to them. The interaction should look something like
/// this:
///
/// >>> Welcome to the birthday dictionary. We know the birthdays of:
/// Albert Einstein
/// Benjamin Franklin
/// Ada Lovelace
/// >>> Who's birthday do you want to look up?
/// Benjamin Franklin
/// >>> Benjamin Franklin's birthday is 01/17/1706.

String getName(Map<String, String> birthdays) {
  String name;
  while (true) {
    print(">>> Who's birthday do you want to look up?");
    name = (stdin.readLineSync() ?? "");
    for (String dict_name in birthdays.keys) {
      if (dict_name.toLowerCase() == name.toLowerCase()) {
        return name;
      }
    }
    print("ERROR: Name not found. Please enter a valid name.");
  }
}

void main() {
  Map<String, String> birthdays = {
    "Albert Einstein": "04/14/1879",
    "Benjamin Franklin": "01/17/1706",
    "Ada Lovelace": "12/10/1815",
  };

  String lookupName, lookupNameBirthday;

  print(">>> Welcome to the birthday dictionary. We know the birthdays of:");
  for (String name in birthdays.keys) {
    print(name);
  }

  lookupName = getName(birthdays);
  lookupNameBirthday = birthdays[lookupName] ?? "Unknown";
  print(">>> $lookupName's birthday is $lookupNameBirthday.");
}
