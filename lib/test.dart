import 'dart:math';

void main() {
  int a = 8;
  BigInt A = BigInt.from(2);
  A = A.pow(a.toInt()) % BigInt.from(199);
  print("$A");
}
