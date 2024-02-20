import 'dart:io';

/// Write a program that asks the user how many Fibonnaci numbers to generate
/// and then generates them. Take this opportunity to think about how you can
/// use functions.
///
/// Make sure to ask the user to enter the number of numbers in the sequence to
/// generate.

void main() {
  print("Enter number of Fibonacci numbers:");
  int a = 0;
  int b = 1;
  int count = 0;
  int num_fib = int.parse(stdin.readLineSync() ?? "0");
  while (count < num_fib) {
    if (count == 0) {
      print(a);
    } else if (count == 1) {
      print(b);
    } else {
      int next_fib = a + b;
      a = b;
      b = next_fib;
      print(next_fib);
    }
    count++;
  }
}
