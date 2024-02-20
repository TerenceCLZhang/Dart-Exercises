import 'dart:math';

/// Write a program (function) that takes a list and returns a new list that
/// contains all the elements of the first list minus all the duplicates.

List<int> generateRandomList() {
  Random random = Random();
  List<int> randomNumbers = [];
  for (int i = 0; i < 10; i++) {
    int randomNumber = random.nextInt(10);
    randomNumbers.add(randomNumber);
  }
  return randomNumbers;
}

List<int> removeDuplicates(List<int> original) {
  return original.toSet().toList();
}

void main() {
  List<int> randomNumbers = generateRandomList();
  List<int> removedDuplicates = removeDuplicates(randomNumbers);
  print("$randomNumbers\n$removedDuplicates");
}
