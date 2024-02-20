import 'dart:io';

/// Ask the user for a number and determine whether the number is prime or not.
///
/// Do it using a function

bool determinePrime(int number) {
  List<int> divisors = [];
  for (int divisor = 1; divisor <= number; divisor++) {
    if (number % divisor == 0) {
      divisors.add(divisor);
    }
  }
  return divisors.length == 2;
}

void main() {
  print("Enter a number:");
  int number = int.parse(stdin.readLineSync() ?? "0");
  bool isPrime = determinePrime(number);
  if (isPrime) {
    print("The number is a prime.");
  } else {
    print("The number is not a prime.");
  }
}
