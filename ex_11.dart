/// Write a program that takes a list of numbers for example
///
/// a = [5, 10, 15, 20, 25]
///
/// and makes a new list of only the first and last elements of the given list.
/// For practice, write this code inside a function.

List<int> getFirstLastNumber(List<int> original) {
  List<int> firstLastList = [original.first, original.last];
  return firstLastList;
}

void main() {
  List<int> a = [5, 10, 15, 20, 25];
  print(a);
  List<int> a_first_last = getFirstLastNumber(a);
  print(a_first_last);
}
