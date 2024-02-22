import 'dart:convert';
import 'dart:io';

/// In the previous exercise we created a dictionary of famous scientists’
/// birthdays.
///
/// In this exercise, modify your program from Part 1 to load the birthday
/// dictionary from a JSON file on disk, rather than having the dictionary
/// defined in the program.
///
/// Bonus:
///
/// Ask the user for another scientist’s name and birthday to add to the
/// dictionary, and update the JSON file you have on disk with the scientist’s
/// name. If you run the program multiple times and keep adding new names,
/// your JSON file should keep getting bigger and bigger.

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

void getBirthdayData(String fileName, Map<String, String> birthdays) {
  File file = File(fileName);
  String fileContent = file.readAsStringSync();
  dynamic jsonData = jsonDecode(fileContent);
  dynamic famousPeople = jsonData['famous_people'];
  for (dynamic person in famousPeople) {
    birthdays[person["name"]] = person["birthday"] ?? "Unknown";
  }
}

bool checkAddPerson() {
  String option;
  while (true) {
    print(">>> Would you like to add more people's birthdays? (yes or no):");
    option = (stdin.readLineSync() ?? "").toLowerCase();
    if (option == "yes") {
      return true;
    } else if (option == "no") {
      return false;
    } else {
      print("ERROR: Unknown command. Enter yes or no.");
    }
  }
}

String getNewName() {
  String nameToAdd;
  while (true) {
    print(">>> Enter their full name:");
    nameToAdd = stdin.readLineSync() ?? "";
    if (!nameToAdd.isEmpty) {
      return nameToAdd;
    } else {
      print("ERROR: Name cannot be empty.");
    }
  }
}

String getNewBirthday() {
  String birthdayToAdd;
  while (true) {
    print(">>> Enter their birthday (MM/DD/YYYY):");
    birthdayToAdd = stdin.readLineSync() ?? "";
    if (isValidBirthday(birthdayToAdd)) {
      return birthdayToAdd;
    }
  }
}

bool isValidBirthday(String birthday) {
  if (birthday.isEmpty) {
    print("ERROR: Birthday cannot be empty.");
    return false;
  }

  RegExp dateRegExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  if (!dateRegExp.hasMatch(birthday)) {
    print("ERROR: Invalid date format. Please enter in MM/DD/YYYY format.");
    return false;
  }

  List<String> dateParts = birthday.split('/');
  int month = int.tryParse(dateParts[0]) ?? 0;
  int day = int.tryParse(dateParts[1]) ?? 0;
  int year = int.tryParse(dateParts[2]) ?? 0;

  if (month < 1 || month > 12) {
    print("ERROR: Invalid month. Please enter a valid month (1 to 12).");
    return false;
  }

  if (day < 1 || day > getDaysInMonth(month, year)) {
    print(
        "ERROR: Invalid day for the selected month. Please enter a valid day.");
    return false;
  }

  return true;
}

int getDaysInMonth(int month, int year) {
  if (month == 2) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
      return 29;
    } else {
      return 28;
    }
  } else if ([4, 6, 9, 11].contains(month)) {
    return 30;
  } else {
    return 31;
  }
}

void addNewBirthday(String fileName, Map<String, String> dataToWrite) {
  try {
    File file = File(fileName);
    String fileContent = file.readAsStringSync();
    dynamic jsonData = jsonDecode(fileContent);
    List<dynamic> famousPeople = jsonData['famous_people'];
    famousPeople.add(dataToWrite);
    jsonData['famous_people'] = famousPeople;
    String updatedJson = jsonEncode(jsonData);
    file.writeAsStringSync(updatedJson);
    print("New birthday successfully added.");
  } catch (e) {
    print("ERROR: $e");
  }
}

void main() {
  final String fileName = "birthdays.json";
  String lookupName, lookupNameBirthday;
  Map<String, String> birthdays = {};
  getBirthdayData(fileName, birthdays);

  print(">>> Welcome to the birthday dictionary. We know the birthdays of:");
  for (String name in birthdays.keys) {
    print(name);
  }

  lookupName = getName(birthdays);
  lookupNameBirthday = birthdays[lookupName] ?? "Unknown";
  print(">>> $lookupName's birthday is $lookupNameBirthday.");

  if (checkAddPerson()) {
    String nameToAdd = getNewName();
    String birthdayToAdd = getNewBirthday();
    Map<String, String> dataToWrite = {
      "name": nameToAdd,
      "birthday": birthdayToAdd
    };
    addNewBirthday(fileName, dataToWrite);
  }
}
