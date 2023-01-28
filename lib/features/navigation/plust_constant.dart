class PlusConst {
  static bool checkTwoTimes = false;
  static int constant = 1;

  void changeState() {
    checkTwoTimes = !checkTwoTimes;
    print(checkTwoTimes);

    if (checkTwoTimes) {
      constant *= 2;
    } else {
      constant = constant ~/ 2;
    }
    print(constant);
  }
}
