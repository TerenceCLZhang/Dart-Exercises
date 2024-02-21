/// Implement a function that takes as input three variables, and returns the
/// largest of the three. Do this without using the Dart max() function!
///
/// The goal of this exercise is to think about some internals that Dart
/// normally takes care of for us. All you need is some variables and if
/// statements!

void main() {
  int max;
  int a = 1;
  int b = 5;
  int c = 3;

  if (b > a) {
    max = b;
  } else {
    max = a;
  }

  if (c > max) {
    max = c;
  }

  print(max);
}
