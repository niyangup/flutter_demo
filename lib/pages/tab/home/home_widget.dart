import 'dart:math';

int handlePicIndex() {
  var nextInt = Random().nextInt(7) + 16;
  nextInt = nextInt == 19 ? 23 : nextInt;
  return nextInt;
}
