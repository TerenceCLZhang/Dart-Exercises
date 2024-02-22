import 'dart:convert';
import 'dart:io';

/// In the previous exercise we saved information about famous scientists’
/// names and birthdays to disk.
///
/// In this exercise, load that JSON file from disk, extract the months of all
/// the birthdays, and count how many scientists have a birthday in each month.
///
/// Your program should output something like:
///
/// {
///   "May": 3,
///   "November": 2,
///   "December": 1
/// }

void getBirthdayData(String fileName, List<String> birthdays) {
  File file = File(fileName);
  String fileContent = file.readAsStringSync();
  dynamic jsonData = jsonDecode(fileContent);
  List<dynamic> famousPeople = jsonData['famous_people'];
  for (dynamic person in famousPeople) {
    birthdays.add(person["birthday"] ?? "Unknown");
  }
}

void main() {
  final String fileName = "birthdays.json";
  List<String> birthdays = [];
  Map<String, int?> monthBirthdayCount = {
    'January': 0,
    'February': 0,
    'March': 0,
    'April': 0,
    'May': 0,
    'June': 0,
    'July': 0,
    'August': 0,
    'September': 0,
    'October': 0,
    'November': 0,
    'December': 0,
  };
  final Map<String, String> months = {
    '01': 'January',
    '02': 'February',
    '03': 'March',
    '04': 'April',
    '05': 'May',
    '06': 'June',
    '07': 'July',
    '08': 'August',
    '09': 'September',
    '10': 'October',
    '11': 'November',
    '12': 'December',
  };

  getBirthdayData(fileName, birthdays);

  for (String birthday in birthdays) {
    if (birthday.length >= 2) {
      String birthDayMonth = birthday.substring(0, 2);
      String monthName = months[birthDayMonth] ?? "Unknown";
      monthBirthdayCount[monthName] ??= 0;
      monthBirthdayCount[monthName] = (monthBirthdayCount[monthName] ?? 0) + 1;
    }
  }

  print("{");
  monthBirthdayCount.forEach((key, value) {
    print(" $key: $value");
  });
  print("}");
}
